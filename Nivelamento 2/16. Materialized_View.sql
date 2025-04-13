-- Função para verificar se a regconfig está em 'public'
-- Se estiver, como no caso de 'fr', retornará 'public.' concatenado ao nome da regconfig
-- Se não estiver, como no caso de 'english', retornará o nome da regconfig

-- Essa medida se tornou necessária para o funcionamento da view com uma coluna dinâmica para idioma
CREATE OR REPLACE FUNCTION get_tsconfig(lang text)
RETURNS regconfig
LANGUAGE sql
AS '
    SELECT CASE
        WHEN EXISTS (
            SELECT 1
            FROM pg_catalog.pg_ts_config cfg
            JOIN pg_namespace ns ON ns.oid = cfg.cfgnamespace
            WHERE cfg.cfgname = lang AND ns.nspname = ''public''
        )
        THEN (''public.'' || lang)::regconfig
        ELSE lang::regconfig
    END;
';

DROP MATERIALIZED VIEW IF EXISTS search_index;

-- Criação de view materializada que armazena os vetores de texto combinados 
-- de título, conteúdo, autor e tags, com seus respectivos pesos
CREATE MATERIALIZED VIEW search_index AS
SELECT post.id,
	    post.title,
   	 setweight(to_tsvector(get_tsconfig(post.language), post.title), 'A') ||
	    setweight(to_tsvector(get_tsconfig(post.language), post.content), 'B') ||
	    setweight(to_tsvector('simple', author.name), 'C') ||
	    setweight(to_tsvector('simple', coalesce(string_agg(tag.name, ' '))), 'A') as document
FROM post
JOIN author ON author.id = post.author_id
JOIN posts_tags ON posts_tags.post_id = post.id
JOIN tag ON tag.id = posts_tags.tag_id
GROUP BY post.id, author.id;

-- Criação de um índice GIN na coluna 'document' da view materializada, search_index, para otimizar a busca de texto completo.
CREATE INDEX idx_fts_search ON search_index USING gin(document);

-- Consulta para testar o uso do índice GIN na coluna 'document' de search_index
SELECT id as post_id, title
FROM search_index
WHERE document @@ to_tsquery('english', 'Endangered & Species')
ORDER BY ts_rank(document, to_tsquery('english', 'Endangered & Species')) DESC;
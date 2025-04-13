-- A extensão 'pg_trgm' oferece suporte para comparação de similaridade entre strings, 
-- utilizando trigramas (sequências de 3 caracteres).
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- Exemplos de como a função 'similarity' compara a similaridade entre duas strings, 
-- retornando um valor numérico entre 0 e 1. Quanto mais semelhante as duas strings, maior será o valor de similaridade.
SELECT similarity('Something', 'something');
SELECT similarity('Something', 'samething');
SELECT similarity('Something', 'unrelated');
SELECT similarity('Something', 'everything');
SELECT similarity('Something', 'omething');

DROP MATERIALIZED VIEW IF EXISTS unique_lexeme;

-- Criação da view materializada 'unique_lexeme' para armazenar os lexemas extraídos da consulta
-- Usa ts_stat para obter estatísticas sobre o conjunto de lexemas
CREATE MATERIALIZED VIEW unique_lexeme AS
SELECT word FROM TS_STAT(
'SELECT to_tsvector(''simple'', post.title) ||
		  to_tsvector(''simple'', post.content) ||
	  	  to_tsvector(''simple'', author.name) ||
	     to_tsvector(''simple'', coalesce(string_agg(tag.name, '' '')))
FROM public.post
JOIN public.author ON author.id = post.author_id
JOIN public.posts_tags ON posts_tags.post_id = post.id
JOIN public.tag ON tag.id = posts_tags.tag_id
GROUP BY post.id, author.id'
);

-- Criação de um índice GIN na coluna 'word' da view materializada 'unique_lexeme', para otimizar as buscas de similaridade.
CREATE INDEX words_idx ON unique_lexeme USING gin(word gin_trgm_ops);

-- Atualização da view materializada para garantir que os dados estejam atualizados.
REFRESH MATERIALIZED VIEW unique_lexeme;

-- Consulta para encontrar a palavra mais similar a 'speec', com similaridade maior que 0.5.
SELECT word
FROM unique_lexeme
WHERE similarity(word, 'speec') > 0.5
ORDER BY word <-> 'speec'
LIMIT 1;
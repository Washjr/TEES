-- Seleciona os IDs e títulos dos posts que correspondem a uma busca full-text
SELECT pid, p_title
FROM (
  -- Subconsulta que monta o vetor de busca para cada post
  SELECT 
    post.id as pid,                                 
    post.title as p_title,                          
    -- Constrói um vetor de texto combinando título, conteúdo, nome do autor e tags
    to_tsvector(post.title) ||
    to_tsvector(post.content) ||
    to_tsvector(author.name) ||
    to_tsvector(coalesce(string_agg(tag.name, ' '))) AS document
  FROM post
    JOIN author ON author.id = post.author_id         
    JOIN posts_tags ON posts_tags.post_id = post.id   
    JOIN tag ON tag.id = posts_tags.tag_id            
  GROUP BY post.id, author.id                         
) p_search
-- Filtro para buscar documentos que contenham as palavras "Endangered" e "Species"
WHERE p_search.document @@ to_tsquery('Endangered & Species');

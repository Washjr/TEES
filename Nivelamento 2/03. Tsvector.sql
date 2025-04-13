-- Constrói um vetor de texto para busca full-text combinando várias colunas (título, conteúdo, autor e tags)
SELECT 
  to_tsvector(post.title) ||                                
  to_tsvector(post.content) ||                              
  to_tsvector(author.name) ||                               
  to_tsvector(coalesce((string_agg(tag.name, ' ')), ''))    -- Agrupa as tags do post e converte para vetor de busca
  AS document                                               
FROM post
  JOIN author ON author.id = post.author_id         
  JOIN posts_tags ON posts_tags.post_id = post.id   
  JOIN tag ON tag.id = posts_tags.tag_id            
GROUP BY post.id, author.id;  -- Agrupa por ID de post e autor para que string_agg funcione corretamente

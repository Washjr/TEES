-- Seleciona os dados combinando título, conteúdo, nome do autor e tags como um único "documento" textual
SELECT 
  post.title || ' ' ||                     
  post.content || ' ' ||                   
  author.name || ' ' ||                    
  coalesce((string_agg(tag.name, ' ')), '') as document  -- Agrupa os nomes das tags separados por espaço; usa COALESCE para evitar NULL
FROM post
  JOIN author ON author.id = post.author_id         
  JOIN posts_tags ON posts_tags.post_id = post.id   
  JOIN tag ON tag.id = posts_tags.tag_id            
GROUP BY post.id, author.id;  -- Agrupa por post e autor para usar string_agg corretamente, garantindo um resultado por post

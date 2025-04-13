-- Criação de um documento de busca, onde cada entrada tem uma configuração de idioma própria para título e conteúdo

-- Usa o cast regconfig, o tipo de configuração de idioma espeardo, 
-- já que o Postgres não faz o cast automático em colunas como o post.language

-- Usa a configuração simple, que transforma as palavras em tokens sem alterar nada, para nome do autor e tags
SELECT to_tsvector(post.language::regconfig, post.title) ||
   	to_tsvector(post.language::regconfig, post.content) ||
   	to_tsvector('simple', author.name) ||
   	to_tsvector('simple', coalesce((string_agg(tag.name, ' ')), '')) as document
FROM post
JOIN author ON author.id = post.author_id
JOIN posts_tags ON posts_tags.post_id = post.id
JOIN tag ON tag.id = posts_tags.tag_id
GROUP BY post.id, author.id;
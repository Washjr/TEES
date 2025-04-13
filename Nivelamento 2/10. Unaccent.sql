-- Uso da extensão do Postgres 'unaccent' para remoção de acentos de uma string ou de um documento
-- Uma técnica que funciona, mas consome muitos recursos
CREATE EXTENSION IF NOT EXISTS unaccent;
SELECT unaccent('èéêë');

SELECT to_tsvector(post.language::regconfig, unaccent(post.title)) ||
   	to_tsvector(post.language::regconfig, unaccent(post.content)) ||
   	to_tsvector('simple', unaccent(author.name)) ||
   	to_tsvector('simple', unaccent(coalesce(string_agg(tag.name, ' '))))
FROM post
JOIN author ON author.id = post.author_id
JOIN posts_tags ON posts_tags.post_id = post.id
JOIN tag ON tag.id = posts_tags.tag_id
GROUP BY post.id, author.id;

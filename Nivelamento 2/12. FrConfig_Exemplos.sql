-- Exemplos de remoção de acentuação, com 'unaccent' e com a regconfig customizada 'fr',
-- que mostram como essa remoção pode fazer uma palavra deixar de ser uma stop word
SELECT to_tsvector('french', 'il était une fois');
SELECT to_tsvector('french', unaccent('il était une fois'));
SELECT to_tsvector('fr', 'il était une fois');
SELECT to_tsvector('fr', 'Hôtel') @@ to_tsquery('hotels') as RESULT;

-- Alteração no quarto post, do idioma 'french' para o recém criado 'fr', para que seja testado no documento a seguir
UPDATE post
SET language = 'fr'
WHERE id = 4;

-- Mesmo tipo de documento do script 7. Idiomas, para teste do regconfig 'fr'
SELECT to_tsvector(post.language::regconfig, post.title) ||
   	to_tsvector(post.language::regconfig, post.content) ||
   	to_tsvector('simple', author.name) ||
   	to_tsvector('simple', coalesce((string_agg(tag.name, ' ')), '')) as document
FROM post
JOIN author ON author.id = post.author_id
JOIN posts_tags ON posts_tags.post_id = post.id
JOIN tag ON tag.id = posts_tags.tag_id
GROUP BY post.id, author.id;
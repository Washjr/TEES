-- Inserção de post com o idioma 'french' para testar formas de ignorar os acentos
INSERT INTO post (id, title, content, author_id, language)
VALUES (4, 'il était une fois', 'il était une fois un hôtel ...', 2,'french');

-- Inserção de uma tag correspondente ao post, para que o group by não remova a linha do documento
INSERT INTO posts_tags (post_id, tag_id)
VALUES (4, 2);
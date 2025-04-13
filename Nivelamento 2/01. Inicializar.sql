CREATE TABLE author(
   id SERIAL PRIMARY KEY,          -- ID auto-incrementado para o autor
   name TEXT NOT NULL              -- Nome do autor (obrigatório)
);

CREATE TABLE post(
   id SERIAL PRIMARY KEY,          -- ID auto-incrementado para o post
   title TEXT NOT NULL,            -- Título do post (obrigatório)
   content TEXT NOT NULL,          -- Conteúdo do post (obrigatório)
   author_id INT NOT NULL          -- Referência ao autor (chave estrangeira)
       REFERENCES author(id)       -- Garante integridade referencial com 'author'
);

CREATE TABLE tag(
   id SERIAL PRIMARY KEY,          -- ID auto-incrementado para a tag
   name TEXT NOT NULL              -- Nome da tag (obrigatório)
);

CREATE TABLE posts_tags(
   post_id INT NOT NULL            -- ID do post (chave estrangeira)
       REFERENCES post(id),
   tag_id INT NOT NULL             -- ID da tag (chave estrangeira)
       REFERENCES tag(id)
);


INSERT INTO author (id, name)
VALUES (1, 'Pete Graham'),
   	(2, 'Rachid Belaid'),
   	(3, 'Robert Berry');

INSERT INTO tag (id, name)
VALUES (1, 'scifi'),
   	(2, 'politics'),
   	(3, 'science');

INSERT INTO post (id, title, content, author_id)
VALUES (1, 'Endangered species',
    	'Pandas are an endangered species', 1 ),
   	(2, 'Freedom of Speech',
    	'Freedom of speech is a necessary right', 2),
   	(3, 'Star Wars vs Star Trek',
    	'Few words from a big fan', 3);

INSERT INTO posts_tags (post_id, tag_id)
VALUES (1, 3),  -- Post 1 tem a tag "science"
       (2, 2),  -- Post 2 tem a tag "politics"
       (3, 1);  -- Post 3 tem a tag "scifi"
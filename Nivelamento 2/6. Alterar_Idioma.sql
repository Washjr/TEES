-- Adição de coluna na tabela "post" para indicar o idioma do texto.
-- Isso permite gerar o tsvector com base no idioma correto
ALTER TABLE post ADD language text NOT NULL DEFAULT('english');
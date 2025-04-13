/* Não funciona, pois o Postgres precisava reconhecer com antecedência o campo language::reconfig

CREATE INDEX idx_fts_post ON post
USING gin(
	setweight(to_tsvector(language::regconfig, title), 'A') ||
   setweight(to_tsvector(language::regconfig, content), 'B')
);
*/

-- Adição de coluna para armazenar um vetor de texto
ALTER TABLE post ADD COLUMN IF NOT EXISTS content_vector tsvector;

-- Atualização da coluna 'content_vector' com os vetores de texto de 'title' e 'content', com seus respectivos pesos
UPDATE post
SET content_vector =
  setweight(to_tsvector(language::regconfig, title), 'A') ||
  setweight(to_tsvector(language::regconfig, content), 'B');

-- Criação do índice GIN na coluna 'content_vector' para otimizar a busca de texto.
CREATE INDEX idx_fts_post1 ON post USING GIN(content_vector);

-- Exemplo de uso
SELECT * FROM post
WHERE content_vector @@ to_tsquery('english', 'star');
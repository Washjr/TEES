-- Exemplo de como um texto é convertido em tsvector usando três configurações diferentes:
-- 'english' e 'french' aplicam stemming e removem stop words conforme o idioma;
-- 'simple' apenas tokeniza, sem aplicar stemming ou remover stop words.

-- stemming é o processo de reduzir palavras a sua raiz, 
-- stop words são palavras que podem ser ignoradas

SELECT to_tsvector('english', 'We are running');
SELECT to_tsvector('french', 'We are running');
SELECT to_tsvector('simple', 'We are running');
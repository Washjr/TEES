-- Converte a frase em um vetor de termos para busca textual
SELECT to_tsvector('Try not to become a man of success, but rather try to become a man of value');

-- Mostra duas formas de criar uma tsquery, que podem gerar resultados diferentes
-- A função reduz a palavra a seu lexema, e o cast não 
SELECT 'dream'::tsquery, to_tsquery('dream');
SELECT 'impossible'::tsquery, to_tsquery('impossible');

-- Exemplos de verificação de palavras no vetor de termos de uma frase
SELECT to_tsvector('If you can dream it, you can do it') @@ 'dream';
SELECT to_tsvector('It''s kind of fun to do the impossible') @@ 'impossible';
SELECT to_tsvector('It''s kind of fun to do the impossible') @@ to_tsquery('impossible');

-- Exemplos de verificação com operadores lógicos: !, &, |, *
SELECT to_tsvector('If the facts don''t fit the theory, change the facts') @@ to_tsquery('! fact');
SELECT to_tsvector('If the facts don''t fit the theory, change the facts') @@ to_tsquery('theory & !fact');
SELECT to_tsvector('If the facts don''t fit the theory, change the facts') @@ to_tsquery('fiction | theory');
SELECT to_tsvector('If the facts don''t fit the theory, change the facts') @@ to_tsquery('theo:*');




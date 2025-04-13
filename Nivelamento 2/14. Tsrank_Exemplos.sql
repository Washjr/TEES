SELECT to_tsvector('This is an example of document');

-- Exemplos de uso do 'ts_rank', definindo relevância, com base na correspondência entre o vetor e a consulta
SELECT ts_rank(to_tsvector('This is an example of document'), to_tsquery('example | document')) as relevancy;
SELECT ts_rank(to_tsvector('This is an example of document'), to_tsquery('example')) as relevancy;
SELECT ts_rank(to_tsvector('This is an example of document'), to_tsquery('example | unkown')) as relevancy;
SELECT ts_rank(to_tsvector('This is an example of document'), to_tsquery('example & document')) as relevancy;
SELECT ts_rank(to_tsvector('This is an example of document'), to_tsquery('example & unknown')) as relevancy;
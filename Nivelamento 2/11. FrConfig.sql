-- Construção de uma nova configuração de busca textual, 
-- uma regconfig, customizada com suporte a caracteres não acentuados

-- Baseada na regconfig existente para o francês
CREATE TEXT SEARCH CONFIGURATION fr ( COPY = french );

-- 'hword' representa a palavra base ou raiz de uma palavra 
-- 'hword_part' refere-se a partes relevantes de um 'hword'
-- 'word' é a unidade básica de texto durante a análise lexical
ALTER TEXT SEARCH CONFIGURATION fr ALTER MAPPING
FOR hword, hword_part, word WITH unaccent, french_stem;
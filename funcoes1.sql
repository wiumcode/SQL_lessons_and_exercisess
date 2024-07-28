-- Media
SELECT AVG(valor)
FROM pedidos;

-- arredondar valores (para mais proximo)
SELECT ROUND(AVG(valor))
FROM pedidos;

-- Arredondar para cima
SELECT CEIL(3/10);
-- Arredondar para baixo
SELECT FLOOR(3/10);

-- Valor maix alto
SELECT max(valor)
FROM pedidos;

-- Valor mais baixo
SELECT MIN(valor)
FROM pedidos;

-- Contar quantidade 
SELECT COUNT(id)
FROM pedidos;

-- contar total de valores
SELECT SUM(valor)
FROM pedidos;

-- Pegar partes de um string
SELECT SUBSTRING(clientes.nome,1,3)
FROM clientes;

-- Juntar Strings
SELECT CONCAT(nome, '-', cidade) AS cliente_cidade
FROM clientes;

UPDATE clientes SET clientes_cidade = CONCAT(nome, '-', cidade);

-- Missao: Adicionar coluna com a primeira letra de cada cliente

ALTER TABLE clientes
ADD primeira_letra_nome CHAR;

UPDATE clientes SET primeira_letra_nome = SUBSTRING(nome,1,1);

SELECT * FROM clientes;

-- CAPS e nao caps
SELECT UPPER(nome) AS nome_upper, LOWER(cidade) AS cidade_lower
FROM clientes;

-- Missão: Usar exemplos de AVG, ROUND, CEIL, FLOOR, MAX, MIN, COUNT, SUM, SUBSTRING, CONCAT, UPPER, LOWER




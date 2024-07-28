CREATE TABLE colaboradores(
id NUMERIC,
nome CHARACTER VARYING (250),
morada CHARACTER VARYING (100),
departamento CHARACTER VARYING (100),
titulo CHARACTER VARYING (100),
anos_de_empresa NUMERIC,
salario NUMERIC
);

CREATE TABLE clientes(
id NUMERIC,
nome VARCHAR (100),
morada VARCHAR (100),
industria VARCHAR (100),
duracao_contrato_meses NUMERIC,
valor NUMERIC
);
 
INSERT INTO colaboradores (id, nome, morada, departamento, titulo, anos_de_empresa, salario)
VALUES
(1, 'joao miguel', 'rua da republica', 'it', 'it suporte', 2, 1400),
(2, 'joana santos', 'rua 25 de abril', 'suporte', 'suporte tecnico', 3, 1200),
(3, 'pedro duarte', 'rua da juventude', 'engenharia', 'software developer', 4, 2600),
(4, 'luis sousa', 'avenida da liberdade', 'vendas', 'director de vendas', 5, 3800),
(5, 'francisca monteiro', 'avenida das lebres', 'recursos humanos', 'recrutamento', 5, 1600),
(6, 'andre fonseca', 'rua fernando pessoa', 'engenharia', 'manager', 6, 3100),
(7, 'madalena soares', 'avenida principal', 'financas', 'contabilista', 3, 2100),
(8, 'antonio cardoso', 'rua principal', 'administracao', 'ceo', 6, 5000),
(9, 'catia matias', 'avenida camoes', 'administracao', 'secretaria', 2, 900);

INSERT INTO clientes (id, nome, morada, industria, duracao_contrato_meses, valor)
VALUES
(1, 'limpezas e arumacoes lda', 'avenida dos aliados', 'limpezas', '12', '3000'),
(2, 'rei dos frangos lda', 'rua agusta', 'restauracao', '18', '4500'),
(3, 'sociedade alberto e martins', 'avenida da liberdade', 'direito', '24', '9000'),
(4, 'quasi-bit telecom', 'rua dos pescadores', 'telecomunicacoes', '6', '2000'),
(5, 'cao de guarda SA', 'avenida central', 'seguranca', '12', '5000'),
(6, 'amigo informatico lda', 'rua direita', 'it', '18', '6000'),
(7, 'hoteis lopes', 'rua do comercio', 'hotelaria', '6', '2500');

SELECT * FROM colaboradores;
SELECT * FROM clientes;
SELECT * FROM departamento;
SELECT * FROM vendas;



-- MISSAO: criar exemplos usando os 3 joins. Inner, Left e Right
-- Inner join
SELECT clientes.id, clientes.nome, clientes.valor, colaboradores.nome, colaboradores.id
FROM clientes
INNER JOIN colaboradores
ON clientes.id = colaboradores.id
GROUP BY clientes.id, clientes.nexatoome, clientes.valor, colaboradores.nome, colaboradores.id;

-- Full JOIN
SELECT clientes.id, clientes.nome, colaboradores.id, colaboradores.nome 
FROM Clientes
JOIN colaboradores
ON clientes.id = colaboradores.id;

-- A left join B
SELECT clientes.id, clientes.nome, colaboradores.id, colaboradores.nome 
FROM clientes
LEFT JOIN colaboradores
ON clientes.id = colaboradores.id;

-- A Right Join B
SELECT clientes.id, clientes.nome, colaboradores.id, colaboradores.nome 
FROM clientes
RIGHT JOIN colaboradores
ON clientes.id = colaboradores.id;

-- quantos colaboradoes tem cada deparamento:
SELECT departamento, COUNT(nome) AS total
FROM colaboradores
GROUP BY departamento;

-- quantos colaborares tem 5 anos de empresa:
SELECT id, nome, anos_de_empresa
FROM colaboradores
WHERE anos_de_empresa > 4
group by id, nome, anos_de_empresa;

-- salarios ordenados:
SELECT id, nome, salario
FROM colaboradores
ORDER BY salario;

SELECT id, nome, salario
FROM colaboradores
ORDER BY salario DESC;

-- departamentos ordenados:
SELECT departamento
FROM colaboradores
ORDER BY departamento;

SELECT departamento
FROM colaboradores
ORDER BY departamento DESC;

-- departamentos ordenados SEM REPETICAO:
SELECT distinct departamento
FROM colaboradores
ORDER BY departamento;

-- quantos colaborares tem 5 anos de empresa:
SELECT COUNT(id), anos_de_empresa
FROM colaboradores
WHERE anos_de_empresa >= 5
GROUP BY anos_de_empresa;

SELECT * FROM colaboradores;

-- Missão: Usar exemplos de AVG, ROUND, CEIL, FLOOR, MAX, MIN, COUNT, SUM, SUBSTRING, CONCAT, UPPER, LOWER

-- AVG
SELECT AVG(salario)
FROM Colaboradores;

-- ROUND / CEIL / FLOOR
SELECT ROUND(AVG(salario)) AS media_salario_arredondado
FROM colaboradores;

SELECT CEIL(AVG(salario)) AS media_salario_arredondando_cima
FROM colaboradores;

SELECT FLOOR(AVG(salario)) AS media_salario_arredondando_baixo
FROM colaboradores;

-- MAX / MIN
SELECT nome, salario
FROM colaboradores
WHERE salario = (SELECT MAX(salario) FROM colaboradores);

SELECT nome, salario
FROM colaboradores
WHERE salario = (SELECT MIN(salario) FROM colaboradores);

-- COUNT / SUM
SELECT COUNT(id)
FROM colaboradores;

SELECT SUM(salario)
FROM colaboradores;

-- SUBSTRING
SELECT SUBSTRING(departamento,1,3)
FROM colaboradores;

-- CONCAT
SELECT CONCAT(nome, ' - ', titulo) AS nome_titulo
FROM colaboradores;

-- UPPER / LOWER
SELECT UPPER(nome) AS upper_nome, LOWER(morada) AS Lower_morada
FROM colaboradores;

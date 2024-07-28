CREATE DATABASE loja_virtual;

USE loja_virtual;

CREATE TABLE clientes (
  id INT,
  nome VARCHAR(50),
  cidade VARCHAR(50)
);

CREATE TABLE pedidos (
  id INT,
  cliente_id INT,
  data DATE,
  valor DECIMAL(10,2)
);

INSERT INTO clientes VALUES (1, 'João', 'São Paulo');
INSERT INTO clientes VALUES (2, 'Maria', 'Rio de Janeiro');
INSERT INTO clientes VALUES (3, 'José', 'Salvador');
INSERT INTO clientes VALUES (4, 'Ana', 'Belo Horizonte');
INSERT INTO clientes VALUES (5, 'Marcio', 'Lisboa');
INSERT INTO clientes VALUES (6, 'Willem', 'Lisboa');

INSERT INTO pedidos VALUES (1, 1, '2022-01-01', 100.0);
INSERT INTO pedidos VALUES (2, 1, '2022-01-02', 200.0);
INSERT INTO pedidos VALUES (3, 2, '2022-01-02', 150.0);
INSERT INTO pedidos VALUES (4, 3, '2022-01-03', 50.0);
INSERT INTO pedidos VALUES (5, 4, '2022-01-04', 75.0);
INSERT INTO pedidos VALUES (6, 2, '2022-02-20', 25.0);
INSERT INTO pedidos VALUES (7, 2, '2022-03-15', 250.0);
INSERT INTO pedidos VALUES (8, 42, '2022-03-15', 250.0);
INSERT INTO pedidos VALUES (9, 42, '2022-03-15', 250.0);

SELECT * FROM pedidos;
SELECT * FROM clientes;

-- MISSAO: criar exemplos usando os 3 joins. Inner, Left e Right

-- INNER JOIN
-- Quero saber nome e valor
SELECT clientes.nome, pedidos.valor
FROM clientes
INNER JOIN pedidos
ON clientes.id = pedidos.cliente_id;

-- LEFT JOIN
-- Quero ver data de pedidos em clientes
SELECT clientes.id, clientes.nome, clientes.cidade, pedidos.data
FROM clientes
LEFT JOIN pedidos
ON clientes.id = pedidos.cliente_id;

-- RIGHT JOIN
-- quero ver o nome e cidade dos clientes para alem do cliente_id, data e valor em pedidos
SELECT clientes.nome, clientes.cidade, pedidos.cliente_id, pedidos.data, pedidos.valor
FROM clientes
RIGHT JOIN pedidos
ON clientes.id = pedidos.cliente_id;

-- Formula:
SELECT *
FROM clientes
INNER JOIN pedidos
ON clientes.id = pedidos.cliente_id;

SELECT *
FROM clientes
LEFT JOIN pedidos
ON clientes.id = pedidos.cliente_id;

SELECT *
FROM clientes
RIGHT JOIN pedidos
ON clientes.id = pedidos.cliente_id;

-- Com condicoes
SELECT *
FROM clientes
LEFT JOIN pedidos  
ON clientes.id = pedidos.cliente_id
WHERE cidade = 'Lisboa';

SELECT *
FROM clientes
RIGHT JOIN pedidos
ON clientes.id = pedidos.cliente_id
WHERE valor >= 200

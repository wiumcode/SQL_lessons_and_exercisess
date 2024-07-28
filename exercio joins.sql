SELECT * FROM clientes;

SELECT clientes.nome, pedidos.valor
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id;

-- A Join Inner B
SELECT clientes.id, clientes.nome, SUM(pedidos.valor) AS soma_total, COUNT(pedidos.valor) AS quantidade_pedidos
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.id, clientes.nome;

-- A left join B
-- IFNULL subsitui o NULL por 0
SELECT clientes.id, clientes.nome, clientes.cidade, IFNULL( SUM(pedidos.valor), 0) AS soma_total, COUNT(pedidos.valor) AS quantidade_pedidos
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.id, clientes.nome, clientes.cidade;

-- Missao: Quantidade de pedidos p/ cidade
SELECT clientes.cidade, COUNT(pedidos.id)
FROM clientes
LEFT JOIN pedidos ON pedidos.cliente_id = clientes.id
GROUP BY clientes.cidade;

-- A Right Join B
SELECT clientes.id, clientes.nome, clientes.cidade, IFNULL( SUM(pedidos.valor), 0) AS soma_total, COUNT(pedidos.valor) AS quantidade_pedidos
FROM clientes
RIGHT JOIN pedidos ON clientes.id = pedidos.cliente_id
GROUP BY clientes.id, clientes.nome, clientes.cidade;

DROP TABLE pedidos;
DROP TABLE clientes;

-- MISSAO:
-- criar exemplos usando os 3 joins. Inner, Left e Right

-- A Join Inner B

-- A left join B

-- A Right Join B

SELECT DISTINCT clientes.id, clientes.nome, pedidos.data
FROM clientes 
INNER JOIN pedidos ON clientes.id = pedidos.cliente_id
WHERE pedidos.data <= '2022-01-30' AND pedidos.data >= '2022-01-01'
GROUP BY clientes.id, clientes.nome, pedidos.data;



SELECT * FROM customers;

UPDATE customers SET street = 'rua feliz' WHERE id = 1;

UPDATE customers SET credit_limit = 100 WHERE state = 'RS' AND credit_limit < 1000;

ALTER TABLE clientes
ADD cliente_cidade VARCHAR (100);

SELECT * FROM clientes;

UPDATE clientes SET cliente_cidade = CONCAT(nome, '-', cidade);UP

ALTER TABLE clientes
DROP COLUMN cliente_cidade;
DROP COLUMN cliente_cidade;
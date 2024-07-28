CREATE TABLE fornecedores(
id NUMERIC,
nome VARCHAR (100),
ramo VARCHAR (100)
);

INSERT INTO fornecedores (id, nome, ramo) VALUES (1, 'amazon', 'tecnologia');
INSERT INTO fornecedores (id, nome, ramo) VALUES (2, 'netflix', 'entertenimento');
INSERT INTO fornecedores (id, nome, ramo) VALUES (3, 'apple', 'telecomunicacoes');

SELECT * FROM fornecedores;

SELECT * FROM customers;

CREATE TABLE customers_vip (
  id NUMERIC PRIMARY KEY,
  name CHARACTER VARYING (255),
  street CHARACTER VARYING (255),
  city CHARACTER VARYING (255),
  state CHAR (2),
  credit_limit NUMERIC
);

SELECT * FROM customers;

INSERT INTO customers_vip (id, name, street, city, state, credit_limit)
SELECT * FROM customers WHERE credit_limit > 1000;

SELECT * FROM customers_vip;

-- Commentar o processo em todas as linhas
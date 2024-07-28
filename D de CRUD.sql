SELECT * FROM customers;

-- Apenas apaga o que foi especificado
DELETE FROM customers WHERE credit_limit < 1000;

-- Linhas
-- Delete todos as linhas (devido a ausencia de especificacao)
DELETE FROM customers;

-- Tabelas
-- Apaga tabela inteira SE ela estiver VAZIA
DROP TABLE customers;

-- Apaga as Linhas & Tabela
DROP TABLE customers CASCADE;

SELECT * FROM products;
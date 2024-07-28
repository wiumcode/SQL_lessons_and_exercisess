-- START TRANSACTIOM, COMMIT, ROLLBACK

CREATE SCHEMA Padaria;

USE Padaria;

CREATE TABLE produtos(
id INT PRIMARY KEY auto_increment,
nome VARCHAR (100),
preco decimal (10,2)
);

START transaction;
INSERT INTO produtos(nome, preco) VALUES
('pastel de nata', 1);
COMMIT;

DELETE FROM produtos;
SELECT * FROM produtos;

START TRANSACTION;
INSERT INTO produtos(nome, preco) VALUES
('galao', 1.5);
INSERT INTO produtos(nome, preco) VALUES
('queque', 2);
ROLLBACK;

START TRANSACTION;
INSERT INTO produtos(nome, preco) VALUES
('galao', 1.5);
INSERT INTO produtos(nome, preco) VALUES
('queque', 2);
SELECT SUM(preco) FROM produtos;
ROLLBACK;

INSERT INTO produtos(nome, preco) VALUES
('pastel de nata', 1);

START TRANSACTION;
ALTER TABLE produtos ADD quantidade_vendas INT;
UPDATE produtos SET quantidade_vendas = 100;
UPDATE produtos SET preco = 1.80 WHERE nome LIKE 'pastel de nata';
SELECT preco * quantidade_vendas AS receita
FROM produtos;
ROLLBACK;

SELECT * FROM produtos;

DROP TABLE produtos;

START TRANSACTION;
INSERT INTO produtos(nome, preco, quantidade_vendas) VALUES
('galao', 1.5, 50);
INSERT INTO produtos(nome, preco, quantidade_vendas) VALUES
('queque', 2, 20);
SELECT nome, preco * quantidade_vendas AS receita
FROM produtos;
ROLLBACK;

-- Missao: Usar START TRANSACTION, COMMIT, ROLLBACK

SELECT * FROM film_category;
-- Quero apenas saber quantos filmes da base de dados serao afectados SE:
-- Apagar todos os filmes da categoria 6
-- = 68
-- muitos filmes serao apagados
-- rollback =/= COMMIT
-- para nao apagar os filmes categoria 6 do banco de dados
-- Assim sei quantos sao, sem apaga-los
START TRANSACTION;
DELETE
FROM film_category
WHERE category_id = 6;
ROLLBACK;

-- Chefe pediu para apagar a categoria de filme menos popular, pois é o menos rentavel
-- Ver qual é o tipo de filmes com menos filmes
-- apagalos com o COMMIT
START TRANSACTION;
SELECT category_id, COUNT(film_id) AS film_count
FROM film_category
GROUP BY category_id
ORDER BY film_count ASC;
ROLLBACK;

-- Agora sei que é o categoria 12
-- Posso apagar

START TRANSACTION;
DELETE FROM film_category
WHERE category_id = 12;
COMMIT;

SELECT * FROM film_category;


 


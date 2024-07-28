CREATE SCHEMA zoologico;

CREATE TABLE animais(
id INT PRIMARY KEY AUTO_INCREMENT,
nome_animal VARCHAR (100),
tipo_animal VARCHAR (100),
dono VARCHAR (100)
);

USE zoologico;

SELECT * FROM animais;

LOAD DATA LOCAL INFILE "C:\Users\Proprietario\Documents\SQL\animais - Folha1.csv"
INTO TABLE animais;

-- Contar quantidade de tipos de animais
SELECT tipo_animal, COUNT(*)
FROM animais
GROUP BY tipo_animal;

SELECT nome_animal, tipo_animal, dono
FROM animais
WHERE tipo_animal = 'cao';

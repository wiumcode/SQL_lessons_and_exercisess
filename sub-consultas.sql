CREATE TABLE compras(
id INT PRIMARY KEY auto_increment,
dono_animal VARCHAR (100),
valor DECIMAL (10,2)
);

INSERT INTO compras (dono_animal, valor)
VALUES
('joao', 200);


('marcio', 100),
('beatriz', 50.50),
('nicolette', 25.1),
('mario', 75.6);

SELECT * FROM compras;
SELECT * FROM animais;

SELECT nome_animal, dono
FROM animais
WHERE dono IN (

SELECT dono_animal
FROM compras
WHERE valor > 70
);

SELECT nome_animal, dono
FROM animais
WHERE dono NOT IN (

SELECT dono_animal
FROM compras
WHERE valor > 70
);

SELECT * FROM compras
WHERE dono_animal NOT IN(
SELECT dono
FROM animais);

SELECT dono
FROM animais
WHERE EXISTS(
SELECT dono_animal
FROM compras
WHERE valor > 500);

SELECT dono
FROM animais
WHERE NOT EXISTS(
SELECT dono_animal
FROM compras
WHERE dono_animal = 'marcio');

-- MISSAO: Usando Schema WORLD:
-- usar o IN, NOT IN, EXISTS, NOT EXISTS

SELECT * FROM city;

SELECT * FROM country;

SELECT * FROM countrylanguage;

-- IN
SELECT * FROM country
WHERE Continent IN (
SELECT Continent, SUM(Population)
FROM country
WHERE SUM(Population) > 10000
GROUP BY Continent
);


SELECT * FROM country
WHERE Continent LIKE 'Europe';

-- NOT IN
 SELECT * FROM country
 WHERE Continent NOT IN ('Europe', 'Oceania');
 
 -- EXISTS
  SELECT Code, Name FROM country
  WHERE EXISTS (
  SELECT CountryCode
  FROM countrylanguage
  WHERE country.code = countrylanguage.CountryCode AND Language = 'English'
  );
  
-- NOT EXISTS
  SELECT Code, Name FROM country
  WHERE NOT EXISTS (
  SELECT CountryCode
  FROM countrylanguage
  WHERE country.code = countrylanguage.CountryCode AND Language = 'Arabic'
  );
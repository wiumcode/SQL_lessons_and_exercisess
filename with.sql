SELECT * FROM countrylanguage;
SELECT * FROM country;


SELECT * FROM country
WHERE Continent IN (
SELECT Continent, SUM(Population)
FROM country
WHERE SUM(Population) > 10000
GROUP BY Continent
);

WITH soma_da_populacao AS (
SELECT Continent, SUM(Population) AS sum_pop_continente
FROM country
GROUP BY Continent
),
quant_linguas AS (
SELECT COUNT(Language) AS count_ling, CountryCode
FROM countrylanguage
WHERE IsOfficial = 'T'
GROUP BY CountryCode
)
SELECT country.Name, quant_linguas.count_ling, country.Continent, soma_da_populacao.sum_pop_continente
 FROM country, soma_da_populacao, quant_linguas
WHERE country.Continent = soma_da_populacao.Continent AND country.Code = quant_linguas.CountryCode;

-- Missao: usar WITH com SCHEMA Sakila

SELECT * FROM city;

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'L%';

WITH L_actors AS (
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name LIKE 'M%'
),
L_filmes AS (
SELECT film_id, title
FROM film
WHERE title LIKE 'M%'
)
SELECT first_name, last_name, title
FROM L_actors
INNER JOIN film_actor ON film_actor.actor_id = L_actors.actor_id
INNER JOIN L_filmes ON L_filmes.film_id = film_actor.film_id;

SELECT country_id, COUNT(city_id) AS quantidade_cidades
FROM city
GROUP BY country_id
ORDER BY quantidade_cidades DESC;

-- paises com mais filmes
WITH paises_quantidade AS (
SELECT country_id, COUNT(city_id) AS quantidade_cidades
FROM city
GROUP BY country_id
),
top_paises AS(
SELECT country_id
FROM paises_quantidade
WHERE quantidade_cidades > 10
)
SELECT country
FROM country
WHERE country_id IN (
SELECT *
FROM top_paises
);

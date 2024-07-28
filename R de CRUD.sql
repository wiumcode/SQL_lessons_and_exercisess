SELECT * FROM customers;

SELECT city, state FROM customers;

SELECT DISTINCT state FROM customers;

SELECT city FROM customers WHERE credit_limit > 500;

SELECT name FROM customers WHERE state = 'RS' AND credit_limit > 1000;

SELECT name FROM customers WHERE state = 'RS' OR credit_limit > 1000;

SELECT * FROM products;

SELECT customers.name, products.name FROM customers, products WHERE customers.id = products.id;

SELECT customers.name AS cliente, products.name AS produto FROM customers, products WHERE customers.id = products.id;

SELECT customers.name AS cliente, products.name AS produto FROM customers, products 

-- Missao: commentar o processo em todas as linhas
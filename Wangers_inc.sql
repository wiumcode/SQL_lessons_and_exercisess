select * FROM clientes;

select * FROM colaboradores;

CREATE TABLE temp AS
SELECT DISTINCT *
FROM clientes;

DROP TABLE clientes;

ALTER TABLE tmp RENAME TO clientes;
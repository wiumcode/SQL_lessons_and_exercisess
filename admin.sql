SELECT * FROM payment;

SELECT * FROM rental;

-- database users
SELECT USER FROM MYSQL.USER;

-- Criar novos usarios
-- localhost - só na maquina deles
CREATE USER 'directores'@'localhost' IDENTIFIED BY 'oscar';

GRANT SELECT ON payment TO 'directores'@'localhost';

GRANT UPDATE ON payment TO 'directores'@'localhost';

GRANT INSERT, DELETE ON payment TO 'directores'@'localhost';

GRANT ALL ON payment TO 'directores'@'localhost';

-- Remover previlegios
REVOKE DELETE ON payment FROM 'directores'@'localhost';

-- Process Monitor
SHOW PROCESSLIST;

-- info sobre as queries
EXPLAIN SELECT * FROM actor WHERE actor_id = 5;

-- Missao usando outro Schema, criar 2 perfis com permisoes diferentes (user, admin)
-- Schema: loja_virtual_2

SELECT * FROM clientes;

SELECT * FROM colaboradores;

-- Dar previlegios para os salarios aos users "contabilidade"
-- Dar Previlegios para clientes aos users "vendas"
-- Dar previlegios para colaboradores aos users "rh"

-- apagar a coluna "salario"
ALTER TABLE colaboradores
DROP COLUMN salario;

-- Criar nova tabela com os salarios dos colaborades (com foreign key para fazer a ligacao)
CREATE TABLE vencimentos(
id INT PRIMARY KEY,
id_colaborador INT,
salario INT,
FOREIGN KEY (id_colaborador) REFERENCES colaboradores(id)
);

INSERT INTO vencimentos (id, id_colaborador, salario)
VALUES
(1, 1, 1400),
(2, 2, 1200),
(3, 3, 2600),
(4, 4, 3800),
(5, 5, 1600),
(6, 6, 3100),
(7, 7, 2100),
(8, 8, 5000),
(9, 9, 900);

SELECT * FROM vencimentos;

-- Dar previlegios para os salarios a user "contabilidade"
-- Dar Previlegios para clientes a user "vendas"
-- Dar previlegios para colaboradores a user "rh"

CREATE USER 'contabilidade'@'localhost' IDENTIFIED BY 'adam_smith1';
GRANT SELECT, UPDATE, INSERT ON vencimentos TO 'contabilidade'@'localhost';


CREATE USER 'vendas'@'localhost' IDENTIFIED BY 'wallstreet_wolf1';
GRANT SELECT, UPDATE, INSERT ON vendas TO 'vendas'@'localhost';

CREATE USER 'rh'@'localhost' IDENTIFIED BY 'we_care_4_u';
GRANT SELECT, UPDATE, INSERT ON colaboradores TO 'rh'@'localhost';

ALTER TABLE colaboradores
MODIFY id INT AUTO_INCREMENT;
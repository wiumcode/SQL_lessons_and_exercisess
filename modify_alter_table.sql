ALTER TABLE clientes
ADD COLUMN telefone VARCHAR(20),
ADD COLUMN profissao VARCHAR(20);

SELECT * FROM clientes;

ALTER TABLE clientes
DROP COLUMN profissao;

-- MISSAO: Actualizar os telefones
UPDATE clientes SET telefone = '123456789' WHERE id = 1;
UPDATE clientes SET telefone = '987654321' WHERE id = 2;
UPDATE clientes SET telefone = '123654789' WHERE id = 3;
UPDATE clientes SET telefone = '987456321' WHERE id = 4;
UPDATE clientes SET telefone = '456123789' WHERE id = 5;
UPDATE clientes SET telefone = '456987321' WHERE id = 6;
UPDATE clientes SET telefone = '753159468' WHERE id = 7;

-- Mudar o tipo de VARCHAR para INT
ALTER TABLE clientes
MODIFY COLUMN telefone INT;

-- mudar para primary key
ALTER TABLE clientes
ADD CONSTRAINT pk_clientes PRIMARY KEY(id);

-- Outra maneira
ALTER TABLE clientes
MODIFY COLUMN id INT PRIMARY KEY;

-- Foreign Key
ALTER TABLE vendas
ADD CONSTRAINT fk_vendas_clientes FOREIGN KEY (cliente_id)
REFERENCES clientes(id),
ADD CONSTRAINT fk_vendas_colaborador FOREIGN KEY (colaborador_id)
REFERENCES colaboradores(id);

SELECT * FROM vendas;

ALTER TABLE vendas
ADD colaborador_id INT;

UPDATE vendas SET colaborador_id = '4' WHERE id = 1;
UPDATE vendas SET colaborador_id = '10' WHERE id = 2;
UPDATE vendas SET colaborador_id = '11' WHERE id = 3;
UPDATE vendas SET colaborador_id = '4' WHERE id = 4;
UPDATE vendas SET colaborador_id = '10' WHERE id = 5;
UPDATE vendas SET colaborador_id = '4' WHERE id = 6;
UPDATE vendas SET colaborador_id = '4' WHERE id = 7;

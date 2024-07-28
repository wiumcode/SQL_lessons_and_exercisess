CREATE SCHEMA loja_virtual_2;

SELECT * FROM vendas;

CREATE TABLE departamento(
id INT PRIMARY KEY,
nome VARCHAR(250) NOT NULL UNIQUE,
descricao VARCHAR(250),
orcamento DECIMAL(10,2)
);

CREATE TABLE colaboradores(
id INT PRIMARY KEY,
nome VARCHAR(250) NOT NULL, 
morada VARCHAR(100),
id_departamento INT,
titulo VARCHAR(100),
anos_de_empresa INT,
salario DECIMAL(10,2),
FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

CREATE INDEX idx_id_deparamento ON colaboradores(id_departamento);
CREATE INDEX idx_salario ON colaboradores(salario);


CREATE TABLE clientes(
id INT PRIMARY KEY,
empresa VARCHAR (100),
poc VARCHAR (100),
morada VARCHAR (100),
industria VARCHAR (100),
duracao_contrato_meses NUMERIC,
valor NUMERIC
);
 
 INSERT INTO departamento(id, nome, descricao, orcamento) VALUES
 (1, 'IT', 'Apoio informatica', 10000),
 (2, 'Support', 'Apoio cliente', 7500),
 (3, 'Engenharia', 'Desenvolvimento de sistemas', 20000),
 (4, 'Vendas', 'Vendas a clientes', 12500),
 (5, 'Recursos Humanos', 'Recrutamento e Apoio a colaboradores', 15000),
 (6, 'Financas', 'Contabilidade', 10000),
 (7, 'Administracao', 'Gerencia e logistica', 25000);
 
 -- 1: IT, 2: Support, 3: Engenharia, 4: Vendas, 5:recursos humanos, 6:Financas, 7:Administracao
INSERT INTO colaboradores (id, nome, morada, id_departamento, titulo, anos_de_empresa, salario)
VALUES
(1, 'joao miguel', 'rua da republica', 1, 'it suporte', 2, 1400),
(2, 'joana santos', 'rua 25 de abril', 2, 'suporte tecnico', 3, 1200),
(3, 'pedro duarte', 'rua da juventude', 3, 'software developer', 4, 2600),
(4, 'luis sousa', 'avenida da liberdade', 4, 'director de vendas', 5, 3800),
(5, 'francisca monteiro', 'avenida das lebres', 5, 'recrutamento', 5, 1600),
(6, 'andre fonseca', 'rua fernando pessoa', 3, 'manager', 6, 3100),
(7, 'madalena soares', 'avenida principal', 6, 'contabilista', 3, 2100),
(8, 'antonio cardoso', 'rua principal', 7, 'ceo', 6, 5000),
(9, 'catia matias', 'avenida camoes', 7, 'secretaria', 2, 900);

INSERT INTO clientes (id, empresa, poc, morada, industria, duracao_contrato_meses, valor)
VALUES
(1, 'limpezas e arumacoes lda', 'francisco lopes', 'avenida dos aliados', 'limpezas', '12', '3000'),
(2, 'rei dos frangos lda', 'ricardo antunes', 'rua agusta', 'restauracao', '18', '4500'),
(3, 'sociedade alberto e martins', 'joel cardoso', 'avenida da liberdade', 'direito', '24', '9000'),
(4, 'quasi-bit telecom', 'madalena matias', 'rua dos pescadores', 'telecomunicacoes', '6', '2000'),
(5, 'cao de guarda SA', 'andreia goncalves', 'avenida central', 'seguranca', '12', '5000'),
(6, 'amigo informatico lda', 'carlos alberto', 'rua direita', 'it', '18', '6000'),
(7, 'hoteis lopes', 'isabel miranda', 'rua do comercio', 'hotelaria', '6', '2500');

-- MISSAO: Criar Tabela de Vendas com 2 Foreign Keys (Clientes e Colaboradores de Vendas)
-- Primary Key Id da Venda
-- 2 Foreign Keys - Colaborador da Venda
-- Exemplos de modify column

INSERT INTO colaboradores (id, nome, morada, id_departamento, titulo, anos_de_empresa, salario) VALUES
(10, 'adriana marques', 'rua 25 de abril', 4, 'vendedora', 3, 1400),
(11, 'antonaldo andrade', 'avenida da republica', 4, 'vendedor', 4, 1600);

CREATE TABLE vendas(
id INT PRIMARY KEY,
vendedor VARCHAR (100),
cliente_nome VARCHAR (100),
cliente_id INT,
FOREIGN KEY (cliente_id) REFERENCES clientes(id),
FOREIGN KEY (vendedor) REFERENCES colaboradores(nome)
);

CREATE INDEX colaboradores_nome_idx ON colaboradores(nome);

INSERT INTO vendas (id, vendedor, cliente_nome, cliente_id) VALUES
(1, 'luis sousa', 'limpezas e arumacoes lda', '1'),
(2, 'adriana marques', 'rei dos frangos lda', '2'),
(3, 'antonaldo andrade', 'sociedade alberto e martins', '3'),
(4, 'luis sousa', 'quasi-bit telecom', '4'),
(5, 'adriana marques', 'cao de guarda SA', '5'),
(6, 'luis sousa', 'amigo informatico lda', '6'),
(7, 'antonaldo andrade', 'hoteis lopes', '7');

SELECT * FROM colaboradores;


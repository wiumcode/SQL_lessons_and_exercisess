SELECT * FROM autores;

SELECT * FROM editoras;

SELECT * FROM livros;

-- Selecionar nome, cidade_sede e livros de cada editora

SELECT editoras.nome_editora, editoras.cidade_sede, COUNT(livros.titulo) AS total_titulos
FROM editoras
JOIN livros ON editoras.id_editora = livros.id_editora
GROUP BY editoras.id_editora, editoras.nome_editora, editoras.cidade_sede;

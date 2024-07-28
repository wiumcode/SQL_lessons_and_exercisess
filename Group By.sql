SELECT * FROM livros;

SELECT id_autor, count(titulo)
FROM livros
GROUP BY id_autor;

SELECT livros.id_autor, autores.nome_autor, count(livros.titulo)
FROM livros, autores WHERE livros.id_autor = autores.id_autor
GROUP BY livros.id_autor, autores.nome_autor;

SELECT * FROM editoras;

-- editora com mais livros?

SELECT * FROM livros;

SELECT id_editora, count(titulo)
FROM livros
GROUP BY id_editora;

-- MISSAO: saber o nome, o cidade_sede e a quantidade de livros de cada editora

SELECT editoras.nome_editora, editoras.cidade_sede, COUNT(livros.titulo) AS total_titulos
FROM editoras
JOIN livros ON editoras.id_editora = livros.id_editora
GROUP BY editoras.id_editora, editoras.nome_editora, editoras.cidade_sede;
SELECT * FROM livros;

SELECT titulo FROM livros WHERE ano_publicacao > 1900;

SELECT titulo
FROM livros 
WHERE ano_publicacao > 1900
ORDER BY titulo;

SELECT * FROM autores;

SELECT nome_autor
FROM autores
ORDER BY nome_autor;

SELECT * FROM livros;

SELECT titulo, ano_publicacao
FROM livros
ORDER BY ano_publicacao;

SELECT titulo, ano_publicacao
FROM livros
ORDER BY ano_publicacao DESC;

SELECT titulo, ano_publicacao
FROM livros
ORDER BY titulo DESC;

SELECT * FROM autores;

SELECT * FROM autores
ORDER BY pais_origem, nome_autor;

SELECT * FROM autores
ORDER BY pais_origem DESC, nome_autor;
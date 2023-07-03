CREATE DATABASE LIVRARIA;
USE LIVRARIA;

CREATE TABLE LIVROS(
NOME_LIVRO VARCHAR(100),
NOME_AUTOR VARCHAR(100),
SEXO_AUTOR CHAR(1),
PAGINAS INT,
NOME_EDITORA VARCHAR(30),
VALOR_LIVRO FLOAT,
UF_EDITORIA CHAR(2),
ANO_PUBLICACAO INT
);

INSERT INTO LIVROS (NOME_LIVRO, NOME_AUTOR, SEXO_AUTOR, PAGINAS, NOME_EDITORA, VALOR_LIVRO, UF_EDITORIA, ANO_PUBLICACAO) VALUES
    ('Cavaleiro Real', 'Ana Claudia', 'F', 465, 'Atlas', 49.9, 'RJ', 2009),
    ('SQL para leigos', 'João Nunes', 'M', 450, 'Addison', 98, 'SP', 2018),
    ('Receitas Caseiras', 'Celia Tavares', 'F', 210, 'Atlas', 45, 'RJ', 2008),
    ('Pessoas Efetivas', 'Eduardo Santos', 'M', 390, 'Beta', 78.99, 'RJ', 2018),
    ('Habitos Saudáveis', 'Eduardo Santos', 'M', 630, 'Beta', 150.98, 'RJ', 2019),
    ('A Casa Marrom', 'Hermes Macedo', 'M', 250, 'Bubba', 60, 'MG', 2016),
    ('Estacio Querido', 'Geraldo Francisco', 'M', 310, 'Insignia', 100, 'ES', 2015),
    ('Pra sempre amigas', 'Leda Silva', 'F', 510, 'Insignia', 78.98, 'ES', 2011),
    ('Copas Inesqueciveis', 'Marco Alcantara', 'M', 200, 'Larson', 130.98, 'RS', 2018),
    ('O poder da mente', 'Clara Mafra', 'F', 120, 'Continental', 56.58, 'SP', 2017);

SELECT * FROM LIVROS;
SELECT NOME_LIVRO, NOME_EDITORA FROM LIVROS;
SELECT NOME_LIVRO, UF_EDITORIA FROM LIVROS WHERE SEXO_AUTOR = 'M';
SELECT NOME_LIVRO, PAGINAS FROM LIVROS WHERE SEXO_AUTOR = 'F';
SELECT NOME_LIVRO FROM LIVROS WHERE UF_EDITORIA = 'SP';
SELECT * FROM LIVROS WHERE SEXO_AUTOR = 'M' AND (UF_EDITORIA = 'SP' OR UF_EDITORIA = 'RJ');

SELECT COUNT(*) FROM LIVROS;
SELECT COUNT(*), UF_EDITORIA FROM LIVROS GROUP BY UF_EDITORIA;
SELECT COUNT(*), NOME_AUTOR FROM LIVROS GROUP BY NOME_AUTOR HAVING COUNT(*) > 1; -- O HAVING é usado em conjunto com o COUNT(*) para filtrar os resultados de uma consulta SQL que usa GROUP BY.
SELECT NOME_AUTOR, COUNT(*) FROM LIVROS GROUP BY NOME_AUTOR HAVING COUNT(*) > 1; -- Outra forma de projetar, nome_autor primeiro
SELECT NOME_AUTOR, COUNT(*) as QUANTIDADE FROM LIVROS GROUP BY NOME_AUTOR HAVING COUNT(*) > 1; -- Outra forma de projetar 02, USANDO as
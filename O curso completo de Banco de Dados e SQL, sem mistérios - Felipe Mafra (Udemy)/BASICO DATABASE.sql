# Modelagem Básica - ENTIDADE = TABELA #

CLIENTE

NOME - CARACTER(30)
CPF - NUMERO(11)
EMAIL - CARACTER(30)
TELEFONE - CARACTER(30)
ENDERECO - CARACTER(100)
SEXO - CARACTER(1)

# PROCESSOS DE MODELAGEM

-- FASE 01 E FASE 02 - AD ADM DE DADOS
MODELAGEM CONCEITUAL -> RASCUNHO
MODELAGEM LÓGICA -> QUALQUER PROGRAMA DE MODELAGEM (EXEMPLO: BRMODELO)

-- FASE 03 = DBA / AD
MODELAGEM FÍSICA -> SCRIPTS NO BANCO DE DADOS

# INICIANDO A MODELAGEM FÍSICA

-- CRIANDO O BANCO DE DADOS
CREATE DATABASE PROJETO;

-- CONECTANDO AO BANCO
USE PROJETO;

-- INFORMAÇÕES DO BANCO ATUAL
STATUS;

-- CRIANDO A TABELA CLIENTE
CREATE TABLE CLIENTE(
	NOME VARCHAR(30),
    SEXO CHAR(1),
    EMAIL VARCHAR(30),
	CPF INT,
    TELEFONE VARCHAR(30),
    ENDERECO VARCHAR(100)
);

-- VERIFICANDO AS TABELAS DO BANCO
SHOW TABLES;

-- DESCOBRINDO A ESTRUTURA DE UMA TABELA
DESC CLIENTE;

-- INSERINDO NOVA COLUNA EM UMA TABELA EXISTENTE
ALTER TABLE CLIENTE ADD CPF INT(11);-- NO MYSQL NÃO PRECISA ESPECIFICAR O LIMITADOR DO "INT", ENTÃO SERIA APENAS ALTER TABLE CLIENTE ADD CPD INT. ALÉM DISSO, O INT TEM OS PRÓPRIOS LIMITES (RANGE) DA TIPAGEM
-- TALVEZ NEM SEJA RECOMENDADO UTILIZAR INT PARA CPF !!!

# SINTAXE BASICA DE INSERÇÃO -INSERT INTO "TABELA"...

/* FORMA 01 - OMITINDO AS COLUNAS */

INSERT INTO CLIENTE VALUES('JOAO','M','JOAO@GMAIL.COM',988638273,'22923110','MAIA LACERDA - ESTACIO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('CELIA','F','CELIA@GMAIL.COM',541521456,'25078869','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');

INSERT INTO CLIENTE VALUES('JORGE','M',NULL,885755896,'58748895','OSCAR CURY - BOM RETIRO - PATOS DE MINAS - MG');

/* FORMA 02 - COLOCANDO AS COLUNAS */ -- -> FORMA PREFERENCIAL !

INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856);

/* FORMA 03 - INSERT COMPACTO - SOMENTE MYSQL */

INSERT INTO CLIENTE VALUES('ANA','F','ANA@GLOBO.COM',85548962,'548556985','PRES ANTONIO CARLOS - CENTRO - SAO PAULO - SP'),
                          ('CARLA','F','CARLA@TERATI.COM.BR',7745828,'66587458','SAMUEL SILVA - CENTRO - BELO HORIZONTE - MG');
						  
INSERT INTO CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('CLARA','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','883665843',99999999999);-- ERRO DE RANGE

# O COMANDO SELECT 
-- projecao, selecao e juncao

-- SELECT NÃO É SELEÇÃO, É PROJEÇÃO !! PROJETAR ALGO NA TELA, PODE USAR UM as (ALIAS). AO USAR O COMANDO SHOW, ESTAMOS PROJETANDO UM COMANDO DO DICIONÁRIO DO MYSQL
-- PODEMOS PROJETAR COLUNAS DE TABELAS OU COLUNAS DE FUNÇÕES, COMO "SELECT NOW()" OU "SELECT 2+2 AS SOMA"

SELECT NOW() as DATA_HORA, 'FELIPE MAFRA' AS PROFESSOR;

SELECT 'FELIPE MAFRA';

SELECT 'BANCO DE DADOS';

# ALIAS DE COLUNAS

SELECT NOME AS CLIENTE, SEXO, EMAIL FROM CLIENTE; -- TRAZENDO DADOS DO BANCO  EM PROJEÇÃO DE COLUNA E PROJETANDO UM NOVO NOME PARA "NOME"

SELECT NOME, SEXO, EMAIL, ENDERECO FROM CLIENTE; -- TRAZENDO DADOS DO BANCO EM PROJEÇÃO DE COLUNA

SELECT EMAIL, SEXO, ENDERECO, NOME FROM CLIENTE; -- TRAZENDO DADOS DO BANCO  EM PROJEÇÃO DE COLUNA

SELECT EMAIL, SEXO, ENDERECO, NOME, NOW() AS DATA_HORA FROM CLIENTE; -- TRAZENDO DADOS DO BANCO E PROJETANDO UM FUNÇÃO QUE NÃO EXISTE NO BANCO (NOW())

-- SELECT *; -> USE APENAS PARA FINS ACADEMICOS. NUNCA EM AMBIENTE CORPORATIVO !!

SELECT * FROM CLIENTE;

# FILTRANDO DADOS COM WHERE E LIKE

-- QUANDO USAMOS WHERE/LIKE, AGORA SIM ESTAMOS FALANDO DE SELEÇÃO. ESTAMOS SELECIONANDO AS LINHAS

SELECT NOME, TELEFONE FROM CLIENTE;

-- FILTRANDO 

SELECT NOME, SEXO FROM CLIENTE WHERE SEXO = 'M';

SELECT NOME, ENDERECO FROM CLIENTE WHERE SEXO = 'F';

SELECT NOME, SEXO FROM CLIENTE WHERE ENDERECO = 'RJ';

-- UTILIZANDO O LIKE 
-- QUANDO QUEREMOS PERSQUISAR ALGO APROXIMADO DENTRO DE CAMPO, USAMOS O LIKE. VEJA QUE O LIKE ENTRA NO LUGAR DO OPERADO =

SELECT NOME, SEXO FROM CLIENTE WHERE ENDERECO LIKE 'RJ';-- NÃO VAI FUNCIONAR PQ NÃO DEFINIU O %

/* CARACTER CORINGA % -> QUALQUER COISA */

SELECT NOME, SEXO FROM CLIENTE WHERE ENDERECO LIKE '%RJ'; -- COMEÇA COM QUALQUER COISA E TERMINA COM RJ

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE ENDERECO LIKE '%RJ'; -- COMEÇA COM QUALQUER COISA E TERMINA COM RJ

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE ENDERECO LIKE 'OSCAR CURY%'; -- COMEÇA OSCAR CURY E TERMINA COM QUALQUER COISA

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE ENDERECO LIKE '%CENTRO%'; -- COMEÇA COM QUALQUER COISA E TERMINA COM QUALQUER COISA, MAS TEM CENTRO NO MEIO

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE ENDERECO LIKE '%____CENTRO_____%'; 

# OPERADORES LÓGICOS, PERFORMANCE COM OPERADORES LOGICOS 
-- OR -> PARA QUE A SAIDA DA QUERY SEJA VERDADEIRA, BASTA QUE APENAS UMA CONDICAO SEJA VERDADEIRA.
-- AND -> PARA QUE A SAIDA SEJA VERDADEIRA TODAS AS CONDICOES PRECISAM SER VERDADEIRAS.
-- (TABELA VERDADE OU MATEMÁTICA DISCRETA)

/* DICA DE PERFOMACE: QUANDO UTILIZAR "OR", COMEÇAR COM O MAIOR PERCENTUAL. JÁ QUANDO USAR "AND", COMEÇAR COM O MENOR PERCENTUAL. ISSO AJUDA NO GANHO DE PERFOMACE NO BANCO */

# COUNT(*), GROUP BY

/* CONTANDO OS REGISTROS DE UMA TABELA */

SELECT COUNT(*) AS "Quantidade de Registros da Tab. Cliente" FROM CLIENTE;

/* OPERADOR GROUP BY */

SELECT * FROM CLIENTE;

SELECT SEXO, COUNT(*) FROM CLIENTE; -- NÃO ESTÁ CERTO, OU RETORNAR 6 (QUE É O TOTAL)

SELECT SEXO, COUNT(*) FROM CLIENTE GROUP BY SEXO; -- AGORA SIM, RETORNAR 4-M E 2-F

# FILTRANDO VALORES NULOS 
-- IS OU IS NOT NULL

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE sexo = 'F';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE EMAIL = NULL; -- COMANDO NÃO EXISTE

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE EMAIL IS NULL;

SELECT NOME, SEXO, ENDERECO FROM CLIENTE WHERE EMAIL IS NOT NULL;

# UTILIZANDO O UPDATE PARA ATUALIZAR VALORES 

SELECT NOME, EMAIL FROM CLIENTE;

UPDATE CLIENTE SET EMAIL = 'LILIAN@HOTMAIL.COM'; -- ERRADO !!!! VAI ATUALIZAR TODOS OS EMAILS DA TABELA

SELECT NOME, EMAIL FROM CLIENTE;

/* WHERE - VAI SER O SEU MELHOR AMIGO DA VIDA
PRA VIDA INTEIRA */

SELECT * FROM CLIENTE WHERE NOME = 'LILIAN';

UPDATE CLIENTE SET EMAIL = 'LILIAN@IG.COM.BR' WHERE NOME = 'LILIAN';

SELECT NOME, EMAIL FROM CLIENTE;

UPDATE CLIENTE SET EMAIL = 'JORGE@IG.COM.BR' WHERE NOME = 'JORGE';

SELECT NOME, EMAIL FROM CLIENTE;

/*COMMIT E ROLLBACK */ -- --> COMANDOS PARA VOLTAR A ATRAS

# DELETANDO REGISTROS COM A CLAUSULA DELETE, COM CUIDADO !!

DELETE FROM CLIENTE; 

SELECT COUNT(*) FROM CLIENTE; -- TOTAL 6 -- SEMPRE É RECOMENDADO CONTAR OS REGISTROS E SEMPRE FAZER UM SELECT ANTES DO DELETE, SE ESTIVER CERTO APENAS SUSBSTITUA O "SELECT" PELO "DELETE"

SELECT COUNT(*) FROM CLIENTE WHERE NOME = 'ANA'; -- TOTAL DELETADO 1 -- SEMPRE É RECOMENDADO CONTAR OS REGISTROS
 
DELETE FROM CLIENTE WHERE NOME = 'ANA';

SELECT COUNT(*) FROM CLIENTE; -- RESTANTE 5

SELECT 6 - 1; -- PODE CONTAR NO BANCO DE DADOS

SELECT * FROM CLIENTE;

-- OUTRO EXEMPLO

INSERT INTO CLIENTE VALUES('CARLA','F','C.LOPES@UOL.COM',45638854,'4575-0048','RUA COPPER LEAF - WILLIAMSBURG - KITCHENER');

SELECT * FROM CLIENTE;

DELETE FROM CLIENTE WHERE NOME = 'CARLA' OR EMAIL = 'LILIAN@HOTMAIL.COM'; -- VAI DELETAR AS DUAS CARLAS
SELECT * FROM CLIENTE WHERE NOME = 'CARLA' OR EMAIL = 'LILIAN@HOTMAIL.COM'; -- OR TRAZ TODO MUNDO COM PELO MENOS UMA DAS DUAS CONDICOES

SELECT * FROM CLIENTE WHERE NOME = 'CARLA' AND EMAIL = 'C.LOPES@UOL.COM';
DELETE FROM CLIENTE WHERE NOME = 'CARLA' AND EMAIL = 'C.LOPES@UOL.COM'; -- TRAZ APENAS O REGISTRO QUE SATISFACA AS DUAS CONDICOES

SELECT * FROM CLIENTE;

/*  HISTORIA DA MODELAGEM 

DECADA DE 70, EUA - CRISE DO SOFTWARE
FOI A CRISE QUE ATINGIU NAO SOMENTE A AREA DE TECNOLOGIA
MAS TAMBÉM TODAS AS EMPRESAS QUE UTILIZAVAM DE SISTEMAS
TECNOLOGICOS PARA CONTROLAR SEUS NEGOCIOS.

NAQUELA EPOCA, PROGRAMAR ERA UM PROCESSO ARTESANAL.
BASTAVA OLHAR O CODIGO QUE VOCE SABERIA QUEM O
ESCREVEU, TAO POUCOS ERAM OS PROGRAMADORES EACHTAO ARCAICO ERAM
OS METODOS DE PROGRAMACAO. EM UM PRIMEIRO MOMENTO,
OS PROFISSIONAIS DE TI VIRAM A NECESSIDADE DE SE PROGRAMAR
E INICIARAM SUA CAMINHADA, CONSTRUINDO SISTEMAS QUE ATENDIAM
NUM PRIMEIRO MOMENTO, MAS DEPOIS TRAZIAM INFORMACOES ERRADAS,
PROVOCANDO A FALENCIA DE DIVERSAS EMPRESAS. LEMBRE-SE: INFORMACOES
ERRADAS PODEM LEVAR A SUA EMPRESA A FALENCIA, E FOI ISSO QUE ACONTECEU.
ISSO OCORRIA POIS OS PROFISSIONAIS SABIAM PROGRAMAR MAS ENTENDIAM APENAS
DO NEGOCIO DAS EMPRESAS DAS QUAIS FAZIAM PARTE. SER TER O KNOW HOW
DOS DEMAIS NEGOCIOS, OS PROGRAMADORES PROGRAMAVAM VOLTADOS PARA OS
PROCEDIMENTOS, E ESSE FOI UM ERRO MORTAL.

PETER CHEN, VENDO TODO ESSE CENARIO AFIRMOU: NAO PODEMOS CRIAR BANCOS
DE DADOS VOLTADOS PARA PROCEDIMENTOS EMPRESARIAIS, POIS OS PROCEDIMENTOS
SOFREM INTERFERENCIAS EXTERNAS E PODEM SER ALTERADOS. A UNICA COISA
QUE NAO SOFRE ALTERACAO SAO OS DADOS.

POR EXEMPLO, ARMAZENAMOS NO BANCO A VENDA DE JANEIRO, FEVEREIRO E MARCO
O TOTAL DAS VENDAS E O IMPOSTO PAGO AO GOVERNO. 
FAZEMOS ISSO DURANTE MUITO TEMPO. DE UMA HORA PRA OUTRA O GOVERNO
MUDA A ALIQUOTA DO IMPOSTO. COMO FARÁ SENTIDO OS PAGAMENTOS ARMAZENADOS
ANTERIORMENTE? AQUI NOTA-SE QUE ARMAZENAMOS DADOS E ARMAZENAMOS
INFORMACOES CORRESPONDENTES AOS PROCEDIMENTOS EXTERNOS. DEVEMOS
APENAS ARMAZENAR OS DADOS, POIS ELES SAO SUFICIENTES PARA GERAR
A INFORMACAO.

MODELAR É UMA ARTE, ALGO QUE SE APRENDE COM A PRATICA. E VOCES PODEM
SE PERGUNTAR: MAS SE É ALGO QUE SE APRENDE COM A PRATICA, COMO QUEM
ESTA COMEÇANDO, APRENDE?

ASSIM COMO PETER CHEN CRIOU O MODELO DE ENTIDADE E RELACIONAMENTO, O MER,
FORAM CRIADAS FORMAS NORMAIS, QUE SAO DIRETRIZES PARA APLICAR EM
MODELAGEM DE AMBIENTES OLTP OU AMBIENTES TRANSACIONAIS DE BANCOS
DE DADOS.

HOJE TEMOS MAIS DO QUE 3 FORMAS NORMAIS, MAS AO NORMALIZARMOS UM
BANCO ATE A SUA TERCEIRA FORMA, É O SUFICIENTE PARA TER UM
TRABALHO LIMPO E LIVRE DE ERROS. VEREMOS AS TRES FORMAS NORMAIS,
UMA A UMA, DETALHADAMENTE NAS PROXIMAS AULAS.
*/

# PRIMEIRA FORMA NORMAL <-- MUITO IMPORTANTE !!

/*

1 - TODO CAMPO VETORIZADO SE TORNARÁ OUTRA TABELA

[AMARELO, AZUL, LARANJA, VERDE] -> CORES
[KA, FIESTA, UNO, CIVIC]-> CARROS

2 - TODO CAMPO MULTIVALORADO SE TORNARÁ OUTRA TABELA.
QUANDO O CAMPO FOR DIVISÍVEL

3 - TODA TABELA NECESSITA DE PELO MENOS UM CAMPO QUE IDENTIFIQUE <-- REGRA VITAL PARA BD SQL OU NOSQL !!
TODO O REGISTRO COMO SENDO UNICO.
ISSO É O QUE CHAMAMOS DE CHAVE PRIMARIA OU PRIMARY KEY.


/* CADINALIDADE */

/* QUEM DEFINE A CARDINALIDADE É A REGRA DE NEGOCIOS */

/* PRIMEIRO ALGARISMO - OBRIGATORIEDADE 
0 - NAO OBRIGATORIO
1 - OBRIGATORIO

SEGUNDO ALGARISMO - CARDINALIDADE
1 - MAXIMO DE UM
N - MAIS DE UM
*/

CREATE DATABASE COMERCIO;

USE COMERCIO;

SHOW DATABASES; -- --> OPCIONAL

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(30) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE,
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT, 
	RUA VARCHAR(30) NOT NULL,
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE, -- NECESSÁRIO O "UNIQUE" DEVIDO A RELAÇÃO 1 X1

	FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT, 
	TIPO ENUM('RES','COM','CEL') NOT NULL,
	NUMERO VARCHAR(10) NOT NULL,
	ID_CLIENTE INT, -- NÃO É NECESSÁRIO O "UNIQUE" PQ A REALÇÃO É 1 X N

	FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE)
);

/* ENDERECO - OBRIGATORIO 
CADASTRO DE SOMENTE UM.

TELEFONE - NAO OBRIGATORIO
CADASTRO DE MAIS DE UM (OPCIONAL) /*

/*
CHAVE ESTRANGEIRA É A CHAVE PRIMARIA DE UMA TABELA
QUE VAI ATÉ A OUTRA TABELA PARA FAZER REFERENCIA ENTRE
REGISTROS */

/* EM RELACIONAMENTO 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA */

/* EM RELACIONAMENTO 1 X N A CHAVE ESTRANGEIRA FICARA SEMPRE NA
CARDINALIDADE N */

SELECT * FROM CLIENTE;
SELECT * FROM ENDERECO;
SELECT * FROM TELEFONE;

/* JUNCAO -> JOIN */

SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE;

SELECT ID_CLIENTE, BAIRRO, CIDADE
FROM ENDERECO;

+--------+----------------+-----------+
| NOME   | EMAIL          | IDCLIENTE |
+--------+----------------+-----------+
| JOAO   | JOAOA@IG.COM   |         1 |
| CARLOS | CARLOSA@IG.COM |         2 |
| ANA    | ANA@IG.COM     |         3 |
| CLARA  | NULL           |         4 |
| JORGE  | JORGE@IG.COM   |         5 |
| CELIA  | JCELIA@IG.COM  |         6 |
+--------+----------------+-----------+

+------------+----------+----------------+
| ID_CLIENTE | BAIRRO   | CIDADE         |
+------------+----------+----------------+
|          4 | CENTRO   | B. HORIZONTE   |
|          1 | CENTRO   | RIO DE JANEIRO |
|          3 | JARDINS  | SAO PAULO      |
|          2 | ESTACIO  | RIO DE JANEIRO |
|          6 | FLAMENGO | RIO DE JANEIRO |
|          5 | CENTRO   | VITORIA        |
+------------+----------+----------------+

/* NOME, SEXO, BAIRRO, CIDADE */

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJECAO */
FROM CLIENTE, ENDERECO /*ORIGEM */
WHERE IDCLIENTE = ID_CLIENTE; /* JUNCAO */

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SAO PAULO      |
| CLARA  | F    | CENTRO   | B. HORIZONTE   |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | M    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+

/* WHERE = SELECAO */

SELECT NOME, SEXO, BAIRRO, CIDADE 
FROM CLIENTE, ENDERECO 
WHERE IDCLIENTE = ID_CLIENTE
AND SEXO = 'F'; 

+-------+------+---------+--------------+
| NOME  | SEXO | BAIRRO  | CIDADE       |
+-------+------+---------+--------------+
| ANA   | F    | JARDINS | SAO PAULO    |
| CLARA | F    | CENTRO  | B. HORIZONTE |
+-------+------+---------+--------------+

/* WHERE IDCLIENTE = ID_CLIENTE
AND SEXO = 'F'; -> TABELA VERDADE */

INSERT INTO ENDERECO VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',15);

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE;

+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| JOAO   | M    | CENTRO   | RIO DE JANEIRO |
| CARLOS | M    | ESTACIO  | RIO DE JANEIRO |
| ANA    | F    | JARDINS  | SAO PAULO      |
| CLARA  | F    | CENTRO   | B. HORIZONTE   |
| JORGE  | M    | CENTRO   | VITORIA        |
| CELIA  | M    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJECAO */ 
FROM CLIENTE /* ORIGEM */
	INNER JOIN ENDERECO /*JUNCAO */
	ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F'; /* SELECAO */

/* NOME, SEXO, EMAIL, TIPO, NUMERO */

SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM CLIENTE 
INNER JOIN TELEFONE
ON IDCLIENTE = ID_CLIENTE;

/* NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO */

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE 
INNER JOIN ENDERECO
ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

+--------+------+---------+----------------+------+----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO   |
+--------+------+---------+----------------+------+----------+
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 78458743 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 56576876 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 87866896 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 54768899 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 99667587 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 78989765 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 99766676 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 66687899 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 89986668 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 88687909 |
+--------+------+---------+----------------+------+----------+

SELECT C.NOME, C.SEXO, E.BAIRRO, E.CIDADE, T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE;

+--------+------+---------+----------------+------+----------+
| NOME   | SEXO | BAIRRO  | CIDADE         | TIPO | NUMERO   |
+--------+------+---------+----------------+------+----------+
| JORGE  | M    | CENTRO  | VITORIA        | CEL  | 78458743 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 56576876 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | CEL  | 87866896 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | COM  | 54768899 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | RES  | 99667587 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 78989765 |
| ANA    | F    | JARDINS | SAO PAULO      | CEL  | 99766676 |
| JOAO   | M    | CENTRO  | RIO DE JANEIRO | COM  | 66687899 |
| JORGE  | M    | CENTRO  | VITORIA        | RES  | 89986668 |
| CARLOS | M    | ESTACIO | RIO DE JANEIRO | CEL  | 88687909 |
+--------+------+---------+----------------+------+----------+

/* VIEW */

CREATE VIEW RELATORIO AS
SELECT  C.NOME, 
		C.SEXO, 
		C.EMAIL, 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE;

SELECT * FROM RELATORIO;

SHOW TABLES;
SHOW DATABASES;
SHOW VIEW; -- NAO EXISTE

/* APAGANDO UMA VIEW */

DROP VIEW RELATORIO;

/* INSERINDO UM PREFIXO */

CREATE VIEW V_RELATORIO AS
SELECT  C.NOME, 
		C.SEXO, 
		IFNULL(C.EMAIL,'CLIENTE SEM EMAIL') AS "E-MAIL", 
		T.TIPO, 
		T.NUMERO, 
		E.BAIRRO, 
		E.CIDADE, 
		E.ESTADO
FROM CLIENTE C 
INNER JOIN TELEFONE T 
ON C.IDCLIENTE = T.ID_CLIENTE 
INNER JOIN ENDERECO E 
ON C.IDCLIENTE = E.ID_CLIENTE;

SELECT NOME, NUMERO, ESTADO
FROM V_RELATORIO;

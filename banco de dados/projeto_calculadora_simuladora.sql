-- Comando para criar banco de dados
CREATE DATABASE calculadora_simuladora;

-- Utilizar o banco de dados
USE calculadora_simuladora;

-- SQL é a linguagem que utilizamos para realizar consultas
-- SQL Server é o gerenciador de banco de dados

-- /BD Relacionais, onde uma tabela se relaciona com a outra. 
-- EX:. tabela de usuário, e uma tabela de compras feitas por ele.
-- Pesquisar mais sobre o assunto também/

-- Ctrl + K e C Comenta
-- Ctrl + K e U Descomenta 


-- Usuario Simulação
	-- Número da simulação
	-- Nome da pessoa
	-- Descrição da simulação
	-- Data da simulação
CREATE TABLE usuario_simulacao (
    id_simulacao INT NOT NULL,
	nome_pessoa VARCHAR(100) NOT NULL,
	descricao VARCHAR(200),
	data_simulacao DATE NOT NULL
);

-- nomeColuna / TipoDado / Se não permitir nulo, NOT NULL

-- 	id_simulacao INT IDENTITY PRIMARY KEY,
-- Simulação Calculadora Juros 
	-- Número da simulação 
	-- Valor incial
	-- Valor do aporte do mês 
	-- Taxa de juros 
	-- Quantidade de tempo 
	
CREATE TABLE simulacao_calculadora_juros (
	id_simulacao INT IDENTITY PRIMARY KEY,
	valor_inicial DECIMAL(15,2) NOT NULL,
	valor_aporte_mensal DECIMAL(15,2) NOT NULL,
	taxa_juros DECIMAL(10,4) NOT NULL,
	quantidade_tempo INT NOT NULL 
);

-- SELECIONAR TABELAS
SELECT * FROM usuario_simulacao;
-- Selecionar campos específicos 
SELECT nome_pessoa, data_simulacao FROM usuario_simulacao;

SELECT * FROM simulacao_calculadora_juros;

-- INSERIR DADOS NA TABELA 
INSERT INTO usuario_simulacao VALUES (1,'Ricardo Ribeiro','Investimentos', GETDATE());
--	Inserir dados passando a ordem das colunas 																					   AAAA-MM-DD
INSERT INTO usuario_simulacao (id_simulacao, nome_pessoa, descricao, data_simulacao) VALUES (4,'Ricardo Ribeiro','Investimentos', '08/02/2023');

INSERT INTO simulacao_calculadora_juros VALUES (50000, 2000, 9.8, 70);


-- ATUALIZAR UMA TABELA 
UPDATE usuario_simulacao SET data_simulacao = '2023-02-07' WHERE id_simulacao = 2;
-- Atualizando tabela onde o registro for id_simulacao = 4
UPDATE usuario_simulacao SET data_simulacao = '2023-02-07', descricao = 'Casa própria' WHERE id_simulacao = 4;

-- Atualizando tabela onde o registro for id_simulacao 3 e 4
UPDATE usuario_simulacao SET nome_pessoa = 'Eduardo Sales'  WHERE id_simulacao IN(3,4);

-- -- Atualizando toda a tabela
UPDATE usuario_simulacao SET nome_pessoa = 'Ricardo Ribeiro'

-- DELETAR REGISTRO DA TABELA
DELETE FROM simulacao_calculadora_juros WHERE id_simulacao = 2;

DELETE FROM usuario_simulacao WHERE id_simulacao = 2;

-- DELETANDO A TABELA 
DROP TABLE usuario_simulacao;
DROP TABLE simulacao_calculadora_juros;

-- Inserir novo registro
-- Atualizar a data de simulacao do registro 
-- Selecionar apenas data simulacao e nome da pessoa
-- Deletar o registro


-- SELECIONAR TODAS AS COLUNAS DE TODAS AS TABELAS COM JOIN
SELECT *
  FROM usuario_simulacao AS a  
  JOIN simulacao_calculadora_juros AS b  -- JOIN é para juntar   
    ON a.id_simulacao = b.id_simulacao   -- ON é para dizer quais colunas se interligam
 WHERE a.id_simulacao = 4;


-- SELECIONAR COLUNAS QUE EU QUERO COM JOIN
SELECT b.id_simulacao
	   ,a.nome_pessoa
	   ,a.descricao
	   ,a.data_simulacao
	   ,b.valor_inicial
	   ,b.valor_aporte_mensal
	   ,b.taxa_juros
	   ,b.quantidade_tempo
  FROM usuario_simulacao AS a  
  JOIN simulacao_calculadora_juros AS b  -- JOIN é para juntar   
    ON a.id_simulacao = b.id_simulacao   -- ON é para dizer quais colunas se interligam
 WHERE a.id_simulacao = 1;


-- SUBQUERY - Selecionar uma informação à partir do resultado de outra 
-- Select dentro de um select
SELECT * FROM usuario_simulacao 
WHERE id_simulacao = (SELECT MAX(id_simulacao) FROM simulacao_calculadora_juros);

CREATE DATABASE teste_csv; 

USE teste_csv;

CREATE TABLE usuarios (
	nome_usuario VARCHAR(200) NOT NULL,
	ativo BIT NOT NULL,
	data_nascimento DATETIME NOT NULL
);

SELECT * FROM usuarios

BULK INSERT usuarios
FROM 'C:\Users\ricar\Downloads\teste.csv'
   WITH ( FIELDTERMINATOR = ';', ROWTERMINATOR = '\n' );




-- 0 = Falso = Não
-- 1 = Verdadeiro = Sim

CREATE DATABASE algoritimos1
use algoritimos1

-- a) Fazer um algoritmo que leia 1 número e mostre se são múltiplos de 2,3,5 ou nenhum deles
CREATE TABLE a (
numero		INT  NOT NULL
)
 
DECLARE @numero   INT
SET @numero = ((RAND() * 100) + 1) 
PRINT (@numero)
IF (@numero % 2 = 0)
BEGIN
	PRINT('É MULTIPLO DE 2.')
END
ELSE
BEGIN
	PRINT('NÃO É MULTIPLO DE 2.')
END
IF (@numero % 3 = 0)
BEGIN
	PRINT('É MULTIPLO DE 3.')
END
ELSE
BEGIN
	PRINT('NÃO É MULTIPLO DE 3.')
END
IF (@numero % 5 = 0)
BEGIN
	PRINT('É MULTIPLO DE 5.')
END
ELSE
BEGIN
	PRINT('NÃO É MULTIPLO DE 5.')
END

-- b)  Fazer um algoritmo que leia 3 números e mostre o maior e o menor
 
 CREATE TABLE b (
primeiro		INT  NOT NULL,
segundo			INT  NOT NULL,
terceiro		INT  NOT NULL
)
 
DECLARE @primeiro	    INT,
		@segundo		INT,
		@terceiro		INT,
		@maior			INT,
		@menor			INT
SET @primeiro = ((RAND() * 100) + 1)
SET @segundo = ((RAND() * 100) + 1) 
SET @terceiro = ((RAND() * 100) + 1) 
PRINT (@primeiro)
PRINT (@segundo)
PRINT (@terceiro)
IF (@primeiro > @segundo AND @primeiro > @terceiro)
BEGIN
	SET @maior = @primeiro
	PRINT('MAIOR: ')
	PRINT(@maior)
END
IF (@segundo > @primeiro AND @segundo > @terceiro)
BEGIN
	SET @maior = @segundo
	PRINT('MAIOR: ')
	PRINT(@maior)
END
IF (@terceiro > @primeiro AND @terceiro > @segundo)
BEGIN
	SET @maior = @terceiro
	PRINT('MAIOR: ')
	PRINT(@maior)
END
IF (@primeiro < @segundo AND @primeiro < @terceiro)
BEGIN
	SET @menor = @primeiro
	PRINT('MENOR: ')
	PRINT( @menor)
END
IF (@segundo < @primeiro AND @segundo < @terceiro)
BEGIN
	SET @menor = @segundo
	PRINT('MENOR: ')
	PRINT(@menor)
END
IF (@terceiro < @primeiro AND @terceiro < @segundo)
BEGIN
	SET @menor = @terceiro
	PRINT('MENOR: ')
	PRINT(@menor)
END

/* c) Fazer um algoritmo que calcule os 15 primeiros termos da série
  
1,1,2,3,5,8,13,21,...
  
E calcule a soma dos 15 termos */

CREATE TABLE c (
aux			INT  NOT NULL,
primeiro    INT  NOT NULL,
segundo     INT  NOT NULL
)
 
DECLARE @primeiro   INT,
        @segundo    INT,
        @aux        INT,
		@cont        INT
SET @cont = 1
SET @primeiro = 1
SET @segundo = 1
WHILE (@cont <= 15)
BEGIN
    SET @aux = @primeiro + @segundo
    PRINT(@primeiro + @segundo)
    SET @cont = @cont + 1
	SET @primeiro = @segundo
	SET @segundo = @aux
END
  
-- d) Fazer um algoritmo que separa uma frase, colocando todas as letras em maiúsculo e em minúsculo 
--(Usar funções UPPER e LOWER)
CREATE TABLE d (
frase	VARCHAR(30)
)
 
DECLARE @frase   VARCHAR(30)
BEGIN
	SET @frase ='Só mais dois semestres.'
    SET @frase = UPPER(@frase) 
    PRINT(@frase)
    SET @frase = LOWER(@frase)
	PRINT(@frase)
END

-- e) Fazer um algoritmo que inverta uma palavra (Usar a função SUBSTRING)
CREATE TABLE e (
palavra	VARCHAR(8)
)
 
DECLARE @palavra   VARCHAR(8)
BEGIN
	SET @palavra ='crianças'
	PRINT('Palavra: ')
	PRINT(@palavra)
    SET @palavra = (SUBSTRING(@palavra,8,1)+SUBSTRING(@palavra,7,1)+ SUBSTRING(@palavra,6,1)+ SUBSTRING(@palavra,5,1)+ 
				 SUBSTRING(@palavra,4,1) + SUBSTRING(@palavra,3,1) + SUBSTRING(@palavra,2,1) + SUBSTRING(@palavra,1,1))
    PRINT('Palavra invertida: ')
	PRINT(@palavra)
END
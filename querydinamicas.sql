/*
Exercício:
 
Considere a tabela Produto com os seguintes atributos:
Produto (Codigo | Nome | Valor)
Considere a tabela ENTRADA e a tabela SAÍDA com os seguintes atributos:
(Codigo_Transacao | Codigo_Produto | Quantidade | Valor_Total)
Cada produto que a empresa compra, entra na tabela ENTRADA. Cada produto que a empresa vende, entra na tabela SAIDA.
Criar uma procedure que receba um código (‘e’ para ENTRADA e ‘s’ para SAIDA), criar uma exceção de erro para código 
inválido, receba o codigo_transacao, codigo_produto e a quantidade e preencha a tabela correta, com o valor_total de 
cada transação de cada produto.
 
*/
 
create database querydinamicas
use querydinamicas
 
create table produto (
codigo	int not null,
nome	varchar(100) not null,
valor	decimal(7,2) not null
primary key(codigo)
)
 
create table entrada(
codigo_transacao	int not null,
codigo_produto		int not null,
quantidade			int not null,
valor_total			decimal(7,2) not null
primary key(codigo_transacao)
foreign key (codigo_produto) references produto(codigo)
)
 
create table saida(
codigo_transacao	int not null,
codigo_produto		int not null,
quantidade			int not null,
valor_total			decimal(7,2) not null
primary key(codigo_transacao)
foreign key (codigo_produto) references produto(codigo)
)
 
CREATE PROCEDURE sp_produto (@op char(1), @codigo int,
	@nome varchar(100), @valor decimal(7,2),
	@codigo_transacao int, @quantidade int,
	@valor_total decimal(7,2), @saida VARCHAR(MAX) OUTPUT)
AS
	DECLARE @tabela		VARCHAR(20),
			@query		VARCHAR(200),
			@erro		VARCHAR(MAX)
 
	IF (UPPER(@op) = 'E')
	BEGIN
		SET @tabela = 'entrada'
	END
	ELSE       
	BEGIN
	IF (UPPER(@op) = 'S')
		SET @tabela = 'saida'
	END
 
	SET @query = 'INSERT INTO '+@tabela+' VALUES('+
				CAST(@codigo_transacao AS VARCHAR(3))+','''+CAST(@codigo AS VARCHAR(3))+','''+
				CAST(@quantidade AS VARCHAR(3))+','''+CAST(@valor_total AS VARCHAR(3))+''')' 
	PRINT @query

	BEGIN TRY 
		INSERT INTO produto VALUES (@codigo, @nome, @valor)
		EXEC(@query)
		SET @saida = UPPER(@tabela) + ' inserido com sucesso'
	END TRY
	BEGIN CATCH
		SET @erro = ERROR_MESSAGE()
		IF (@erro LIKE '%primary%')
		BEGIN
			RAISERROR('ID já existente', 16, 1)
		END
		ELSE
		BEGIN
			RAISERROR('Falha no armazenamento de dados', 16, 1)
		END
	END CATCH
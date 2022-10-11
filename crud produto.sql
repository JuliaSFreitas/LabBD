create database crudproduto
go
use crudproduto
go
create table produto (
codigo int NOT NULL,
nome varchar(30),
valor_unitario decimal(7,2),
qnt_estoque int
primary key(codigo)
)
 
declare @codigo int,
		@nome varchar(30),
		@valor_unitario decimal(7,2),
		@qnt_estoque int
 
 
CREATE PROCEDURE sp_produto (@op CHAR(1), @codigo INT, @nome VARCHAR(30), @valor_unitario DECIMAL(7,2), @qnt_estoque INT, @saida VARCHAR(MAX) OUTPUT )
AS
	IF (UPPER(@op) = 'D' AND @codigo IS NOT NULL)
	BEGIN
		DELETE produto WHERE codigo = @codigo
		SET @saida = 'Produto Codigo: '+ CAST(@codigo AS VARCHAR(5)) + ' excluida'
	END
	ELSE
	BEGIN
		IF (UPPER(@op) = 'D' AND @codigo IS NULL)
		BEGIN
			--RAISE APPLICATION ERROR
			--RAISERROR(msg, tipo, prioridade)
			RAISERROR('Codigo inválido', 16, 1)
		END
		ELSE
		BEGIN
			IF (UPPER(@op) = 'I')
			BEGIN
				INSERT INTO produto VALUES
				(@codigo, @nome, @valor_unitario, @qnt_estoque)
 
				SET @saida = 'Produto Codigo: '+ CAST(@codigo AS VARCHAR(5)) + ' inserida com sucesso'
			END
			ELSE
			BEGIN
				IF (UPPER(@op) = 'U')
				BEGIN
					UPDATE produto
					SET nome = @nome, valor_unitario = @valor_unitario,
								qnt_estoque = @qnt_estoque
					WHERE codigo = @codigo
 						SET @saida = 'Produto Codigo: '+
									CAST(@codigo AS VARCHAR(5))+
									' atualizada com sucesso'
				END
				ELSE
				BEGIN
					RAISERROR('Operação de código inválido', 16, 1)
				END
			END
		END
	END
 
DECLARE @saida VARCHAR(MAX)
EXEC sp_produto 'i', 1, 'Controle', 105.5 , 25, @saida OUTPUT
PRINT @saida

DECLARE @saida VARCHAR(MAX)
EXEC sp_produto 'i', 2, 'Console', 950.5 , 30, @saida OUTPUT
PRINT @saida

drop produto
select * from produto

SELECT COUNT(p.codigo) as Quantidade
FROM produto p


--Função Escalar
CREATE FUNCTION fn_estoque(@qntMinima INT)
RETURNS INT
AS
BEGIN
	DECLARE @query int
	SET @query = (SELECT COUNT(p.codigo) FROM produto p	WHERE qnt_estoque < @qntMinima)
	RETURN (@query)
END

--Multi Statement Table
CREATE FUNCTION fn_listaestoque(@qntMinima INT)
RETURNS @tabela TABLE (
codigo			int ,
nome			varchar(30),
qnt_estoque		int
)
AS
BEGIN
	INSERT INTO @tabela(codigo, nome, qnt_estoque)
		SELECT codigo, nome, qnt_estoque FROM produto WHERE qnt_estoque < @qntMinima
	RETURN 
END
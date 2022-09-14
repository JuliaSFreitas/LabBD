
create database procedureMaven
use procedureMaven

CREATE TABLE pessoa (
cpf					CHAR(11)		NOT NULL,
nome				VARCHAR(100)	NOT NULL,
email				VARCHAR(200)	NOT NULL,
limite_de_credito	DECIMAL(7,2)	NULL,
dt_nascimento		DATE			NULL
PRIMARY KEY (cpf)
)

CREATE PROCEDURE sp_pessoa_cpf (@op CHAR(1), @cpf CHAR(11) OUTPUT)
AS
	DECLARE @dig1 int,
			@dig2 int,
			@dig3 int,
			@dig4 int,
			@dig5 int,
			@dig6 int,
			@dig7 int,
			@dig8 int,
			@dig9 int,
			@digV1 int,
			@digV2 int,
			@aux decimal(7,1),
			@soma int
	
	SET @dig1 = SUBSTRING(@cpf,1,1) * 10
	SET @dig2 = SUBSTRING(@cpf,2,2) * 9
	SET @dig3 = SUBSTRING(@cpf,3,3) * 8
	SET @dig4 = SUBSTRING(@cpf,4,4) * 7
	SET @dig5 = SUBSTRING(@cpf,5,5) * 6
	SET @dig6 = SUBSTRING(@cpf,6,6) * 5
	SET @dig7 = SUBSTRING(@cpf,7,7) * 4
	SET @dig8 = SUBSTRING(@cpf,8,8) * 3
	SET @dig9 = SUBSTRING(@cpf,9,9) * 2
	SET @soma = @dig1 + @dig2 + @dig3 + @dig4 + @dig5 + @dig6 + @dig7 + @dig8 + @dig9
	SET @aux = @soma % 11
	SET @digV1 = 11 - @aux 

	SET @dig1 = SUBSTRING(@cpf,1,1) * 11
	SET @dig2 = SUBSTRING(@cpf,2,2) * 10
	SET @dig3 = SUBSTRING(@cpf,3,3) * 9
	SET @dig4 = SUBSTRING(@cpf,4,4) * 8
	SET @dig5 = SUBSTRING(@cpf,5,5) * 7
	SET @dig6 = SUBSTRING(@cpf,6,6) * 6
	SET @dig7 = SUBSTRING(@cpf,7,7) * 5
	SET @dig8 = SUBSTRING(@cpf,8,8) * 4
	SET @dig9 = SUBSTRING(@cpf,9,9) * 3
	SET @digV1 = @digV1 * 2
	SET @soma = @dig1 + @dig2 + @dig3 + @dig4 + @dig5 + @dig6 + @dig7 + @dig8 + @dig9 + @digV1
	SET @aux = @soma % 11
	SET @digV2 = 11 - @aux 

--OP - I (Insert) ; U (Update) ; D (Delete)
CREATE PROCEDURE sp_pessoa (@op CHAR(1), @cpf CHAR(11),
	@nome VARCHAR(100), @email VARCHAR(200), @limite_de_credito	DECIMAL(7,2),
	@dt_nascimento DATE, @saida VARCHAR(MAX) OUTPUT)
AS
	DECLARE @valido_null BIT

	IF (UPPER(@op) = 'D' AND @cpf IS NOT NULL)
	BEGIN
		DELETE pessoa WHERE cpf = @cpf
		SET @saida = 'Pessoa CPF '+ CAST(@cpf AS VARCHAR(5)) + ' excluida'
	END
	ELSE
	BEGIN
		IF (UPPER(@op) = 'D' AND @cpf IS NULL)
		BEGIN
			RAISERROR('CPF inválido', 16, 1)
		END
		ELSE
		BEGIN
			EXEC sp_pessoa_cpf @valido_null OUTPUT
			IF (@valido_null = 0)
			BEGIN
				RAISERROR('Telefones inválidos 
					(Iguais, nulos ou incorretos)', 16, 1)
			END
			ELSE
			BEGIN
				IF (UPPER(@op) = 'I')
				BEGIN
					INSERT INTO pessoa VALUES
					(@cpf, @nome, @email, @limite_de_credito, @dt_nascimento)
 
					SET @saida = 'Pessoa CPF '+CAST(@cpf AS VARCHAR(5))+
								 ' inserida com sucesso'
				END
				ELSE
				BEGIN
					IF (UPPER(@op) = 'U')
					BEGIN
						UPDATE pessoa
						SET nome = @nome, @email = @email, @limite_de_credito = @limite_de_credito, @dt_nascimento = @dt_nascimento
						WHERE @cpf = @cpf
 
						SET @saida = 'Pessoa CPF '+
										CAST(@cpf AS VARCHAR(5))+
										' atualizada com sucesso'
					END
					ELSE
					BEGIN
						RAISERROR('Operação de código inválido', 16, 1)
					END
				END
			END
		END
	END
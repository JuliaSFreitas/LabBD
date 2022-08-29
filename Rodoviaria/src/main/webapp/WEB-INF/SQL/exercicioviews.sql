create database exercicioviews
use exercicioviews
 
create table motorista(
	codigo int NOT NULL,
	nome varchar(40) NOT NULL,
	naturalidade varchar(40) NOT NULL
primary key(codigo)
)
 
create table onibus(
	placa char(7)NOT NULL,
	marca varchar(15) NOT NULL,
	ano int NOT NULL,
	descricao varchar(20) NOT NULL
primary key(placa)
)
 
create table viagem(
	codigo int NOT NULL,
	onibus char(7) NOT NULL,
	motorista int NOT NULL,
	hora_saida int NOT NULL,
	hora_chegada int NOT NULL,
	parida varchar(40) NOT NULL,
	destino varchar(40) NOT NULL
primary key(codigo)
foreign key(onibus) references onibus (placa),
foreign key(motorista) references motorista (codigo)
)
 
-- 1) Criar um Union das tabelas Motorista e ônibus, com as colunas ID (Código e Placa) e Nome (Nome e Marca)
SELECT CAST(mot.codigo AS char(6)) AS ID, mot.nome AS Nome
FROM motorista mot
UNION 
SELECT oni.placa, oni.marca
FROM onibus oni
 
-- 2) Criar uma View (Chamada v_motorista_onibus) do Union acima
CREATE VIEW v_motorista_onibus
AS
SELECT CAST(mot.codigo AS char(6)) AS ID, mot.nome AS Nome
FROM motorista mot
UNION 
SELECT oni.placa, oni.marca
FROM onibus oni
 
-- 3) Criar uma View (Chamada v_descricao_onibus) que mostre o Código da Viagem, o Nome do motorista, a placa do ônibus (Formato XXX-0000), a Marca do ônibus, o Ano do ônibus e 
--a descrição do onibus
CREATE VIEW v_descricao_onibus
AS
SELECT vi.codigo, 
	   mot.nome, 
	   SUBSTRING(oni.placa, 1, 3) + '-' + SUBSTRING(oni.placa, 4, 7) AS placa,
	   oni.marca,
	   oni.ano,
	   oni.descricao
FROM motorista mot, viagem vi, onibus oni
 
-- 4) Criar uma View (Chamada v_descricao_viagem) que mostre o Código da viagem, a placa do ônibus(Formato XXX-0000), a Hora da Saída da viagem (Formato HH:00), a Hora da Chegada
--da viagem (Formato HH:00), partida e destino
CREATE VIEW v_v_descricao_viagem
AS
SELECT vi.codigo,  
	   SUBSTRING(oni.placa, 1, 3) + '-' + SUBSTRING(oni.placa, 4, 7) AS placa,
	   SUBSTRING(CAST(vi.hora_saida AS varchar(5)), 1, 2) + ':00' AS hora_saida,
	   SUBSTRING(CAST(vi.hora_chegada AS varchar(5)), 1, 2) + ':00' AS hora_chegada,
	   vi.parida,
	   vi.destino
FROM viagem vi, onibus oni
create database lbd_revisao 
use lbd_revisao

create table aluno(
ra int,
nome varchar(100),
idade int
primary key (ra))

create table disciplina(
codigo int ,
nome varchar(80),
cargahoraria int
primary key (codigo))

create table alunodisciplina(
disciplinacodigo int,
raaluno int
FOREIGN KEY (raaluno) REFERENCES aluno (ra),
FOREIGN KEY (disciplinacodigo) REFERENCES disciplina (codigo))

create table titulacao(
codigo int,
titulo varchar(40)
primary key (codigo))

create table professor(
registro int ,
nome varchar(100),
codtitulacao int
primary key (registro)
FOREIGN KEY (codtitulacao) REFERENCES titulacao (codigo))

create table professordisciplina(
disciplinacodigo int,
professorregistro int
FOREIGN KEY (professorregistro) REFERENCES professor (registro),
FOREIGN KEY (disciplinacodigo) REFERENCES disciplina (codigo))

create table curso(
codigo int,
nome varchar(50),
area varchar(50)
primary key (codigo))

create table cursodisciplina(
disciplinacodigo int,
cursocodigo int
FOREIGN KEY (cursocodigo) REFERENCES curso (codigo),
FOREIGN KEY (disciplinacodigo) REFERENCES disciplina (codigo))

insert into aluno values 
(3416, 'DIEGO PIOVESAN DE RAMOS', 18),
(3423, 'LEONARDO MAGALHÃES DA ROSA',	170),
(3434, 'LUIZA CRISTINA DE LIMA MARTINELI',	20),
(3440, 'IVO ANDRÉ FIGUEIRA DA SILVA', 25),
(3443, 'BRUNA LUISA SIMIONI', 37),
(3448, 'THAÍS NICOLINI DE MELLO', 17),
(3457, 'LÚCIO DANIEL TÂMARA ALVES',	29),
(3459, 'LEONARDO RODRIGUES', 25),
(3465, 'ÉDERSON RAFAEL VIEIRA', 19),
(3466, 'DAIANA ZANROSSO DE OLIVEIRA', 21),
(3467, 'DANIELA MAURER', 23),
(3470, 'ALEX SALVADORI PALUDO', 42),
(3471, 'VINÍCIUS SCHVARTZ', 19),
(3472, 'MARIANA CHIES ZAMPIERI', 18),
(3482, 'EDUARDO CAINAN GAVSKI', 19),
(3483, 'REDNALDO ORTIZ DONEDA', 20),
(3499, 'MAYELEN ZAMPIERON', 22)

insert into disciplina values
(1,	'Laboratório de Banco de Dados', 80),
(2,	'Laboratório de Engenharia de Software', 80),
(3,	'Programação Linear e Aplicações',	80),
(4,	'Redes de Computadores', 80),
(5,	'Segurança da informação', 40),
(6,	'Teste de Software', 80),
(7,	'Custos e Tarifas Logísticas', 80),
(8,	'Gestão de Estoques', 40),
(9,	'Fundamentos de Marketing', 40),
(10, 'Métodos Quantitativos de Gestão', 80),
(11, 'Gestão do Tráfego Urbano', 80),
(12, 'Sistemas de Movimentação e Transporte', 40)

insert into titulacao values
(1, 'Especialista'),
(2, 'Mestre'),
(3, 'Doutor')

insert into professor values
(1111, 'Leandro', 2),
(1112, 'Antonio', 2),
(1113, 'Alexandre',	3),
(1114, 'Wellington', 2),
(1115, 'Luciano', 1),
(1116, 'Edson', 2),
(1117, 'Ana', 2),
(1118, 'Alfredo', 1),
(1119, 'Celio', 2),
(1120, 'Dewar',	3),
(1121, 'Julio', 1)

insert into curso values
(1, 'ADS',	'Ciências da Computação'),
(2, 'Logística', 'Engenharia Civil')

insert into alunodisciplina values 
(1,	3416),
(4,	3416),
(1,	3423),
(2,	3423),
(5,	3423),
(6,	3423),
(2,	3434),
(5,	3434),
(6,	3434),
(1,	3440),
(5,	3443),
(6,	3443),
(4,	3448),
(5,	3448),
(6,	3448),
(2,	3457),
(4,	3457),
(5,	3457),
(6,	3457),
(1,	3459),
(6,	3459),
(7,	3465),
(11, 3465),
(8,	3466),
(11, 3466),
(8,	3467),
(12, 3467),
(8,	3470),
(9,	3470),
(11, 3470),
(12, 3470),
(7,	3471),
(7,	3472),
(12, 3472),
(9,	3482),
(11, 3482),
(8,	3483),
(11, 3483),
(12, 3483),
(8,	3499)

insert into professordisciplina values
(1,	1111),
(2,	1112),
(3,	1113),
(4,	1114),
(5,	1115),
(6,	1116),
(7,	1117),
(8,	1118),
(9,	1117),
(10, 1119),
(11, 1120),
(12, 1121)

insert into cursodisciplina values
(1, 1),
(2,	1),
(3,	1),
(4,	1),
(5,	1),
(6,	1),
(7,	2),
(8,	2),
(9,	2),
(10, 2),
(11, 2),
(12, 2)

--Como fazer as listas de chamadas, com RA e nome por disciplina ?
SELECT disc.nome, al.ra, al.nome 
FROM disciplina disc, aluno al LEFT OUTER JOIN alunodisciplina al_disc
ON al.ra = al_disc.raaluno
WHERE disc.codigo = al_disc.disciplinacodigo
ORDER BY disc.nome, al.nome

--Fazer uma pesquisa que liste o nome das disciplinas e o nome dos professores que as ministram.
SELECT disc.nome, pro.nome 
FROM disciplina disc, professor pro LEFT OUTER JOIN professordisciplina pro_disc
ON pro.registro = pro_disc.professorregistro
WHERE disc.codigo = pro_disc.disciplinacodigo
ORDER BY disc.nome

--Fazer uma pesquisa que, dado o nome de uma disciplina, retorne o nome do curso.													
SELECT disc.nome, cur.nome
FROM disciplina disc, curso cur LEFT OUTER JOIN cursodisciplina cur_disc
ON cur.codigo = cur_disc.cursocodigo
WHERE disc.codigo = cur_disc.disciplinacodigo
ORDER BY disc.nome

--Fazer uma pesquisa que, dado o nome de uma disciplina, retorne sua área.													
SELECT disc.nome, cur.area
FROM disciplina disc, curso cur LEFT OUTER JOIN cursodisciplina cur_disc
ON cur_disc.cursocodigo = cur.codigo
WHERE disc.codigo = cur_disc.disciplinacodigo

--Fazer uma pesquisa que , dado o nome de uma disciplina, retorne o título do professor que a ministra.													
SELECT disc.nome, pro.codtitulacao
FROM disciplina disc, professor pro LEFT OUTER JOIN professordisciplina pro_disc
ON pro.registro = pro_disc.professorregistro
WHERE disc.codigo = pro_disc.disciplinacodigo
ORDER BY disc.nome

--Fazer uma pesquisa que retorne o nome da disciplina e quantos alunos estão matriculados em cada uma delas.												
SELECT DISTINCT disc.nome, 
	   COUNT(al_disc.raaluno) As qntAlunos
FROM disciplina disc, aluno al LEFT OUTER JOIN alunodisciplina al_disc
ON al.ra = al_disc.raaluno
WHERE disc.codigo = al_disc.disciplinacodigo
GROUP BY disc.nome
ORDER BY disc.nome

--Fazer uma pesquisa que, dado o nome de uma disciplina, retorne o nome do professor.  
--Só deve retornar de disciplinas que tenham, no mínimo, 5 alunos matriculados													
SELECT CASE WHEN (COUNT(al_disc.raaluno)>= 5) 
	   THEN 
		disc.nome
	   END AS Disciplina,  
	   CASE WHEN (COUNT(al_disc.raaluno)>= 5) 
	   THEN 
		pro.nome
	   END AS Professor
FROM professor pro, professordisciplina pro_disc INNER JOIN alunodisciplina al_disc
ON pro_disc.disciplinacodigo = al_disc.disciplinacodigo 
INNER JOIN disciplina disc
ON disc.codigo = al_disc.disciplinacodigo
WHERE disc.codigo = pro_disc.disciplinacodigo
	AND pro.registro = pro_disc.professorregistro
GROUP BY disc.nome, pro.nome
ORDER BY disc.nome

--Fazer uma pesquisa que retorne o nome do curso e a quatidade de professores cadastrados que ministram aula nele. 
--A coluna de ve se chamar quantidade
SELECT cur.nome, 
	   COUNT(DISTINCT(pro.registro)) As quantidade
FROM disciplina disc,professor pro, curso cur, professordisciplina pro_disc LEFT OUTER JOIN cursodisciplina cur_disc
ON pro_disc.disciplinacodigo = cur_disc.disciplinacodigo
WHERE pro.registro = pro_disc.professorregistro
AND cur.codigo = cur_disc.cursocodigo
AND disc.codigo = cur_disc.disciplinacodigo
AND disc.codigo = pro_disc.disciplinacodigo
GROUP BY cur.nome
create database db_sistema_faculdade;

use db_sistema_faculdade; 

show tables;

create table tbl_aluno (
	id int not null primary key auto_increment,
    nome varchar(100) not null,
    data_nascimento date not null,
    matricula float not null,
    id_curso int not null,
    
    constraint fk_aluno_curso
    foreign key (id_curso)
    references tbl_curso (id),
    
    unique index (id)
);

create table tbl_endereco_aluno (
	id int not null primary key auto_increment,
    logradouro varchar (100) not null,
    cep varchar (10) not null,
    cidade varchar (50) not null,
    estado varchar (50) not null,
    pais varchar (45) not null,
    id_aluno int not null,

	constraint fk_aluno_endereco_aluno
    foreign key (id_aluno)
    references tbl_aluno (id),

	unique index (id)
);

create table tbl_email_aluno (
	id int not null primary key auto_increment,
    email varchar (255) not null,
    id_aluno int not null,
    
    constraint fk_aluno_email_aluno
    foreign key (id_aluno)
	references tbl_aluno (id),
    
    unique index (id)
);

create table tbl_telefone_aluno (
	id int not null primary key auto_increment,
    telefone varchar(15) not null,
    id_aluno int not null,
    
    constraint fk_aluno_telefone_aluno
    foreign key (id_aluno)
    references tbl_aluno (id),
    
	unique index (id)
);

create table tbl_curso (
	id int not null primary key auto_increment,
    nome_curso varchar(100) not null,
	codigo float not null,
    duracao float not null,
    
    unique index (id)
);

create table tbl_professor (
	id int not null primary key auto_increment,
    nome varchar (100) not null,
    data_nascimento date not null,
    
    unique index (id)
);

create table tbl_endereco_professor (
	id int not null primary key auto_increment,
    logradouro varchar (100) not null,
    cep varchar (10) not null,
    cidade varchar (50) not null,
    estado varchar (50) not null,
    pais varchar (45) not null,
    id_professor int not null,

	constraint fk_professor_endereco_professor
    foreign key (id_professor)
    references tbl_professor (id),

	unique index (id)
);

create table tbl_email_professor (
	id int not null primary key auto_increment,
    email varchar (255) not null,
    id_professor int not null,
    
    constraint fk_professor_email_professor
    foreign key (id_professor)
	references tbl_professor (id),
    
    unique index (id)
);

create table tbl_telefone_professor (
	id int not null primary key auto_increment,
    telefone varchar(15) not null,
    id_professor int not null,
    
    constraint fk_professor_telefone_professor
    foreign key (id_professor)
    references tbl_professor (id),
    
	unique index (id)
);

create table tbl_nota (
	id int not null primary key auto_increment,
    data_avaliacao date not null,
    id_aluno int not null,
	id_materia int not null,
    nota float,
    
    constraint fk_aluno_nota
    foreign key (id_aluno)
    references tbl_aluno (id),
    
    constraint fk_materia_nota
    foreign key (id_materia)
    references tbl_materia (id),

	unique index (id)
);

create table tbl_materia (
	id int not null primary key auto_increment,
    nome_materia varchar (25) not null,
    codigo float not null,
    carga_horaria float not null,
	id_professor int not null,
    
    constraint fk_professor_materia
    foreign key (id_professor)
    references tbl_professor (id),
    
    unique index (id)
);

create table tbl_turma (
	id int not null primary key auto_increment,
    codigo_turma float not null,
    id_aluno int not null,
    id_professor int not null,
    id_materia int not null,
    
    constraint fk_aluno_turma
    foreign key (id_aluno)
	references tbl_aluno (id),
    
    constraint fk_professor_turma
    foreign key (id_professor)
    references tbl_professor (id),
    
    constraint fk_materia_turma
    foreign key (id_materia)
    references tbl_materia (id),
    
    unique index (id)
);

INSERT INTO tbl_curso (nome_curso, codigo, duracao) VALUES ('Analise e desenvolvimento de sistemas', 205, 1);

insert into tbl_aluno (nome, data_nascimento, matricula, id_curso) values ('Gabriel Ferreira', '2005-03-25', 956, 1);

insert into tbl_professor (nome, data_nascimento) VALUES ('Prof. Leonid', '1985-10-30');

insert into tbl_materia (nome_materia, codigo, carga_horaria, id_professor) values ('Database Modeling & SQL','309', 40, 1);

select*from tbl_curso where id=1;

select*from tbl_professor where id=1;

select*from tbl_aluno where id=1;

SELECT * FROM tbl_aluno;

INSERT INTO tbl_nota (data_avaliacao, id_aluno, id_materia, nota_aluno) 
VALUES ('2024-10-13', 4, 1, 9.5);

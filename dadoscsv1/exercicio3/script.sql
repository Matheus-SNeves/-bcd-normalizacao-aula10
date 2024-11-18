drop database if exists onibus;
create database onibus;
use onibus;

create table motoristas(
    id_motorista int not null auto_increment primary key,
    cpf varchar(14) not null,
    nome_motorista varchar(255)
);

create table telefone(
    id_telefone integer not null auto_increment primary key,
    id_motorista int not null,
    telefone varchar(14) not null,
    foreign key (id_motorista) references motoristas(id_motorista)
);

create table linhasonibus(
    id_linha int not null auto_increment primary key,
    descricao varchar(255) not null
);

create table horarioonibus(
    id_horario int not null auto_increment primary key,
    id_linha int not null,
    horario time not null,
    id_motorista int not null,
    foreign key (id_linha) references linhasonibus(id_linha),
    foreign key (id_motorista) references motoristas(id_motorista) 
);

load data infile 'C:/dadoscsv1/exercicio3/motoristas.csv'
into table motoristas
fields terminated by ';'
lines terminated by '\r\n'
ignore 1 rows;

load data infile 'C:/dadoscsv1/exercicio3/telefone.csv'
into table telefone
fields terminated by ';'
lines terminated by '\r\n'
ignore 1 rows;

load data infile 'C:/dadoscsv1/exercicio3/linhasonibus.csv'
into table linhasonibus
fields terminated by ';'
lines terminated by '\r\n'
ignore 1 rows;

load data infile 'C:/dadoscsv1/exercicio3/horarioonibus.csv'
into table horarioonibus
fields terminated by ';'
lines terminated by '\r\n'
ignore 1 rows;




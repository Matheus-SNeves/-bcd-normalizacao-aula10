drop database if exists clientes;
create database clientes;
use clientes;

create table cliente(
    id_cliente integer not null auto_increment primary key,
    nome varchar(255) not null,
    nascimento date,
    sexo enum('F', 'M', 'T') not null,
    peso decimal(3,2) not null
);

create table telefone(
    id_cliente int not null,
    telefone varchar(14) not null,
    foreign key (id_cliente) references cliente(id_cliente)
);


load data infile 'C:/dadoscsv1/exercicio1/cliente.csv'
into table cliente
fields terminated by ';'
lines terminated by '\r\n'
ignore 1 rows;

load data infile 'C:/dadoscsv1/exercicio1/telefone.csv'
into table telefone
fields terminated by ';'
lines terminated by '\r\n'
ignore 1 rows;
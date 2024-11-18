drop database if exists parcelas;
create database parcelas;
use pedidos;

create table clientes(
    id_cliente int not null auto_increment primary key,
    cpf integer(14) not null,
    nome_cliente varchar(255) not null,
    cep integer(9) not null,
    numero integer(3) not null,
    complemento varchar(50) not null,
);

create table telefone(
    id_telefone int not null auto_increment primary key,
    telefone integer(14) not null,
    id_cliente int not null
)

create table entregador(
    id_entregador int not null auto_increment primary key,
    nome_entregador varchar(255) not null,
    veiculo varchar(255) not null
);

create table produtos(
    id_produto int not null auto_increment primary key,
    nome_produto varchar(255) not null,
    preco_unitario decimal(10,2) not null,
);

create table entrega(
    id_entrega int not null auto_increment primary key,
    id_entregador int not null,
    data_pedido date not null,
    hora_pedido time not null,
    hora_entrega time not null,
    hora_fim time not null
);

create table pedidos(
    id_pedido int not null auto_increment primary key,
    id_cliente int not null,
    quantidade int not null,
    id_produto int not null,
    id_entrega int not null,
    id_entregador int not null,
    foreign key (id_cliente) references clientes(id_cliente),
    foreign key (id_produto) references produtos(id_produto),
    foreign key (id_entrega) references entrega(id_entrega),
    foreign key (id_entregador) references entregador(id_entregador),
);

load data infile 'C:/dadoscsv1/exercicio5/clientes.csv'
into table clientes
fields terminated by ';'
lines terminated by '\r\n'
ignore 1 rows;

load data infile 'C:/dadoscsv1/exercicio5/telefone.csv'
into table telefone
fields terminated by ';'
lines terminated by '\r\n'
ignore 1 rows;

load data infile 'C:/dadoscsv1/exercicio5/entregador.csv'
into table entregador
fields terminated by ';'
lines terminated by '\r\n'
ignore 1 rows;

load data infile 'C:/dadoscsv1/exercicio5/produto.csv'
into table produtos
fields terminated by ';'
lines terminated by '\r\n'
ignore 1 rows;


load data infile 'C:/dadoscsv1/exercicio5/entrega.csv'
into table entrega
fields terminated by ';'
lines terminated by '\r\n'
ignore 1 rows;

load data infile 'C:/dadoscsv1/exercicio5/pedido.csv'
into table pedidos
fields terminated by ';'
lines terminated by '\r\n'
ignore 1 rows;
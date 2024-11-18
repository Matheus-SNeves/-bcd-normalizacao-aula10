DROP DATABASE IF EXISTS parcelas;
CREATE DATABASE parcelas;
USE parcelas;

CREATE TABLE cliente(
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    numero INT NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    uf CHAR(2) NOT NULL,
    telefone VARCHAR(14) NOT NULL
);

CREATE TABLE parcelas(
    id_parcelas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    num_dupli INT NOT NULL,
    data_compra DATE NOT NULL,
    vencimento DATE NOT NULL,
    pagamento DATE,
    valor DECIMAL(10,2) NOT NULL,
    diferenca VARCHAR(255),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

LOAD DATA INFILE 'C:/dadoscsv1/exercicio4/clientes.csv'
INTO TABLE cliente
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

LOAD DATA INFILE 'C:/dadoscsv1/exercicio4/parcelas.csv'
INTO TABLE parcelas
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;

DROP DATABASE IF EXISTS academia;
CREATE DATABASE academia;
USE academia;

CREATE TABLE alunos(
    id_aluno INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_aluno VARCHAR(255) NOT NULL,
    nascimento DATE NOT NULL,
    sexo ENUM('F', 'M', 'T') NOT NULL,
    peso DECIMAL(3,2) NOT NULL
);

CREATE TABLE telefone(
    id_telefone INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    telefone VARCHAR(14) NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno)
);

CREATE TABLE exercicios(
    id_exercicio INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(50) NOT NULL,
    grupo_muscular VARCHAR(50) NOT NULL,
    aparelho VARCHAR(100) NOT NULL
);

CREATE TABLE aulas(
    id_aula INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_exercicio INT NOT NULL,
    dia_semana ENUM('Segunda-feira','Terça-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sabado', 'Domingo') NOT NULL,
    FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    FOREIGN KEY (id_exercicio) REFERENCES exercicios(id_exercicio)
);

LOAD DATA INFILE 'C:/dadoscsv1/exercicio2/alunos.csv'
INTO TABLE alunos
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/dadoscsv1/exercicio2/telefone.csv'
INTO TABLE telefone
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/dadoscsv1/exercicio2/exercicios.csv'
INTO TABLE exercicios
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:/dadoscsv1/exercicio2/aulas.csv'
INTO TABLE aulas
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

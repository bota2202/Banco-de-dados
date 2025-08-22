CREATE DATABASE atividade_avaliativa;
USE atividade_avaliativa;

CREATE TABLE Fornecedor (
  Fcodigo INT PRIMARY KEY AUTO_INCREMENT,
  Fnome VARCHAR(100) NOT NULL,
  Status VARCHAR(20) DEFAULT 'Ativo',
  Cidade VARCHAR(100)
);

CREATE TABLE Peca (
  Pcodigo INT PRIMARY KEY AUTO_INCREMENT,
  Pnome VARCHAR(100) NOT NULL,
  Cor VARCHAR(50) NOT NULL,
  Peso DECIMAL(10,2) NOT NULL,
  Cidade VARCHAR(100) NOT NULL
);

CREATE TABLE Instituicao (
  Icodigo INT PRIMARY KEY AUTO_INCREMENT,
  Nome VARCHAR(100) NOT NULL
);

CREATE TABLE Projeto (
  PRcod INT PRIMARY KEY AUTO_INCREMENT,
  PRnome VARCHAR(100) NOT NULL,
  Cidade VARCHAR(100),
  Icod INT,
  FOREIGN KEY (Icod) REFERENCES Instituicao(Icodigo)
);

CREATE TABLE Fornecimento (
  Fcod INT,
  Pcod INT,
  PRcod INT,
  Quantidade INT NOT NULL,
  PRIMARY KEY (Fcod, Pcod, PRcod),
  FOREIGN KEY (Fcod) REFERENCES Fornecedor(Fcodigo),
  FOREIGN KEY (Pcod) REFERENCES Peca(Pcodigo),
  FOREIGN KEY (PRcod) REFERENCES Projeto(PRcod)
);

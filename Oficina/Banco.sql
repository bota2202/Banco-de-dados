CREATE DATABASE IF NOT EXISTS Oficina;
USE Oficina;

CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    telefone VARCHAR(20),
    cpf VARCHAR(14) UNIQUE,
    cidade VARCHAR(100),
    estado VARCHAR(2),
    bairro VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Veiculos (
    id_veiculo INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    placa VARCHAR(10) UNIQUE NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    ano INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

CREATE INDEX idx_placa ON Veiculos(placa);

CREATE TABLE Mecanicos (
    id_mecanico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    especialidade VARCHAR(150)
);

CREATE TABLE Pecas (
    id_peca INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    fabricante VARCHAR(100),
    preco_custo DECIMAL(10,2) NOT NULL,
    preco_venda DECIMAL(10,2) NOT NULL,
    qtd_estoque INT NOT NULL,
    CONSTRAINT chk_preco CHECK (preco_venda >= preco_custo)
);

CREATE TABLE Servicos (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    nome_servico VARCHAR(150) NOT NULL,
    especialidade VARCHAR(150),
    preco_mao_obra DECIMAL(10,2) NOT NULL
);

CREATE TABLE Ordens_Servico (
    id_os INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    id_veiculo INT NOT NULL,
    status VARCHAR(50) DEFAULT 'Aguardando Avaliação',
    data_abertura DATE NOT NULL,
    data_conclusao DATE,
    descricao TEXT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculos(id_veiculo)
);

CREATE INDEX idx_fk_os_veiculo ON Ordens_Servico(id_veiculo);

CREATE TABLE OS_Servicos (
    id_os INT NOT NULL,
    id_servico INT NOT NULL,
    preco_cobrado DECIMAL(10,2),
    PRIMARY KEY(id_os, id_servico),
    FOREIGN KEY (id_os) REFERENCES Ordens_Servico(id_os),
    FOREIGN KEY (id_servico) REFERENCES Servicos(id_servico)
);

CREATE TABLE OS_Pecas (
    id_os INT NOT NULL,
    id_peca INT NOT NULL,
    quantidade_usada INT NOT NULL,
    preco_unitario_cobrado DECIMAL(10,2),
    PRIMARY KEY(id_os, id_peca),
    FOREIGN KEY (id_os) REFERENCES Ordens_Servico(id_os),
    FOREIGN KEY (id_peca) REFERENCES Pecas(id_peca)
);

CREATE INDEX idx_os_pecas_composto ON OS_Pecas(id_os, id_peca);

CREATE TABLE OS_Mecanicos (
    id_os INT NOT NULL,
    id_mecanico INT NOT NULL,
    PRIMARY KEY(id_os, id_mecanico),
    FOREIGN KEY (id_os) REFERENCES Ordens_Servico(id_os),
    FOREIGN KEY (id_mecanico) REFERENCES Mecanicos(id_mecanico)
);


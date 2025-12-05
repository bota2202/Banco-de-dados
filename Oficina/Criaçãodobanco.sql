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

INSERT INTO Clientes (nome, telefone, cpf, cidade, estado, bairro, email) VALUES
('João Mendes', '11998887766', '123.456.789-00', 'São Paulo', 'SP', 'Centro', 'joao@gmail.com'),
('Maria Silva', '11992223344', '987.654.321-00', 'Campinas', 'SP', 'Taquaral', 'maria@gmail.com'),
('Carlos Santos', '11991112233', '111.222.333-44', 'Limeira', 'SP', 'Vila Nova', 'carlos@gmail.com'),
('Ana Pereira', '19988776655', '555.666.777-88', 'Piracicaba', 'SP', 'Bosque', 'ana@gmail.com');

INSERT INTO Veiculos (id_cliente, placa, marca, modelo, ano) VALUES
(1, 'ABC1A23', 'Ford', 'Fiesta', 2012),
(1, 'ABC2B34', 'Chevrolet', 'Onix', 2018),
(2, 'XYZ9Z99', 'Honda', 'Civic', 2015),
(3, 'KLM3C45', 'Volkswagen', 'Gol', 2010),
(4, 'QWE4R56', 'Toyota', 'Corolla', 2019);

INSERT INTO Mecanicos (nome, especialidade) VALUES
('Ricardo Almeida', 'Motor'),
('Bruno Carvalho', 'Suspensão'),
('Felipe Souza', 'Freios'),
('Marcos Lima', 'Elétrica');

INSERT INTO Pecas (nome, fabricante, preco_custo, preco_venda, qtd_estoque) VALUES
('Filtro de Óleo', 'Bosch', 15.00, 30.00, 50),
('Pastilha de Freio', 'Nakashi', 80.00, 150.00, 20),
('Correia Dentada', 'Gates', 50.00, 95.00, 2),
('Amortecedor Dianteiro', 'Cofap', 120.00, 200.00, 0);

INSERT INTO Servicos (nome_servico, especialidade, preco_mao_obra) VALUES
('Troca de Óleo', 'Motor', 80.00),
('Alinhamento e Balanceamento', 'Suspensão', 120.00),
('Troca de Pastilhas de Freio', 'Freios', 150.00),
('Revisão Elétrica', 'Elétrica', 200.00);

INSERT INTO Ordens_Servico (id_cliente, id_veiculo, status, data_abertura, data_conclusao, descricao) VALUES
(1, 1, 'Concluída', '2025-01-10', '2025-01-11', 'Troca de óleo e revisão geral'),
(2, 3, 'Em Execução', '2025-01-15', NULL, 'Freio fazendo barulho'),
(3, 4, 'Aguardando Avaliação', '2025-01-18', NULL, 'Falhando ao ligar'),
(4, 5, 'Concluída', '2025-01-20', '2025-01-22', 'Revisão completa');

INSERT INTO OS_Servicos (id_os, id_servico, preco_cobrado) VALUES
(1, 1, 80.00),
(2, 3, 150.00),
(4, 2, 120.00),
(4, 4, 200.00);

INSERT INTO OS_Pecas (id_os, id_peca, quantidade_usada, preco_unitario_cobrado) VALUES
(1, 1, 1, 30.00),
(2, 2, 1, 150.00),
(3, 3, 1, 95.00),
(4, 4, 2, 200.00);

INSERT INTO OS_Mecanicos (id_os, id_mecanico) VALUES
(1, 1),
(2, 3),
(3, 4),
(4, 2),
(4, 1);



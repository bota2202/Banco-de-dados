create database aluguel;

use aluguel;

create table equipamento(
	id_equipamento int auto_increment not null primary key,
    nome_equipamento varchar(100) not null,
    preco_diaria decimal(5,2) not null,
    tipo_equipamento varchar(100) not null,
    descricao_equipamento varchar(200)
);

create table cliente(
	id_cliente int not null auto_increment primary key,
    nome_cliente varchar(100) not null,
    cpf_cliente varchar(14) not null,
    celular_cliente varchar(13) not null,
    endereco_cliente varchar(100)
);

create table aluguel(
	id_aluguel int primary key auto_increment not null,
    data_emprestimo datetime,
    data_devolucao datetime,
    equipamento_aluguel int,
    cliente_aluguel int,
    foreign key (equipamento_aluguel) references equipamento (id_equipamento),
    foreign key (cliente_aluguel) references cliente (id_cliente)
);

CREATE TABLE funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT not null,
    nome_funcionario VARCHAR(100) not null,
    cpf_funcionario VARCHAR(14) not null,
    data_nascimento_funcionario DATETIME  not null,
    data_admissao DATETIME not null,
    data_rescisao DATETIME,
    salario DECIMAL(5,2)  not null
);

create database solar;

use solar;

create table if not exists clientes(
	id_cliente int primary key auto_increment,
    cpf_cnpj_cliente varchar(14) not null,
    nome_cliente varchar(100) not null,
    endereco_cliente varchar(100),
    celular varchar(100) not null
);

create table if not exists fornecedor(
	id_fornecedor int primary key auto_increment,
    cnpf_cpf_fornecedor varchar(18) not null,
    nome_fornecedor varchar(100) not null,
    celular_fornecedor varchar(13),
    endereco_fornecedor varchar(100),
    cidade_fornecedor varchar(40),
    estado_fornecedor varchar(40) not null
);

create table if not exists produto(
	id_produto int primary key auto_increment,
    nome_produto varchar(100),
    descricao_produto varchar(400),
    quantidade_produto int(10),
    valor_produto decimal(8)
);

ALTER TABLE fornecedor MODIFY estado_fornecedor varchar(40) NOT NULL DEFAULT 'SP';

ALTER TABLE produto MODIFY valor_produto DECIMAL(5,2) not null;

create table venda(
	id_venda int auto_increment primary key not null,
    id_produto int not null,
    id_fornecedor int not null,
    foreign key (id_produto) references produto (id_produto),
    foreign key (id_fornecedor) references fornecedor (id_fornecedor)
);

create table funcionario(
	id_funcionario int primary key auto_increment,
    nome_funcionario varchar(100),
    celular_funcionario varchar(13),
    endereco_funcionario varchar(100),
    cpf_funcionario varchar(14),
    data_nascimento_funcionario datetime
);

create table departamento(
	id_departamento int primary key auto_increment not null,
    nome_departamento varchar(100),
    funcao_departamento varchar(100),
    responsavel_departamento int not null,
    foreign key (responsavel_departamento) references funcionario (id_funcionario)
);

alter table funcionario modify data_nascimento_funcionario datetime not null;

alter table funcionario add salario_funcionario decimal(5,2) not null;

alter table funcionario add data_rescisao_funcionario datetime;

alter table funcionario add data_admissao_funcionario datetime not null;

ALTER TABLE funcionario
ADD id_departamento INT;

ALTER TABLE funcionario
ADD CONSTRAINT fk_funcionario_departamento
FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento);

Alter table funcionario add sexo_funcionario char(1);

alter table funcionario rename to empregado;

alter table empregado change cpf_funcionario cic_funcionario varchar(18);

alter table fornecedor modify estado_fornecedor char(2) default 'MG';

Select * from fornecedor;

alter table empregado add primary key(cic_funcionario);
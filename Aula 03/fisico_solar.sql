CREATE DATABASE solar2;
USE solar2;

CREATE TABLE Clientes (
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(100)
);

CREATE TABLE Produtos (
    id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100)
);

CREATE TABLE Compra (
    id_cliente INT NOT NULL,
    id_produto INT NOT NULL,
    PRIMARY KEY (id_cliente, id_produto),
    FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente),
    FOREIGN KEY (id_produto) REFERENCES Produtos (id_produto)
);

insert into Clientes (nome_cliente) Values ('Otávio');

update produtos set nome_produto = 'Chá' Where id_produto=1;

select * from produtos;

Select * from Clientes;

insert into produtos(nome_produto) values('Café');

insert into compra values (1,1);

select * from compra;

create table vendedor(
	id_vendedor int not null primary key auto_increment,
	salario decimal not null,
    nome_vendedor varchar(100)
);

alter table vendedor modify salario decimal(6,2) not null;

alter table vendedor add column fsalarial char(1);

insert into vendedor(nome_vendedor,salario) values ("Carlos",1000.00);

insert into vendedor(nome_vendedor,salario,fsalarial) values ("Daniele",2000.00,'B');

update vendedor set fsalarial = "1" where id_vendedor=1;

update vendedor set fsalarial = "2" where id_vendedor=2;

select * from vendedor;
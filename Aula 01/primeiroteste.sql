use pizzaria;
create table clientes(
id_cliente int primary key,
nome_cliente char(40),
email_cliente char(40),
endereco_cliente char(80)
);
create table funcionarios(
id_funcionario int primary key,
nome_funcionario char(40),
email_funcionario char(40),
endereco_funcionario char(80),
cargo_funcionario char(30)
);
create table pizzas(
id_pizza int primary key,
sabor_pizza char(40),
ingredientes_pizza char(100),
preco_pizza int
);
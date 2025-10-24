create database joins;
use joins;

create table clientes(
	id_cliente  int auto_increment primary key not null,
    nome_cliente varchar(100) not null,
    endereco varchar(100) not null,
    cidade varchar(50) not null,
    estado char(2) not null,
    cep varchar(10) not null
);

create table produtos(
	id_produto int not null primary key auto_increment,
    nome_produto varchar(100) not null,
    descricao_produto varchar(100) not null,
    valor_produto decimal(7,2)
);

create table vendas(
	id_venda int not null auto_increment not null primary key,
    id_cliente int not null,
    id_produto int not null,
    quantidade int not null,
    valor_venda decimal(7,2) not null,
    foreign key (id_cliente) references clientes(id_cliente),
    foreign key (id_produto) references produtos(id_produto)
);

INSERT INTO clientes (nome_cliente, endereco, cidade, estado, cep) VALUES
('Ana Silva', 'Rua A, 123', 'São Paulo', 'SP', '01001-000'),
('Beto Santos', 'Av. B, 456', 'Rio de Janeiro', 'RJ', '20010-000'),
('Cami Oliveira', 'Rua C, 789', 'Belo Horizonte', 'MG', '30120-000'),
('Diego Lima', 'Av. D, 101', 'Curitiba', 'PR', '80010-000');

INSERT INTO produtos (nome_produto, descricao_produto, valor_produto) VALUES
('Pizza', 'Pizza de calabresa 30cm', 50.00),
('Refrigerante', 'Refrigerante 2L', 10.00),
('Hamburguer', 'Hamburguer artesanal', 25.00),
('Salada', 'Salada mista', 15.00);

INSERT INTO vendas (id_cliente, id_produto, quantidade, valor_venda) VALUES
(1, 1, 2, 100.00),  
(1, 2, 1, 10.00),    
(2, 1, 1, 50.00),  
(3, 3, 2, 50.00),    
(4, 4, 1, 15.00); 

INSERT INTO clientes (nome_cliente, endereco, cidade, estado, cep) VALUES
('Eduardo Rocha', 'Rua A, 123', 'São Paulo', 'SP', '01001-000');  

SELECT clientes.nome_cliente, vendas.id_venda, vendas.id_cliente
from clientes,vendas
where clientes.id_cliente = vendas.id_cliente;

SELECT clientes.nome_cliente, vendas.id_venda, vendas.id_cliente
from clientes inner join vendas on clientes.id_cliente=vendas.id_cliente;

SELECT 
    c.nome_cliente, 
    v.id_venda
FROM clientes c
LEFT JOIN vendas v ON c.id_cliente = v.id_cliente;

SELECT 
    c.nome_cliente, 
    p.nome_produto
FROM clientes c
CROSS JOIN produtos p;

SELECT c.nome_cliente, SUM(v.valor_venda) AS total_gasto
FROM clientes c
INNER JOIN vendas v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nome_cliente;

SELECT c.nome_cliente, v.id_venda, p.nome_produto
FROM vendas v
INNER JOIN clientes c ON v.id_cliente = c.id_cliente
INNER JOIN produtos p ON v.id_produto = p.id_produto;

select v.id_venda, c.nome_cliente, p.nome_produto, v.valor_venda
from vendas v
inner join clientes c on v.id_cliente = c.id_cliente 
inner join produtos p on p.id_produto = v.id_produto
where v.valor_venda<=50;

select c.nome_cliente, v.id_venda, p.nome_produto
from clientes c
left join vendas v on v.id_cliente = c.id_cliente
left join produtos p on p.id_produto = v.id_produto;

select c.nome_cliente, v.id_venda
from clientes c cross join vendas v;

select c.nome_cliente, SUM(v.valor_venda) as total_gasto
from clientes c inner join vendas v on v.id_cliente=c.id_cliente
group by c.nome_cliente;

select p.nome_produto, SUM(v.quantidade) as quantidadetotal
from produtos p inner join vendas v on p.id_produto=v.id_produto
group by p.nome_produto;
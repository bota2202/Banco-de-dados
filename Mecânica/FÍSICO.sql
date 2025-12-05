create database mecanica;

use mecanica;

create table Clientes(
id_cliente int primary key auto_increment not null,
nome_cliente varchar(255) not null,
cpf_cliente varchar(14) not null unique,
telefone_cliente varchar(15) not null,
estado_cliente varchar(255) not null,
cidade_cliente varchar(255) not null,
bairro_cliente varchar(255) not null,
rua_cliente varchar(255) not null
);

create table Mecânicos(
id_mecanico int primary key auto_increment not null,
nome_mecanico varchar(255) not null,
status_mecanico tinyint not null,
telefone_mecanico varchar(15) not null
);

create table Carros(
id_carro int not null auto_increment primary key,
dono_carro int not null,
placa_carro varchar(255) not null,
cor_carro varchar(255) not null,
ano_carro datetime not null,
marca_carro varchar(255) not null,
modelo_carro varchar(255),
foreign key (dono_carro) references Clientes(id_cliente)
);

create table Serviços(
id_servico int not null auto_increment primary key,
preco_servico decimal(7,2) not null,
nome_servico varchar(255) not null,
descricao_servico varchar(255)
);

create table OS(
id_os int not null auto_increment primary key,
id_servico int not null,
id_cliente int not null,
id_mecanico int not null,
id_carro int not null,
status_os tinyint not null,
data_abertura datetime not null,
data_fechamento datetime,
descricao_os varchar(255),
preco_os decimal(7,2),
foreign key(id_servico) references Serviços (id_servico),
foreign key(id_cliente) references Clientes (id_cliente),
foreign key(id_mecanico) references Mecânicos (id_mecanico),
foreign key(id_carro) references Carros (id_carro)
);

create table Peças(
id_peca int not null auto_increment primary key,
nome_peca varchar(255) not null,
quantidade_peca int not null,
preco_peca decimal(7,2)
);

create table Clientes_Carros(
id_cliente int not null,
id_carro int not null,
foreign key(id_cliente) references Clientes (id_cliente),
foreign key(id_carro) references Carros (id_carro)
);

create table Carros_OS(
id_carro int not null,
id_os int not null,
foreign key(id_os) references OS (id_os),
foreign key(id_carro) references Carros (id_carro)
);

create table OS_Peças(
id_peca int not null,
id_os int not null,
quantidade int not null,
foreign key(id_os) references OS (id_os),
foreign key(id_peca) references Peças (id_peca)
);

create table Mecânicos_OS(
id_mecanico int not null,
id_os int not null,
foreign key(id_os) references OS (id_os),
foreign key(id_mecanico) references Mecânicos (id_mecanico)
);

create table Serviços_OS(
id_servico int not null,
id_os int not null,
foreign key(id_os) references OS (id_os),
foreign key(id_servico) references Serviços (id_servico)
);
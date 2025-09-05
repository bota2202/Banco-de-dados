use senai_banco;
show tables;
show create table fornecedor;
select * from cidade;

INSERT INTO cidade (Cnome, uf) values ('Limeira', 'SP');
INSERT INTO cidade (Cnome, uf) values ('Campinas', 'SP'),('Piracicaba','SP');
INSERT INTO cidade (Ccod,Cnome, uf) values (10,'Rio Claro', 'SP');
INSERT INTO cidade (Ccod,Cnome, uf) values (5,'Bauru', 'SP');

SELECT last_insert_id();

SELECT * FROM fornecedor;

INSERT INTO fornecedor (Fnome,Status,Cidade,Fone,Ccod) values ('Charlo','Ativo','Limeira','(19)99949-5895',1);
INSERT INTO fornecedor (Fnome,Status,Cidade,Fone,Ccod) values ('Ramos','Ativo','Bauru','(19)91949-2195',5);

SELECT * FROM peca;

INSERT INTO peca (Pnome, Cor, Peso, Ccod) VALUES ('Para-choque','Preto',50.0,2);
INSERT INTO peca (Pnome, Cor, Peso, Ccod) VALUES ('Pneu','Preto',10.0,3);

Select * from projeto;

INSERT INTO projeto (PRnome, Ccod) VALUES ('Corsa',2) , ('Celta',5);

Select * from fornecimento;

INSERT INTO fornecimento(Fcod,Pcod,Prcod,Quantidade) VALUES (1,2,1,10),(3,1,2,20);
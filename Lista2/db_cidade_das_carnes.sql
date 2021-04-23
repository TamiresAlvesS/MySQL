create database db_cidade_das_carnes;

use db_cidade_das_carnes;

create table tb_categoria(
id bigint(5) auto_increment,
produto varchar(255) not null,
ativo boolean not null,
primary key (id)
);

insert tb_categoria (produto, ativo) values ("Bovino",true);
insert tb_categoria (produto, ativo) values ("Suino",true);
insert tb_categoria (produto, ativo) values ("Aves",true);
insert tb_categoria (produto, ativo) values ("Frios",true);
insert tb_categoria (produto, ativo) values ("Especiais",true);

select * from tb_categoria;

create table tb_produtos (
id bigint(5) auto_increment,
nome varchar (255) not null,
preco decimal not null,
quantidade int not null,
categoria_id bigint,
primary key (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id)
);

insert tb_produtos (nome, preco, quantidade, categoria_id) values ("Acém", 25.00, 300, 1);
insert tb_produtos (nome, preco, quantidade, categoria_id) values ("Linguiça", 18.00, 450, 2);
insert tb_produtos (nome, preco, quantidade, categoria_id) values ("Coxa de Frango", 27.00, 390, 3);
insert tb_produtos (nome, preco, quantidade, categoria_id) values ("Presunto", 33.00, 100, 4);
insert tb_produtos (nome, preco, quantidade, categoria_id) values ("Fílé de Frango", 18.00, 490, 3);
insert tb_produtos (nome, preco, quantidade, categoria_id) values ("Carne moída", 30.00, 330, 1);
insert tb_produtos (nome, preco, quantidade, categoria_id) values ("Salame", 60.00, 370, 4);
insert tb_produtos (nome, preco, quantidade, categoria_id) values ("Coelho", 120.00, 40, 5);

select * from tb_produtos;

select * from tb_produtos where nome Like "%C%";

select * from tb_produtos WHERE preco IN (20, 30, 40);

select * from tb_produtos WHERE preco BETWEEN 20 AND 40;

select COUNT(*) from tb_produtos;

select AVG(preco) as media from tb_produtos;

select SUM(preco) from tb_produtos ;

select nome, preco, quantidade, tb_categoria.produto as produto_da_categoria ,tb_categoria.ativo as estado_da_categoria
from tb_produtos inner join tb_categoria on  tb_categoria.id = tb_produtos.categoria_id;
 
select nome, preco, quantidade, tb_categoria.produto as produto_da_categoria ,tb_categoria.ativo as estado_da_categoria
from tb_produtos left join tb_categoria on  tb_categoria.id = tb_produtos.categoria_id;
 
select nome, preco, quantidade, tb_categoria.produto as produto_da_categoria ,tb_categoria.ativo as estado_da_categoria from tb_produtos right join tb_categoria on  tb_categoria.id = tb_produtos.categoria_id;
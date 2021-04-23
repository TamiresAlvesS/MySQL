create database db_pizzaria_legal;

use db_pizzaria_legal;

-- tabela categoria
create table tb_categoria(
	id bigint auto_increment,
    tamanho varchar(255) not null,
    tipo_pizza varchar(255) not null,
    borda boolean,
    primary key (id)
);

insert tb_categoria(tamanho, tipo_pizza, borda) values("Grande","Maia",true);
insert tb_categoria(tamanho, tipo_pizza, borda) values("grande","Inteira",true);
insert tb_categoria(tamanho, tipo_pizza, borda) values("pequeno","Inteira",false);
insert tb_categoria(tamanho, tipo_pizza, borda) values("pequeno","Inteira", true);
insert tb_categoria(tamanho, tipo_pizza, borda) values("grande"," Meia", false);

-- tabela de pizza
create table tb_pizza(
	id bigint auto_increment,
    sabor varchar(255) not null,
	valor float not null,
    categoria_id bigint,
    ativo boolean,
    primary key(id),
    foreign key(categoria_id) references tb_categoria(id)
);

insert tb_pizza(sabor, valor, ativo, categoria_id) values ("Calabresa e Mussarela", 30.00, true, 1);
insert tb_pizza(sabor, valor, ativo, categoria_id) values ("Mussarela",25.00, true, 2);
insert tb_pizza(sabor, valor, ativo, categoria_id) values ("Chocolate e banana", 25.00,true, 3);
insert tb_pizza(sabor, valor, ativo, categoria_id) values ("Franco com catupiry", 35.00, true, 4);
insert tb_pizza(sabor, valor, ativo, categoria_id) values ("Calabresa", 25.00, true, 5);
insert tb_pizza(sabor, valor, ativo, categoria_id) values ("Calabresa e Frango com catupiry", 35.00,true, 1);
insert tb_pizza(sabor, valor, ativo, categoria_id) values ("Mussarela", 25.00, true, 2);
insert tb_pizza(sabor, valor, ativo, categoria_id) values ("Calabresa e Frango com catupiry", 45.00, true, 3);

select * from  tb_pizza;

-- busca todas as pizzas com valor acima de 45 reais
select * from tb_pizza where valor > 45.00;

-- busca todas as pizzas com valor entre 29 e 60 reias
select * from tb_pizza where valor >= 29.00 AND valor <= 60.00;

-- busca todas as pizzas com a letra c no nome
select * from tb_pizza where sabor like  "%C%";

-- busca todas as pizzas cadastrados e sua categoria
select sabor, valor as valor, ativo, tb_categoria.tamanho as "Tamanho", tb_categoria.tipo_pizza, tb_categoria.borda
from tb_pizza inner join tb_categoria on tb_categoria.id = tb_pizza.categoria_id;

-- busca todas as pizzas cadastradas com o tipo categoria meia
select sabor, valor as valor, ativo, tb_categoria.tipo_pizza as "Tipo", tb_categoria.tamanho, tb_categoria.borda
from tb_pizza inner join tb_categoria on tb_categoria.id = tb_pizza.categoria_id where tb_categoria.tipo_pizza = "Meia";
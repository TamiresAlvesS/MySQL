create database db_farmacia_do_bem;

use db_farmacia_do_bem;

-- tabela categoria
create table tb_categoria(
	id bigint auto_increment,
    cliente varchar(250) not null,
    receita_medica varchar(250) not null,
    pedido int not null,
    primary key (id)
);

-- tabela de produto
create table tb_produto(
	id bigint auto_increment,
    produto varchar(250) not null,
    valor decimal not null,
    fornecedor varchar(250) not null,
    validade decimal not null,
    quantidade int not null,
    categoria_id bigint,
    primary key(id),
    foreign key(categoria_id) references tb_categoria(id)
);

-- Tabela categoria
insert tb_categoria(cliente, receita_medica, pedido) values("Joao Paulo","Sim", 1);
insert tb_categoria(cliente, receita_medica, pedido) values("Tamires Alves","Não",2);
insert tb_categoria(cliente, receita_medica, pedido) values("Camila Silva", "Não", 3);
insert tb_categoria(cliente, receita_medica, pedido) values("Anderson Sousa","Sim", 4);
insert tb_categoria(cliente, receita_medica, pedido) values("Priscila Santos","Não", 5);

-- Tabela de produto
insert tb_produto(produto, valor, fornecedor, validade, quantidade) values ("Clonazepam (Rivotril)", 70.00, "Farmaceutica BT", 03/2025, 32);
insert tb_produto(produto, valor, fornecedor, validade, quantidade) values ("Esparadrapo", 5.00, "Farmaceutica AD", 05/2027, 82);
insert tb_produto(produto, valor, fornecedor, validade, quantidade) values ("Babymed", 7.80, "Farmaceutica RD", 07/2030, 71);
insert tb_produto(produto, valor, fornecedor, validade, quantidade) values ("Protetor Solar", 89.00, "Farmaceutica AD", 04/2032, 19);
insert tb_produto(produto, valor, fornecedor, validade, quantidade) values ("Amoxicilina", 20.00, "Farmaceutica RD", 02/2022, 59);
insert tb_produto(produto, valor, fornecedor, validade, quantidade) values ("Aspirina", 10.00, "Farmaceutica RD", 07/2030, 200);
insert tb_produto(produto, valor, fornecedor, validade, quantidade) values ("Condicionador", 15.00, "Farmaceutica RD", 07/2029, 31); 
insert tb_produto(produto, valor, fornecedor, validade, quantidade) values ("Fraudas", 55.00, "Farmaceutica ER", 07/2030, 13);

-- consulta todos produtos com valor maior do que 50 reais
select * from tb_produto where valor >= 51;

-- consulta todos produtos com a letra b
select * from tb_produtos where nome like  "%b%";

select produto, valor, quantidade, tb_categoria.pedido as pedido_da_categoria ,tb_categoria.ativo as estado_da_categoria
 from tb_produtos inner join tb_categoria on  tb_categoria.id = tb_produtos.categoria_id;
 
 select produto, valor, quantidade, tb_categoria.pedido as pedido_da_categoria ,tb_categoria.ativo as estado_da_categoria
 from tb_produtos inner join tb_categoria on  tb_categoria.id = tb_produtos.categoria_id where tb_categoria.pedido = "Pedido";
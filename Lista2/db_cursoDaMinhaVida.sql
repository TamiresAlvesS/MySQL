create database db_cursoDaMinhaVida;

use db_cursoDaMinhaVida;

create table tb_categoria(
id bigint auto_increment,
aluno varchar(255) not null,
turma varchar(255) not null,
matricula bigint not null,
primary key (id)
);

insert tb_categoria (aluno, turma, matricula) values ("Tamires Alves", "Turma A", "1141112345");
insert tb_categoria (aluno, turma, matricula) values ("Raul Elvas", "Turma A", "1141154321");
insert tb_categoria (aluno, turma, matricula) values ("Luiz Costa", "Turma B", "6789011411");
insert tb_categoria (aluno, turma, matricula) values ("Renato Ribeiro", "Turma C", "6375911411");
insert tb_categoria (aluno, turma, matricula) values ("Aline Silva", "Turma C", "985433333");

select * from tb_categoria;

create table tb_produto (
id bigint auto_increment,
curso varchar(255) not null,
turno varchar(255) not null,
periodo varchar (255) not null,
preco decimal not null,
categoria_id bigint,
primary key (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categoria (id)
);

insert tb_produto (curso, turno, periodo, preco, categoria_id) values ("Português", "Tarde", "oitavo", 150.00, 1);
insert tb_produto (curso, turno, periodo, preco, categoria_id) values ("Matematica", "Tarde", "oitavo", 150.00, 1);
insert tb_produto (curso, turno, periodo, preco, categoria_id) values ("Inglês", "manhã", 230, "oitavo", 200.00, 2);
insert tb_produto (curso, turno, periodo, preco, categoria_id) values ("Biologia", "Manhã", "nono", 90.00, 2);
insert tb_produto (curso, turno, periodo, preco, categoria_id) values ("Artes", "Manhã","nono", 90.00, 5);
insert tb_produto (curso, turno, periodo, preco, categoria_id) values ("Física", "Tarde", "sexto", 90.00, 4);
insert tb_produto (curso, turno, periodo, preco, categoria_id) values ("Geografia","Tarde", "sexto", 90.00, 4);
insert tb_produto (curso, turno, periodo, preco, categoria_id) values ("Historia", "Manhã", "sexto", 90.00, 5);

select * from tb_produto;

select * from tb_produto where preco > 50;

select * from tb_produto where preco between 3 AND 60;

select * from tb_produto where curso Like "J%";

select * from tb_produto where curso Like "%J%";

select curso, turno, periodo, preco, tb_categoria.aluno as nome_dos_alunos,tb_categoria.turma as turma_dos_alunos, tb_categoria.matricula as matricula_dos_alunos
 from tb_produto inner join tb_categoria on  tb_categoria.id = tb_produto.categoria_id;

  select * from tb_produto where tb_produto.turno like "Manhã";
create database desafio_ecommerce;

use desafio_ecommerce;

create table pessoafisica(
IdPessoaFisica int auto_increment primary key,
CPF char(11) not null,
constraint unique_cpf_PessoaFisica unique (CPF)
);

create table pessoajuridica(
IdPessoaJuridica int auto_increment primary key,
CNPJ char(15) not null,
constraint unique_CNPJ_PessoaJuridica unique (CNPJ)
);


create table endereco(
IdEndereco int auto_increment primary key,
Nome_Rua varchar(100),
Numero varchar(6),
Bairro varchar(20),
cep char(8),
Cidade varchar(45),
Estado varchar(45),
Pais varchar(45),
Complemento varchar(100)
);


create  table cliente(
	idClient int auto_increment primary key,
    Pnome varchar(30),
    NMeioInicial varchar(3),
	Sobrenome varchar(20),
    Data_de_Nascimento DATE,
    idc_PessoaFisica INT,
    idc_PessoaJuridica INT,
    idc_Endereco INT,
    constraint fk_idc_PessoaFisica foreign key (idc_PessoaFisica) references pessoafisica (IdPessoaFisica),
	constraint fk_idc_PessoaJuridica foreign key (idc_PessoaJuridica) references pessoajuridica (IdPessoaJuridica),
	constraint fk_idc_Endereco foreign key (idc_Endereco) references endereco (IdEndereco)
);

create table fornecedor(
	idFornecedor int auto_increment primary key ,
    Nome_Fornecedor varchar(45) not null,
    Contato varchar(45),
    idf_PessoaJuridica INT,
    idf_Endereco INT,
    constraint fk_idf_PessoaJuridica foreign key (idf_PessoaJuridica) references pessoajuridica (IdPessoaJuridica),
	constraint fk_idf_Endereco foreign key (idf_Endereco) references endereco (IdEndereco)
);

create table vendedor(
	idVendedor int auto_increment primary key,
    Razão_social varchar(45) not null,
    Contato char(11) not null,
    idv_PessoaFisica INT,
    idv_PessoaJuridica INT,
    idv_Endereco INT,
    constraint fk_idv_PessoaFisica foreign key (idv_PessoaFisica) references pessoafisica (IdPessoaFisica),
	constraint fk_idv_PessoaJuridica foreign key (idv_PessoaJuridica) references pessoajuridica (IdPessoaJuridica),
	constraint fk_idv_Endereco foreign key (idv_Endereco) references endereco (IdEndereco)
);

create  table produto(
	idProduto int auto_increment primary key,
    Nome_Produto varchar(30) not null,
    Classificação_Infantil bool default false,
	Categoria enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis') not null,
    avaliação float default 0,
    Tamanho varchar(10),
    Valor decimal(7,2)
);

create table produto_vendedor(
	idPVendedor int,
    idPProduto int,
    Quantidade_Produto int default 1,
    primary key (idPVendedor, idPProduto),
    constraint fk_Produto_Vendedor foreign key(idPVendedor) references vendedor(idVendedor),
    constraint fk_Produto_Produto foreign key (idPProduto) references produto(idProduto)
);

create table estoque(
	idEstoque int auto_increment primary key,
    idE_Endereco INT,
    Quantidade int default 0,
    constraint fk_idE_Endereco foreign key (idE_Endereco) references endereco(IdEndereco)
);

create table produto_em_estoque(
IdPE_Estoque int,
idPE_Produto int,
primary key(IdPE_Estoque,idPE_Produto),
constraint fk_IdPE_Estoque foreign key (IdPE_Estoque) references estoque (IdEstoque),
constraint fk_idPE_Produto foreign key (idPE_Produto) references produto(IdProduto)
);

create table produto_fornecedor(
idPF_Fornecedor int,
idPF_Produto int,
primary key(idPF_Fornecedor,idPF_Produto),
constraint fk_idPF_Fornecedor foreign key (idPF_Fornecedor) references fornecedor(IdFornecedor),
constraint fk_idPF_Produto foreign key (idPF_Produto) references produto(IdProduto)
);

create table produto_estoque(
idPE_Produto int,
idPE_Estoque int,
primary key(idPE_Produto,idPE_Estoque),
constraint fk_idPEE_Produto foreign key (idPE_Produto ) references produto(IdProduto),
constraint fk_idPEE_Estoque foreign key (idPE_Estoque) references estoque(IdEstoque)
);

create table status(
IdStatus int auto_increment primary key,
Status_s enum ('Enviado', 'Entregue', 'Em Processamento', 'Em andamento') default 'Em processamento');



create table entrega(
IdEntrega int auto_increment primary key,
Codigo_De_Rastreio varchar(45) not null unique,
idE_Status int,
constraint fk_idE_Status foreign key (idE_Status) references status(IdStatus)
);

create table pix(
IdPix int auto_increment primary key,
Chave varchar(45)
);

create table debito(
IdDebito int auto_increment primary key,
N_Banco varchar(45),
N_agencia varchar(45)
);

create table boleto(
idBoleto int auto_increment primary key,
Numero_do_Boleto VARCHAR(45) not null
);

create table credito(
idCredito int auto_increment primary key,
N_Cartao varchar(45) not null,
N_Banco varchar(45) not null,
N_Agencia varchar(45) not null,
Bandeira varchar(45) not null
);

create table forma_pagamento(
idForma_Pagamento int auto_increment primary key,
idF_Pix int,
idF_Debito int,
idF_Boleto int,
IdF_Credito int,
constraint fk_idF_Pix foreign key (idF_Pix) references pix(IdPix),
constraint fk_idF_Debito foreign key (idF_Debito ) references debito(IdDebito),
constraint fk_idF_Boleto  foreign key (idF_Boleto) references boleto(IdBoleto),
constraint fk_IdF_Credito foreign key (IdF_Credito) references credito(IdCredito)
);

create table pedido(
IdPedido int auto_increment primary key,
Descricao varchar(45) not null,
Frete float default 0,
idPCliente int not null,
idPEntrega int not null,
idPForma_Pagamento int not null,
constraint fk_idPCliente  foreign key (idPCliente) references cliente(IdClient),
constraint fk_idPEntrega  foreign key (idPEntrega ) references entrega(IdEntrega),
constraint fk_idPForma_Pagamento  foreign key (idPForma_Pagamento) references forma_pagamento(IdForma_Pagamento)
);

create table relacao_produto_pedido(
idRP_Produto int,
idRP_Pedido int,
Quantidade int not null,
primary key(idRP_Produto, idRP_Pedido),
constraint fk_idRP_Produto  foreign key (idRP_Produto) references produto(IdProduto),
constraint fk_idRP_Pedido  foreign key (idRP_Pedido) references pedido(IdPedido)
);
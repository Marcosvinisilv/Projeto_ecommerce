CREATE DATABASE oficina_desafios;

use oficina_desafios;

CREATE TABLE veiculos (
idveiculos int auto_increment primary key,
tipoveiculo enum('caminhão','carro','moto','onibus','trator') default 'carro',
marca varchar(45) not null,
placa varchar(45)
);

create table pessoafisica(
idpessoafisica int auto_increment primary key,
cpf char(11) not null,
constraint unique_cpf_pessoafisica unique (cpf)
);

create table pessoajuridica(
idpessoajuridica int auto_increment primary key,
cnpj char(15) not null,
constraint unique_cnpj_pessoajuridica unique (cnpj)
);

CREATE TABLE clientes(
idclientes int auto_increment primary key,
nomecliente varchar(45),
contato varchar(45),
email varchar(45),
idc_veiculos int,
idc_pessoafisica INT,
idc_pessoajuridica INT,
constraint idc_veiculos foreign key(idc_veiculos) references veiculos(idveiculos),
constraint fk_idc_pessoafisica foreign key (idc_pessoafisica) references pessoafisica (idpessoafisica),
constraint fk_idc_pessoajuridica foreign key (idc_pessoajuridica) references pessoajuridica (idpessoajuridica)
);

CREATE TABLE pecas(
Idpecas int auto_increment primary key,
pecas varchar(45) not null,
quantidade int
);

CREATE TABLE diagnostico(
iddiagnostico int auto_increment primary key,
resultados varchar(45),
idd_veiculos int,
idd_pecas int,
quantidade_de_horas datetime,
constraint idd_pecas foreign key(idd_pecas) references pecas(Idpecas),
constraint idd_veiculos foreign key(idd_veiculos) references veiculos(idveiculos)
);

CREATE TABLE preço_de_pecas(
id_preco_de_pecas int auto_increment primary key,
pecas varchar(45),
precos decimal(7,2)
);

create table endereco(
idendereco int auto_increment primary key,
nome_rua varchar(100),
numero varchar(6),
bairro varchar(20),
cep char(8),
cidade varchar(45),
estado varchar(45),
pais varchar(45),
complemento varchar(100)
);

CREATE TABLE mecanicos(
idmecanicos int auto_increment primary key,
nome varchar(45) not null,
nivel varchar(45) not null,
especialidade varchar(45) not null,
idm_endereco int,
constraint fk_idm_endereco foreign key(idm_endereco) references endereco(idendereco)
);


CREATE TABLE equipes(
idequipes int auto_increment primary key,
area_de_atuacao varchar(45),
ide_mecanicos int,
constraint fk_ide_mecanicos foreign key(ide_mecanicos) references mecanicos(idmecanicos)
);

CREATE TABLE preco_servico(
id_precoservico int auto_increment primary key,
preco_servico float not null,
idp_mecanicos int,
idp_diagnostico int,
idp_veiculos int,
constraint fk_idp_mecanicos foreign key(idp_mecanicos) references mecanicos(idmecanicos),
constraint fk_idp_veiculos foreign key(idp_veiculos) references veiculos(idveiculos)
);

CREATE TABLE valor(
idvalor int auto_increment primary key,
valor_total varchar(45) not null,
idv_precoservico int,
idv_precodepecas int,
idv_diagnostico int,
constraint fk_idv_precoservico foreign key(idv_precoservico) references preco_servico(id_precoservico),
constraint fk_idv_precodepecas foreign key(idv_precodepecas) references preço_de_pecas(id_preco_de_pecas),
constraint fk_idv_diagnostico foreign key(idv_diagnostico) references diagnostico(iddiagnostico)
);

CREATE TABLE os(
idos int auto_increment primary key,
data_entrega datetime not null,
data_emissao datetime not null,
status varchar(45),
ids_valor int,
constraint fk_ids_valor foreign key(ids_valor)references valor(idvalor)
);




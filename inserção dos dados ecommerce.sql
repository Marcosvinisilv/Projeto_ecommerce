use desafio_ecommerce;

insert into pessoafisica(CPF) 
	values('81648896014'),
			('93042807029'),
			('91084596067'),
			('81024608069'),
			('13896316052'),
			('83604686059'),
			('48294099082'),
			('14708365055'),
			('25142202031'),
            ('81621196410');
            
insert into pessoajuridica(CNPJ) 
	values('15208235000140'),
			('02678282000106'),
			('83250069000109'),
            ('32803571000150'),
			('77702993000178'),
			('66255973000180'),
			('81329346000130'),
			('04150740000165'),
			('19850435000153'),
            ('32030056000185');
            
insert into endereco (Nome_Rua,Numero,Bairro,cep,Cidade,Estado,Pais,Complemento)
	values('rua silva de prata','29', 'Carangola',09452120,'Cidade das flores','SP','BR',null),
		('rua alemeda' ,'289','Centro','72020000','Cidade das flores','GO','BR',null),
        ('avenida almeda vinha', '1009', 'Centro','57081356','Cidade das flores','SP','BR',null),
        ('rua lareijas', '861', 'Centro','68900033','Cidade das flores','SP','BR',null),
        ('avenida koller', '19', 'Centro','49010450','Cidade das flores','SP','BR',null),
        ('rua alemeda das flores','28','Centro','77814480','Cidade das flores','SP','BR','apartamento-51,bloco-7'),
        ('rua dos calangos','24', 'Carangola',09122120,'Cidade das flores','SP','BR',null),
		('rua dos medicos' ,'259','Centro','72022100','Cidade das flores','GO','BR',null),
        ('avenida vinha', '5100', 'Centro','57481346','Cidade das flores','SP','BR',null),
        ('rua doce lar', '291', 'Centro','68904133','Cidade das flores','SP','BR',null),
        ('avenida kiwi', '141', 'Centro','49910450','Cidade das flores','SP','BR',null),
        ('rua florinda','28','Centro','77814480','Cidade das flores','SP','BR','apartamento-34,bloco-5'),
        ('rua silva de ouro','39', 'Carangola',09452420,'Cidade das flores','SP','BR',null),
		('rua chaves','287','Centro','72020410','Cidade das flores','GO','BR',null),
        ('avenida keico', '1069', 'Centro','57148356','Cidade das flores','SP','BR',null),
        ('rua das lendas', '851', 'Centro','68911033','Cidade das flores','SP','BR',null),
        ('avenida sebastião', '14', 'Centro','49010451','Cidade das flores','SP','BR',null),
        ('avenida perreira barreto','28','Centro','74811180','Cidade das flores','SP','BR','apartamento-17,bloco-3'),
		('avenida das naçoes','49', 'Carangola',09400210,'Cidade das flores','SP','BR',null),
		('rua correia sampaio' ,'269','Centro','72029991','Cidade das flores','GO','BR',null);

insert into cliente(Pnome,NMeioInicial,Sobrenome,Data_de_Nascimento,idc_PessoaFisica,idc_PessoaJuridica,idc_Endereco)
	values('Maria', 'M', 'Silva','1993-02-24',1,null,1),
		  ('Matheus', 'O', 'Pimentel','1950-01-21',2,null,2),
          ('Ricardo', 'F', 'Silva','1978-12-20',3,null,3),
          ('Julia', 'S', 'França','1982-08-02',4,null,4),
          ('Roberta', 'G', 'Assis','2000-10-03',5,null,5),
          ('Isabela', 'M', 'Cruz','2010-01-24',6,null,6),
		  ('Ricard', 'F', 'Silva','1978-12-10',7,null,7),
          ('Julia', 'S', 'França','1982-08-02',8,null,8),
          ('Roberto', 'G', 'Assis','2001-10-04',9,null,9),
          ('Isadora', 'M', 'Cruz','2005-01-14',10,null,10);
          
insert into fornecedor(Nome_Fornecedor,Contato,idf_PessoaJuridica,idf_Endereco)
	values('Almeida e filhos','(11)945678912',1,11),
		  ('Eletrônicos Silva','(11)951964914',2,12),
		  ('Eletrônicos Valma','(11)956789393',3,13),
          ('Eletrônicos Pereira','(11)955684914',4,14),
		  ('Marcenaria Rufus','(11)956712043',5,15),
          ('Almeida e filhos','(11)945678912',6,11);
          
insert into vendedor(Razão_social,Contato,idv_PessoaFisica,idv_PessoaJuridica,idv_Endereco)
	values('Tech eletronics','11956652043',null,6,16),
		  ('Botique Durgas','11955472043',null,7,17),
		  ('Kids World','11912012043',null,8,18),
          ('Tech Max','11956612013',null,9,19),
		  ('Borracharia tio Zé','11956987043',null,10,20);
          
-- 'Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Móveis'
insert into produto(Nome_Produto,Classificação_Infantil ,Categoria ,avaliação,Tamanho,Valor) -- inserção de valor
	values('Fone de ouvido', false, 'Eletrônico', '4', null,25.00),
		  ('Barbie Elsa', true, 'Brinquedos', '3', null,12.00),
		  ('Body Carters', true, 'Vestimenta', '5','M',50.00),
		  ('Microfone Vedo - Youtuber', False, 'Eletrônico', '4', null,400.00),
		  ('Sofá retrátil', False, 'Móveis', '3', '3x57x80',1500.99),
		  ('Farinha de arroz', False, 'Alimentos', '2', null,5.90),
		  ('Fire Stick Amazon', False, 'Eletrônico', '3','G',599.99);


insert into produto_vendedor(idPVendedor,idPProduto,Quantidade_Produto)
	values(1,1,80),
		  (1,2,90),
          (2,3,100),
		  (3,4,120),
          (4,5,30),
		  (5,6,50),
          (5,7,5);
          
insert into estoque(idE_Endereco,Quantidade)
	values(16, 1000),
		  (17, 500),
		  (18, 10),
		  (19, 100),
		  (20, 10),
		  (20, 60);
          
insert into produto_em_estoque(IdPE_Estoque,idPE_Produto)
	values(1, 1),
		  (2, 2),
		  (3, 3),
		  (4, 4),
		  (5, 5);

-- ('Enviado', 'Entregue', 'Em Processamento', 'Em andamento')
insert into status (Status_s) values
('Enviado'),
('Enviado'),
('Entregue'),
(default),
('Em andamento');

insert into entrega(Codigo_De_Rastreio,idE_Status)
	values('1542CP',1),
          ('4285CP',2),
          ('2145CP',3),
          ('7952CP',4),
          ('3210CP',5);

insert into pix(Chave)
	values('s4da55a4s');
    
insert into debito(N_Banco, N_Agencia)
	values('237','0541');

insert into boleto(Numero_do_Boleto)
	values('65757566564554529421927179519711727279127927');

insert into credito(N_Cartao,N_banco,N_agencia,Bandeira)
	values('4654881984','237','0541','Master Card');

insert into forma_pagamento(idF_Pix,idF_Debito,idF_Boleto,IdF_Credito)
values(1,null,null,null),
	  (null,1,null,null),
	  (null,null,1,null),
	  (null,null,null,1);

insert into pedido(Descricao,Frete,idPCliente,idPEntrega,idPForma_Pagamento)
	values('10',10,1,1,5),
          ('15',20,2,2,6),
          ('20',15,3,3,7),
          ('30',default,4,4,8);
          
insert into relacao_produto_pedido(idRP_Pedido,idRP_Produto,Quantidade)
	values(9,1,2),
		  (10,2,10),
		  (11,3,5),
          (12,4,30);
          
		 
-- 1-Quantos pedidos foram feitos por cada cliente?
select Pnome,count(*) as N_Pedidos
from pedido p 
inner join cliente c on p.IdPedido = c.idClient
group by Pnome;

-- 2-Algum vendedor também é fornecedor?
select * from vendedor v
inner join fornecedor f on f.idf_PessoaJuridica = v.idv_PessoaJuridica;

-- 3-Relação de produtos fornecedores e estoques;
select * from produto;
select * from fornecedor;
select * from estoque;

-- 4-Relação de nomes dos fornecedores e nomes dos produto
select Nome_Produto from produto;
select Nome_Fornecedor from fornecedor;






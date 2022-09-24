use oficina_desafios;

insert into pessoafisica(CPF) 
	values('81648896014'),
			('93042807029'),
			('91084596067'),
			('81024608069');
			
            
insert into pessoajuridica(CNPJ) 
	values('15208235000140'),
			('02678282000106'),
			('83250069000109'),
            ('32803571000150');
            
insert into veiculos (tipoveiculo,marca,placa) values
('caminhão','Ford','FO123456'),
('carro','Fiat','FI7890123'),
('moto','Suzuki','SUZ3456788'),
('onibus','Marcedes','MER456789'),
('trator','Volvo','TRAR57890654');

insert into clientes(nomecliente,contato,email,idc_veiculos,idc_pessoafisica,idc_pessoajuridica)
	values
		  ('Matheus',11987842692,'matheus@gmail.com',1,1,null),
          ('Maria',11976543123,'maria@gmail.com',2,2,null),
          ('Joao',1198745849,'joão@gmail.com',3,3,null),
          ('Felipe',123445434,'felipe@gmail.com',4,4,null);
          

insert into pecas(pecas,quantidade)values
('Pistão',5),
('Motor',10),
('Cambio',5),
('Volante',6);

insert into diagnostico(resultados,idd_veiculos,idd_pecas,quantidade_de_horas)
values
('Necessário manutenção',1,1,'2022-09-25'),
('Não necessita manutenção',2,2,'2022-12-25'),
('Necessário manutenção',3,3,'2023-02-28'),
('Não necessita manutenção',4,4,'2022-10-30');

insert into preço_de_pecas(pecas,precos)
values
('Pistão',5.00),
('Motor',10.00),
('Cambio',12.00),
('Volante',6.00),
('Painel',20.00),
('Pneu',30.00);

insert into  endereco (Nome_Rua,Numero,Bairro,cep,Cidade,Estado,Pais,Complemento)
	values('rua silva de prata','29', 'Carangola',09452120,'Cidade das flores','SP','BR',null),
		('rua alemeda' ,'289','Centro','72020000','Cidade das flores','GO','BR',null),
        ('avenida almeda vinha', '1009', 'Centro','57081356','Cidade das flores','SP','BR',null),
        ('rua lareijas', '861', 'Centro','68900033','Cidade das flores','SP','BR',null),
        ('avenida koller', '19', 'Centro','49010450','Cidade das flores','SP','BR',null),
        ('rua alemeda das flores','28','Centro','77814480','Cidade das flores','SP','BR','apartamento-51,bloco-7'),
        ('rua dos calangos','24', 'Carangola',09122120,'Cidade das flores','SP','BR',null),
		('rua dos medicos' ,'259','Centro','72022100','Cidade das flores','GO','BR',null),
        ('avenida vinha', '5100', 'Centro','57481346','Cidade das flores','SP','BR',null),
        ('rua doce lar', '291', 'Centro','68904133','Cidade das flores','SP','BR',null);
        
insert into mecanicos(nome,nivel,especialidade)
values('Victor',1, 'Motor'),
	  ('Marcos',2, 'Painel'),
      ('Caio', 3, 'Mecanica'),
      ('Jonatas',4,'Cambio');

 insert into equipes(area_de_atuacao,ide_mecanicos)
 values('mecanica',1),
	   ('eletrica',2),
       ('mecanica',3),
       ('mecanica',4);
       
insert into preco_servico(preco_servico,idp_mecanicos,idp_diagnostico,idp_veiculos)
	values('500.00','1','1','1'),
			('1000.00','2','2','2'),
			('800.00','3','3','3'),
			('650.00','4','4','4');
    
insert into valor(valor_total,idv_precoservico,idv_precodepecas,idv_diagnostico)
	values('1500.00','1','1','1'),
			('2500.00','2','2','2'),
			('1000.00','3','3','3'),
			('2000.00','4','4','4');
    
insert into os(data_entrega,data_emissao,status,ids_valor)
values('2022-09-25','2020-09-23','Finalizado','1'),
		('2022-12-25','2020-09-23','Finalizado','2'),
		('2023-02-28','2020-09-23','Finalizado','3'),
		('2022-10-30','2020-09-23','Finalizado','4');
        
        
-- Questões 

-- Quais os Cpfs dos clientes e seus veiculos?

SELECT c.nomecliente , pf.cpf,v.tipoveiculo,v.marca,v.placa
FROM clientes c
INNER JOIN pessoafisica pf ON c.idc_pessoafisica = pf.idpessoafisica
INNER JOIN veiculos v ON v.idveiculos = c.idc_veiculos
order by c.nomecliente desc;


-- Quais clientes são atendidos por cada equipe de mecanico?

SELECT e.area_de_atuacao,count(c.nomecliente)as numero_de_clientes
FROM clientes c
INNER JOIN veiculos v ON v.idveiculos = c.idc_veiculos
INNER JOIN diagnostico d ON v.idveiculos = d.idd_veiculos
INNER JOIN preco_servico ps ON d.iddiagnostico = ps.idp_diagnostico
INNER JOIN mecanicos m ON ps.idp_mecanicos = m.idmecanicos
INNER JOIN equipes e ON m.idmecanicos = e.ide_mecanicos
GROUP BY e.area_de_atuacao
HAVING numero_de_clientes > 1;

-- Qual o valor da manutenção de cada cliente?

SELECT c.nomecliente,va.valor_total FROM clientes  c
INNER JOIN veiculos v ON v.idveiculos = c.idc_veiculos
INNER JOIN diagnostico d ON v.idveiculos = d.idd_veiculos
INNER JOIN valor va ON d.iddiagnostico = va.idv_diagnostico
WHERE va.valor_total >1000.00;

-- Calcule a soma do valor de todas as pecas

SELECT SUM(precos) FROM preço_de_pecas;

-- Soma dos precos das pecas que foram utilizadas

SELECT CONCAT('R$ ' ,SUM(precos)) as Preços FROM pecas p
INNER JOIN diagnostico d ON p.idpecas = d.idd_pecas
INNER JOIN valor v ON d.iddiagnostico = v.idv_diagnostico 
INNER JOIN preço_de_pecas pr ON v.idv_precodepecas = pr.id_preco_de_pecas ;


-- Saber valores que estão entre 1000 e 2500
SELECT * FROM valor
WHERE valor_total BETWEEN 1100 AND 2499 ;

SELECT * FROM Clientes 
WHERE nomecliente like '%Ma%'
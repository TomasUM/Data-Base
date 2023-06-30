-- -- 
-- Universidade do Minho
-- Disciplina de Bases de Dados
-- A Linguagem SQL
-- Manipulação de Dados
-- Caso de Estudo: José Amargo's Sweets
-- Povoamento inicial da base de dados.
-- MySQL 8.0.28 (MySQL Community Server GPL)
-- 2023, Maio
-- --

-- Permissão para fazer operações de remoção de dados.
SET SQL_SAFE_UPDATES = 0;
 DELETE FROM FuncionarioDonut;
 DELETE FROM CompraDonut;
 DELETE FROM Donut;
 DELETE FROM Compra;  
 DELETE FROM Funcionario;
 DELETE FROM Cliente;


-- Indicação da base de dados de trabalho
USE JoseAmargoSweets;


-- Povoamento das tabelas da base de dados
--
-- Povoamento da tabela "Cliente"
-- DESC Cliente;
-- SELECT * FROM Cliente;
-- DELETE FROM Cliente;
INSERT INTO Cliente
	(idCliente, PrimeiroNome, Apelido, Email, Telemovel)
	VALUES
	('1','Wanda','Maximoff','scarletwitch@marvel.com','905672143'),
    ('2','Vision','Pikachu','vision@marvel.com','922874562'),
    ('3','Sam','Wilson','falcon@marvel.com','942113456'),
    ('4','Bucky','Barnes','wintersoldier@marvel.com','914325871'),
    ('5','Natasha','Romanoff','blackwidow@marvel.com','968457239'),
    ('6','Loki','Zorlak','loki@marvel.com','978532014'),
    ('7','Thor','Odison','thor@marvel.com','925641783'),
    ('8','Tony','Stark','ironman@marvel.com','932156479'),
    ('9','Steve','Rogers','captainamerica@marvel.com','996548321'),
    ('10','Janet','Dyke','wasp@marvel.com','973245168'),
    ('11','Hank','Pym','antman@marvel.com','957813264'),
    ('12','Bruce','Banner','hulk@marvel.com','935247610'),
    ('13','Clint','Barton','hawkeye@marvel.com','964185327'),
    ('14','Pietro','Maximoff','quicksilver@marvel.com','999876543'),
    ('15','Jacques','Duquesne','swordsman@marvel.com','919876532')
    ;



-- Povoamento da tabela "Funcionario"
-- DESC Funcionario;
-- SELECT * FROM Funcionario;
-- DELETE FROM Funcionario;
INSERT INTO Funcionario
    (idFuncionario, PrimeiroNome, Apelido, Email, Telemovel, Funcao, Salario)
    VALUES
    ('1','Maria','Mel','lilmaria@skrt.com','917777777','Gestor','21'),
    ('2','Ricardo','Leitão','dabairrada@comolho.com','919191919','Pasteleiro','14'),
    ('3','Peter','Oak','oakslab@mclovin.com','901234567','Pasteleiro','14'),
    ('4','Francisco','Amargo','yungfrancis@yessir.pt','999991111','Operador de Caixa','9'),
    ('5','Julia','Richards','whatisgoingon@ft.com','900000001','Operador de Caixa','9')
    ;
    
-- Povoamento da tabela "Compra"
-- DESC Compra;
-- SELECT * FROM Compra;
-- DELETE FROM Compra;   
    INSERT INTO Compra
    (idCompra, MetodoPagamento, DataCompra, ValorTotal, ClienteID, FuncionarioID)
    VALUES
    ('1','Cartão de Crédito','2022-03-11','19.88','1','5'),
    ('2','Numerário','2022-03-11','13.51','4','4'),
    ('3','Numerário','2022-03-11','14.61','15','4'),
    ('4','Numerário','2022-03-11','4.77','7','4'),
    ('5','Cartão de Crédito','2022-03-12','4.47','9','5'),
    ('6','Numerário','2022-03-12','7.95','11','4'),
    ('7','Cartão de Crédito','2022-03-12','19.67','2','4'),
    ('8','Numerário','2022-03-12','9.74','11','5'),
    ('9','Numerário','2022-03-12','6.76','3','5'),
    ('10','Cartão de Crédito','2022-03-12','7.95','13','4'),
    ('11','Cartão de Crédito','2022-03-12','19.78','14','4'),
    ('12','Numerário','2022-03-13','20.07','8','4'),
    ('13','Cartão de Crédito','2022-03-13','12.82','5','5'),
    ('14','Numerário','2022-03-13','14.8','10','4'),
    ('15','Cartão de Crédito','2022-03-13','13.91','6','5'),
    ('16','Cartão de Crédito','2022-03-13','5.07','12','5'),
    ('17','Numerário','2022-03-13','1.59','1','4'),
    ('18','Numerário','2022-03-13','19.18','4','4'),
    ('19','Numerário','2022-03-14','8.65','9','5'),
    ('20','Cartão de Crédito','2022-03-14','6.36','11','4'),
    ('21','Numerário','2022-03-14','8.45','12','5');



-- Povoamento da tabela "Donut"
-- DESC Donut;
-- SELECT * FROM Donut;
-- DELETE FROM Donut;
INSERT INTO Donut
	(idDonut, Nome, Preco, Calorias, Tipo , Descricao)
	VALUES
	('1','Reeses Classic Doughnut','1.79','340','iced,filled','A doughnut filled with REESE’S Peanut Butter Kreme™, dipped in HERSHEY’S chocolate icing, topped with mini peanut butter chips and a drizzle of chocolate and REESE’S peanut butter sauce.'),
    ('2','Original Filled Original Kreme','1.59','280','iced,filled','Original Filled, Original Kreme™ Doughnut: Our iconic Original Glazed® Doughnut filled with classic White Kreme™ and decorated with an icing drizzle.'),
    ('3','Original Filled Chocolate Kreme','1.59','280','iced, filled, chocolate','Original Filled, Chocolate Kreme™ Doughnut: Our iconic Original Glazed® Doughnut filled with Chocolate Kreme™ and decorated with a chocolate icing drizzle.'),
    ('4','Original Glazed','1.29','190','iced,filled','When we turn the light on, it means that our delicious Original Glazed® Doughnuts are available right at that very moment! Glazed® doughnuts.'),
    ('5','Chocolate Iced Glazed','1.49','240','iced, glazed, chocolate','Chocolate lovers take note! We take our Original Glazed® doughnut one simple, yet delicious, step further by hand-dipping it in smooth, delectable chocolate icing.'),
    ('6','Chocolate Iced Glazed with Sprinkles','1.49','250','iced,filled',''),
    ('7','Oreo Cookies and Kreme','1.79','390','filled, chocolate,  iced','Our OREO® Cookies and Kreme Doughnut is a fan favorite! Filled with OREO Cookies and Kreme filling, dipped in dark chocolate icing and topped with OREO cookie pieces. You dont want to miss this.'),
    ('8','Chocolate Iced with Kreme Filling','1.69','350','chocolate, iced, filled','A favorite of many, this yummy variety is filled with our light and smooth KREME™ filling. It is then dipped in our classic chocolate icing to create a delectably balanced treat.'),
    ('9','Cake Batter','1.69','350','filled, iced',''),
    ('10','Chocolate Iced Custard Filled','1.69','300','iced, filled, chocolate','Chocolate Iced Custard Filled'),
    ('11','Glazed Raspberry Filled','1.69','290','glazed, filled',''),
    ('12','Glazed Lemon Filled','1.69','290','glazed, filled',''),
    ('13','Strawberry Iced with Sprinkles','1.39','210','iced',''),
    ('14','Apple Fritter','1.59','300','glazed',''),
    ('15','Chocolate Glazed Doughnut','1.59','300','glazed, chocolate',''),
    ('16','Glazed with Kreme Filling','1.59','300','glazed, filled',''),
    ('17','Chocolate Iced Cake','1.59','300','iced, cake, chocolate',''),
    ('18','Chocolate Iced Raspberry Filled','1.59','300','iced, chocolate, chocolate',''),
    ('19','Glazed  Chocolate Cake','1.49','300','glazed, chocolate, cake',''),
    ('20','Glazed Blueberry Cake','1.49','300','glazed, cake','')
    ;
    
    
        
-- Povoamento da tabela "CompraDonut"
-- DESC CompraDonut;
-- SELECT * FROM CompraDonut;
-- DELETE FROM CompraDonut;
INSERT INTO CompraDonut
    (idCompra, idDonut, Quantidade, Preco)
    VALUES
    ('1','7','4','1.79'),
    ('1','18','1','1.59'),
    ('1','3','2','1.59'),
    ('1','14','5','1.59'),
    ('2','5','3','1.49'),
    ('2','16','1','1.59'),
    ('2','20','5','1.49'),
    ('3','9','3','1.69'),
    ('3','13','2','1.39'),
    ('3','11','4','1.69'),
    ('4','1','1','1.79'),
    ('4','19','2','1.49'),
    ('5','6','3','1.49'),
    ('6','15','5','1.59'),
    ('7','8','4','1.69'),
    ('7','10','1','1.69'),
    ('7','2','3','1.59'),
    ('7','4','5','1.29'),
    ('8','12','2','1.69'),
    ('8','17','4','1.59'),
    ('9','9','1','1.69'),
    ('9','8','3','1.69'),
    ('10','3','5','1.59'),
    ('11','6','2','1.49'),
    ('11','20','1','1.49'),
    ('11','11','4','1.69'),
    ('11','7','3','1.79'),
    ('11','16','2','1.59'),
    ('12','14','5','1.59'),
    ('12','1','1','1.79'),
    ('12','13','4','1.39'),
    ('12','15','3','1.59'),
    ('13','10','2','1.69'),
    ('13','5','1','1.49'),
    ('13','2','5','1.59'),
    ('14','19','4','1.49'),
    ('14','4','3','1.29'),
    ('14','12','2','1.69'),
    ('14','18','1','1.59'),
    ('15','17','5','1.59'),
    ('15','20','4','1.49'),
    ('16','11','3','1.69'),
    ('17','3','1','1.59'),
    ('18','14','2','1.59'),
    ('18','1','5','1.79'),
    ('18','13','4',1.39),
    ('18','19','1','1.49'),
    ('19','9','3','1.69'),
    ('19','7','2','1.79'),
    ('20','15','4','1.59'),
    ('21','10','5','1.69')
    ;
    
    
    
-- Povoamento da tabela "FuncionarioDonut"
-- DESC FuncionarioDonut;
-- SELECT * FROM FuncionarioDonut;
-- DELETE FROM FuncionarioDonut;
INSERT INTO FuncionarioDonut
    (idFuncionario, idDonut)
    VALUES
    ('2','1'),
    ('2','2'),
    ('2','3'),
    ('2','4'),
    ('2','5'),
    ('2','6'),
    ('2','7'),
    ('2','8'),
    ('2','9'),
    ('2','10'),
    ('2','11'),
    ('2','12'),
    ('2','13'),
    ('3','14'),
    ('3','15'),
    ('3','16'),
    ('3','17'),
    ('3','18'),
    ('3','19'),
    ('3','20'),
    ('3','1'),
    ('3','2'),
    ('2','19')
    ;
    
    
    
    
--  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- 	QUERIES SOBRE CLIENTES \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


-- Esta view devolde uma lista com informacoes de todos os clientes --------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DROP VIEW TodosClientes;
CREATE VIEW TodosClientes AS
   SELECT *
   FROM Cliente
   ORDER BY idCliente ASC;
   
   
-- Esta view devolde uma lista com informacoes sobre os 5 melhores clientes ------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DROP VIEW Top5Cliente;

CREATE VIEW Top5Clientes AS
SELECT c.idCliente, CONCAT(c.PrimeiroNome,' ',c.Apelido) AS Nome, SUM(co.ValorTotal) AS TotalPurchaseAmount
FROM Cliente c INNER JOIN Compra co 
                   ON c.idCliente = co.ClienteID
GROUP BY c.idCliente, CONCAT(c.PrimeiroNome,' ',c.Apelido)
ORDER BY TotalPurchaseAmount DESC
LIMIT 5;


-- Esta PROCEDURE devolde a lista de informacoes sobre os n (valor introduzido) melhores clientes. ----------------------------------------------------------------------------------------------------------------------------------------
-- DROP PROCEDURE melhoresClientes;
DELIMITER $$
CREATE PROCEDURE melhoresClientes(val INT)
	BEGIN
	SELECT c.idCliente, CONCAT(c.PrimeiroNome,' ',c.Apelido) AS Nome, SUM(co.ValorTotal) AS TotalCompras
	FROM Cliente c INNER JOIN Compra co 
                   ON c.idCliente = co.ClienteID
	GROUP BY c.idCliente, CONCAT(c.PrimeiroNome,' ',c.Apelido)
	ORDER BY TotalCompras DESC
	LIMIT val;
	END $$
DELIMITER ;


-- Esta PROCEDURE devolve as informacoes de um dado cliente com base no seu ID. ----------------------------------------------------------------------------------------------------------------------------------------------------------
-- DROP PROCEDURE infoCliente;
DELIMITER $$
    CREATE PROCEDURE infoCliente(id_Cliente INT)
    BEGIN
    SELECT *
    FROM Cliente AS C
    WHERE C.idCliente = id_Cliente;
    END $$
DELIMITER ;


-- Esta PROCEDURE devolve uma lista com as informacoes das compras efetuadas por um Cliente,usando o seu ID. ---------------------------------------------------------------------------------------------------------------------------- 

DELIMITER $$
    CREATE PROCEDURE infoClienteCompra(id_Cliente INT)
    BEGIN
    SELECT CP.*
    FROM Cliente AS C INNER JOIN Compra AS CP
                            ON C.idCliente = CP.ClienteID
    WHERE CP.ClienteID = id_Cliente;                        
    END $$
DELIMITER ;   
   
   
   
-- Esta PROCEDURE insere um cliente novo na base de dados. ---------------------------------------------------------------------------------------------------------------------------- 
-- DROP PROCEDURE inserirCliente;
DELIMITER $$
    CREATE PROCEDURE inserirCliente(idCliente INT, PrimeiroNome VARCHAR(75), Apelido VARCHAR(75), Email VARCHAR(150), Telemovel INT)
    BEGIN
	INSERT INTO Cliente
		(idCliente, PrimeiroNome, Apelido, Email, Telemovel)
		VALUES
		(idCliente, PrimeiroNome, Apelido, Email, Telemovel);        
    END $$
DELIMITER ;  
   
   
-- Esta PROCEDURE remove um cliente do sistema,usando o seu ID. ----------------------------------------------------------------------------------------------------------------------------    
-- DROP PROCEDURE eliminarCliente;
DELIMITER $$
    CREATE PROCEDURE eliminarCliente(id INT)
    BEGIN
	UPDATE Cliente
    SET PrimeiroNome = "NULL", Apelido = "NULL", Email = "NULL", Telemovel = 0
	WHERE id=idCliente;
    END $$
DELIMITER ;  
   
   
   
-- Esta PROCEDURE modifica informações de um certo cliente,usando o seu ID. ----------------------------------------------------------------------------------------------------------------------------    
-- DROP PROCEDURE modificarCliente;
DELIMITER $$
    CREATE PROCEDURE modificarCliente(id INT, PrimeiroNome VARCHAR(75), Apelido VARCHAR(75), Email VARCHAR(150), Telemovel INT)
    BEGIN
	UPDATE Cliente
    SET PrimeiroNome = PrimeiroNome, Apelido = Apelido, Email = Email, Telemovel = Telemovel
	WHERE id=idCliente; 
    END $$
DELIMITER ;  
   
   
   
   
   
   
   
   
   
   
--  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- 	QUERIES SOBRE COMPRA \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


-- Esta view devolve uma lista com informacao de todas as vendas efetuadas na pastelaria.---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DROP VIEW TodasCompras;

CREATE VIEW TodasVendas AS
   SELECT *
   FROM Compra
   ORDER BY idCompra ASC;


-- Esta view devolve o numero total de vendas efetuadas na pastelaria. ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DROP VIEW TotalVendas;   

CREATE VIEW TotalVendas AS   
   SELECT COUNT(*) AS TotalPurchases
   FROM Compra;   


--  Esta view devolve um relatório de vendas que mostra o número de vendas realizadas, a quantidade e o valor dos produtos vendidos. ------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DROP VIEW RelatorioVendas;
   
CREATE VIEW RelatorioVendas AS
   SELECT MAX(c.idCompra) AS NumerodeVendas,
          SUM(cd.Quantidade) AS DonutsVendidos,
          SUM(cd.Preco * cd.Quantidade) AS Valor
   FROM CompraDonut AS cd INNER JOIN Compra AS c ON cd.idCompra = c.idCompra;


-- Esta PROCEDURE devolve uma lista com a informacao de todas as vendas efetuadas num certo dia. ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER //
CREATE PROCEDURE vendasDia(data_input DATE)
	BEGIN
		 SELECT *
         FROM Compra
         WHERE DATE(DataCompra) = DATE(data_input);
	END //
DELIMITER ;   

-- vendas em ano e mes

      
    
-- Esta PROCEDURE insere uma nova compra na base de dados. ---------------------------------------------------------------------------------------------------------------------------- 
-- DROP PROCEDURE inserirCompra;
DELIMITER $$
    CREATE PROCEDURE inserirCompra(id_Compra INT, Metodo_Pagamento VARCHAR(75), Data_Compra DATE, Valor_Total DECIMAL(8,2), Cliente_ID INT, Funcionario_ID INT, numDonutsDiferentes INT)
    BEGIN
	INSERT INTO Compra
		(idCompra, MetodoPagamento, DataCompra, ValorTotal, ClienteID, FuncionarioID)
    VALUES
		(id_Compra, Metodo_Pagamento, Data_Compra, Valor_Total, Cliente_ID, Funcionario_ID);
    END $$
DELIMITER ;  
   
   
-- Esta PROCEDURE elimina uma certa compra na base de dados. ----------------------------------------------------------------------------------------------------------------------------    
-- DROP PROCEDURE eliminarCompra;
DELIMITER $$
    CREATE PROCEDURE eliminarCompra(id_Compra INT)
    BEGIN
    
    DELETE CP.*
    FROM CompraDonut AS CP
    WHERE CP.idCompra=id_Compra;
    
	DELETE C.*
    FROM Compra AS C
    WHERE C.idCompra=id_Compra;
    
    END $$
DELIMITER ;     
   
-- Esta PROCEDURE modifica uma certa compra na base de dados. ----------------------------------------------------------------------------------------------------------------------------    
-- DROP PROCEDURE modificaCompra;
DELIMITER $$
    CREATE PROCEDURE modificaCompra(id_Compra INT, Metodo_Pagamento VARCHAR(75), Data_Compra DATE, Valor_Total DECIMAL(8,2), Cliente_ID INT, Funcionario_ID INT)
    BEGIN
	UPDATE Compra
    SET idCompra=id_Compra , MetodoPagamento=Metodo_Pagamento , DataCompra=Data_Compra , ValorTotal=Valor_Total , ClienteID=Cliente_ID , FuncionarioID=Funcionario_ID 
	WHERE idCompra = id_Compra; 
    END $$
DELIMITER ;      
    
    
 --  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- 	QUERIES SOBRE COMPRA/DONUTS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
   
    
-- Esta PROCEDURE insere um tipo de donut e a sua quantidade a uma certa compra. ---------------------------------------------------------------------------------------------------------------------------- 
-- DROP PROCEDURE inserirDonutCompra;
DELIMITER $$
    CREATE PROCEDURE inserirDonutCompra(id_Donut INT,id_Compra INT, prec DECIMAL(8,2),quant INT)
    BEGIN
	INSERT INTO CompraDonut
		(idDonut,idCompra,Preco,Quantidade)
    VALUES
		(id_Donut ,id_Compra , prec ,quant );      
    END $$
DELIMITER ;  
   
   
-- Esta PROCEDURE elemina um tipo de donut e a sua quantidade a uma certa compra. ----------------------------------------------------------------------------------------------------------------------------    
-- DROP PROCEDURE eliminarDonutCompra;
DELIMITER $$
    CREATE PROCEDURE eliminarDonutCompra(id_Donut INT,id_Compra INT)
    BEGIN
	DELETE FROM CompraDonut
    WHERE idDonut=id_Donut AND idCompra=id_Compra;
    END $$
DELIMITER ;     
   
-- Esta PROCEDURE modifica informações de um donut e a sua quantidade em uma certa compra. ----------------------------------------------------------------------------------------------------------------------------    
-- DROP PROCEDURE modificaDonutCompra;
DELIMITER $$
    CREATE PROCEDURE modificaDonutCompra(id_Donut INT,id_Compra INT, prec DECIMAL(8,2),quant INT)
    BEGIN
	UPDATE CompraDonut
    SET idDonut=id_Donut, idCompra=id_Compra, Preco=prec, Quantidade=quant
	WHERE idDonut=id_Donut AND idCompra=id_Compra; 
    END $$
DELIMITER ;  

    
    
    
    
    
    
    
    
    
--  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- 	QUERIES SOBRE FUNCIONARIOS/DONUTS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


-- Vista que determina os donuts que cada funcionário pode confecionar
CREATE VIEW FuncionarioFazDonuts AS
   SELECT *
   FROM FuncionarioDonut
   ORDER BY idDonut ASC;
    
    
-- Esta PROCEDURE associa um donut a um pasteleiro. ---------------------------------------------------------------------------------------------------------------------------- 
-- DROP PROCEDURE inserirFuncionarioDonut;
DELIMITER $$
    CREATE PROCEDURE inserirFuncionarioDonut(id INT, idDon INT)
    BEGIN
		IF 'Pasteleiro'=(SELECT Funcao
			FROM Funcionario
            WHERE idFuncionario = id) AND idDon>0 AND idDon<=(SELECT MAX(idDonut) FROM Donut) THEN
		INSERT INTO FuncionarioDonut
			(idFuncionario, idDonut)
		VALUES
			(id, idDon);
		END IF;
    END $$
DELIMITER ;  
   
   
-- Esta PROCEDURE desassocia um donut a um pasteleiro. ----------------------------------------------------------------------------------------------------------------------------    
-- DROP PROCEDURE eliminarFuncionarioDonut;
DELIMITER $$
    CREATE PROCEDURE eliminarFuncionarioDonut(id INT, idDon INT)
    BEGIN
	DELETE FROM FuncionarioDonut
    WHERE id=idFuncionario AND idDon=idDonut;
    END $$
DELIMITER ;  
    
    
    
    
    
    
    
    
    
    
--  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- 	QUERIES SOBRE FUNCIONARIOS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

-- Esta view devolve uma lista com a informacao de todos os funcionarios. ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DROP VIEW TodosFuncionarios;

CREATE VIEW TodosFuncionarios AS
   SELECT *
   FROM Funcionario
   ORDER BY idFuncionario ASC;
   
   
-- Esta view devolve uma lista com a quantidade de vendas por funcionario ordenadas de forma decrescente ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DROP VIEW FuncionariosMaisVenderam;

CREATE VIEW FuncionariosMaisVenderam AS
   SELECT f.idFuncionario, CONCAT(f.PrimeiroNome,' ',f.Apelido) AS Nome, SUM(cd.Quantidade) AS TotalDonutsSold
   FROM Funcionario AS f INNER JOIN Compra AS c
                               ON f.idFuncionario = c.FuncionarioID
                               INNER JOIN CompraDonut AS cd
									 ON  cd.idCompra=c.idCompra
   GROUP BY f.idFuncionario, f.PrimeiroNome, f.Apelido
   ORDER BY TotalDonutsSold DESC;


-- Esta PROCEDURE devolve informacoes sobre um certo funcionario. ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER $$
    CREATE PROCEDURE infoFuncionario(id_Funcionario INT)
    BEGIN
    SELECT *
    FROM Funcionario AS F
    WHERE F.idFuncionario = id_Funcionario;
    END $$
DELIMITER;

-- Esta PROCEDURE devolve o salario de um certo funcionario. ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER $$
    CREATE PROCEDURE infoFuncionarioSalario(id_Funcionario INT)
    BEGIN
    SELECT F.idFuncionario AS NR ,
           CONCAT(F.PrimeiroNome,' ',F.Apelido) AS Nome,
           F.Salario AS Salario 
    FROM Funcionario AS F
    WHERE F.idFuncionario = id_Funcionario;
    END $$
DELIMITER;


-- Esta PROCEDURE devolve todas as vendas efetuadas por um certo funcionario.  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELIMITER $$
    CREATE PROCEDURE infoFuncionarioVendas(id_Funcionario INT)
    BEGIN
    SELECT C.*
    FROM Funcionario AS F INNER JOIN Compra AS C
                                ON F.idFuncionario = C.funcionarioID
    WHERE C.funcionarioID = id_Funcionario;
    END $$
DELIMITER;


-- Esta PROCEDURE insere um funcionario novo na base de dados. ---------------------------------------------------------------------------------------------------------------------------- 
-- DROP PROCEDURE inserirFuncionario;
DELIMITER $$
    CREATE PROCEDURE inserirFuncionario(idFuncionario INT, PrimeiroNome VARCHAR(75), Apelido VARCHAR(75), Email VARCHAR(150), Telemovel INT, Funcao VARCHAR(75), Salario DECIMAL(8,2))
    BEGIN
	INSERT INTO Funcionario
		(idFuncionario, PrimeiroNome, Apelido, Email, Telemovel, Funcao, Salario)
    VALUES
		(idFuncionario, PrimeiroNome, Apelido, Email, Telemovel, Funcao, Salario);      
    END $$
DELIMITER ;  
   
   
-- Esta PROCEDURE remove um funcionario do sistema, usando o seu ID. ----------------------------------------------------------------------------------------------------------------------------    
-- DROP PROCEDURE eliminarFuncionario;
DELIMITER $$
    CREATE PROCEDURE eliminarFuncionario(id INT)
    BEGIN
	UPDATE Funcionario
    SET PrimeiroNome = "NULL", Apelido = "NULL", Email = "NULL", Telemovel = 0, Funcao = "NULL", Salario = 0
	WHERE id=idFuncionario;
    END $$
DELIMITER ;  
   
   
   
-- Esta PROCEDURE modifica informações de um certo funcionario,usando o seu ID. ----------------------------------------------------------------------------------------------------------------------------    
-- DROP PROCEDURE modificarFuncionario;
DELIMITER $$
    CREATE PROCEDURE modificarFuncionario(id INT, PrimeiroNome VARCHAR(75), Apelido VARCHAR(75), Email VARCHAR(150), Telemovel INT, Funcao VARCHAR(75), Salario DECIMAL(8,2))
    BEGIN
	UPDATE Funcionario
    SET PrimeiroNome = PrimeiroNome, Apelido = Apelido, Email = Email, Telemovel = Telemovel,  Funcao = Funcao, Salario = Salario
	WHERE id=idFuncionario; 
    END $$
DELIMITER ;  










--  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- 	QUERIES SOBRE DONUTS \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
--  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

-- Esta view devolve uma lista de informacoes de todos os donuts por ondem decrescente de id ------------------------------------------------------------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DROP VIEW TodosDonuts;

CREATE VIEW TodosDonuts AS
   SELECT *
   FROM Donut
   ORDER BY idDonut ASC;


-- Esta view devolve uma lista com informacoes sobre os Donuts por ordem descrescente de numeoro de calorias ------------------------------------------------------------------------------------------------ ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DROP VIEW TopDonutMaisCalorias;

CREATE VIEW TopDonutMaisCalorias AS
   SELECT *
   FROM Donut
   ORDER BY Calorias DESC;


-- Esta view devolve uma lista com informacoes sobre os Donuts por ordem descrescente de preco ------------------------------------------------------------------------------------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DROP VIEW TopDonutMaisCaros;

CREATE VIEW TopDonutMaisCaros AS
   SELECT *
   FROM Donut
   ORDER BY Preco DESC;


-- Esta view devolve uma lista com a quantidade vendida de cada donut ---------------------------------------------------------------------------- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- DROP VIEW VendasPorDonut;

CREATE VIEW VendasPorDonut AS
   SELECT d.Nome, SUM(cd.Quantidade) AS TotalQuantitySold
   FROM Donut d LEFT JOIN CompraDonut cd 
					 ON d.idDonut = cd.idDonut
   GROUP BY d.Nome
   ORDER BY SUM(cd.Quantidade) DESC;


-- Esta PROCEDURE devolve a informacao de um certo Donut  ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ 
DELIMITER $$
    CREATE PROCEDURE infoDonut(id_Donut INT)
    BEGIN
    SELECT *
    FROM Donut AS D
    WHERE D.idDonut = id_Donut;
    END $$
DELIMITER ;


-- Esta PROCEDURE insere um donut novo na base de dados. ---------------------------------------------------------------------------------------------------------------------------- 
-- DROP PROCEDURE inserirDonut;
DELIMITER $$
    CREATE PROCEDURE inserirDonut(idDonut INT, Nome VARCHAR(75), Preco DECIMAL(8,2), Calorias INT, Tipo VARCHAR(75), Descricao TEXT)
    BEGIN
	INSERT INTO Donut
		(idDonut, Nome, Preco, Calorias, Tipo , Descricao)
    VALUES
		(idDonut, Nome, Preco, Calorias, Tipo , Descricao);      
    END $$
DELIMITER ;  
   
   
-- Esta PROCEDURE remove um donut do sistema, usando o seu ID. ----------------------------------------------------------------------------------------------------------------------------    
-- DROP PROCEDURE eliminarDonut;
DELIMITER $$
    CREATE PROCEDURE eliminarDonut(id INT)
    BEGIN
	UPDATE Donut
    SET Nome = "NULL", Preco = 0, Calorias = 0, Tipo = "NULL", Descricao = "NULL"
	WHERE id=idDonut;
    END $$
DELIMITER ;  
   
   
-- Esta PROCEDURE modifica informações de um certo donut,usando o seu ID. ----------------------------------------------------------------------------------------------------------------------------    
-- DROP PROCEDURE modificarDonut;
DELIMITER $$
    CREATE PROCEDURE modificarDonut(id INT, Nome VARCHAR(75), Preco DECIMAL(8,2), Calorias INT, Tipo VARCHAR(75), Descricao TEXT)
    BEGIN
	UPDATE Donut
    SET Nome = Nome, Preco = Preco, Calorias = Calorias, Tipo = Tipo,  Descricao = Descricao
	WHERE id=idDonut; 
    END $$
DELIMITER ;
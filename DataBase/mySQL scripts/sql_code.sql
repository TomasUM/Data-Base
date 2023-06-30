
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


-- -----------------------------------------------------
-- Schema JoseAmargoSweets
-- -----------------------------------------------------
-- DROP SCHEMA IF EXISTS JoseAmargoSweets ;
CREATE SCHEMA IF NOT EXISTS JoseAmargoSweets;
USE JoseAmargoSweets ;

-- -----------------------------------------------------
-- Table Clientes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Cliente (
  idCliente INT NOT NULL,
  PrimeiroNome VARCHAR(75) NOT NULL,
  Apelido VARCHAR(75) NOT NULL,
  Email VARCHAR(150) NOT NULL,
  Telemovel INT NOT NULL,
  PRIMARY KEY (idCliente)
);

CREATE INDEX PNome ON Cliente(PrimeiroNome); 

-- DROP TABLE Cliente;
-- -----------------------------------------------------
-- Table Funcionarios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Funcionario (
  idFuncionario INT NOT NULL,
  PrimeiroNome VARCHAR(75) NOT NULL,
  Apelido VARCHAR(75) NOT NULL,
  Email VARCHAR(150) NOT NULL,
  Telemovel INT NOT NULL,
  Funcao VARCHAR(75) NOT NULL,
  Salario DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (idFuncionario)
);
  
-- DROP TABLE Funcionarios;  
-- -----------------------------------------------------
-- Table Compra
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Compra (
  idCompra INT NOT NULL,
  MetodoPagamento VARCHAR(75) NOT NULL,
  DataCompra DATE NOT NULL,
  ValorTotal DECIMAL(8,2) NOT NULL,
  ClienteID INT NOT NULL,
  FuncionarioID INT NOT NULL,
  PRIMARY KEY (idCompra),
  CONSTRAINT Cliente
    FOREIGN KEY (ClienteID)
    REFERENCES Cliente (idCliente),
  CONSTRAINT FuncionarioCompra
    FOREIGN KEY (FuncionarioID)
    REFERENCES Funcionario (idFuncionario)
);

-- DROP TABLE Compra;  
-- -----------------------------------------------------
-- Table Donuts
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Donut (
  idDonut INT NOT NULL,
  Nome VARCHAR(75) NOT NULL,
  Tipo VARCHAR(75) NOT NULL,
  Descricao TEXT NULL,
  Calorias INT NOT NULL,
  Preco DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (idDonut)
);

-- DROP TABLE Donuts;  
-- -----------------------------------------------------
-- Table `mydb`.`CompraDonuts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS CompraDonut (
  idDonut INT NOT NULL,
  idCompra INT NOT NULL,
  Preco DECIMAL(8,2) NOT NULL,
  Quantidade INT NOT NULL,
  PRIMARY KEY (idDonut, idCompra),
  CONSTRAINT Donut
    FOREIGN KEY (idDonut)
    REFERENCES Donut (idDonut),
  CONSTRAINT Compra
    FOREIGN KEY (idCompra)
    REFERENCES Compra (idCompra)
);

-- DROP TABLE CompraDonuts;  
-- -----------------------------------------------------
-- Table FuncionariosDonuts
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS FuncionarioDonut (
  idFuncionario INT NOT NULL,
  idDonut INT NOT NULL,
  PRIMARY KEY (idFuncionario, idDonut),
  CONSTRAINT Funcionario
    FOREIGN KEY (idFuncionario)
    REFERENCES Funcionario (idFuncionario),
  CONSTRAINT DonutFuncionario
    FOREIGN KEY (idDonut)
    REFERENCES Donut (idDonut)
);

-- DROP TABLE FuncionariosDonuts;  

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

Use joseamargosweets;
flush privileges;

-- DROP USER 'JoseAmargo'@'localhost';
-- DROP USER 'MariaMel'@'localhost';
-- DROP USER 'FranciscoAmargo'@'localhost';
-- DROP USER 'JuliaRichards'@'localhost' ;
-- DROP ROLE Manager;
-- DROP ROLE OperadoresCaixa;

-- DROP USER 'JoseAmargo'@'localhost';
CREATE USER 'JoseAmargo'@'localhost' IDENTIFIED BY 'joseamargoboss';
GRANT ALL PRIVILEGES ON joseamargosweets.* TO 'JoseAmargo'@'localhost';

-- SELECT * FROM joseamargosweets.user;

-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

-- DROP USER 'MariaMel'@'localhost';
CREATE USER 'MariaMel'@'localhost' 
       IDENTIFIED BY 'mariamel123';

-- REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'MariaMel'@'localhost';       
-- SHOW GRANTS FOR 'MariaMel'@'localhost';

-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

-- DROP USER 'FranciscoAmargo'@'localhost';
CREATE USER 'FranciscoAmargo'@'localhost' 
       IDENTIFIED BY 'amargogamer123';

-- REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'FranciscoAmargo'@'localhost';       
-- SHOW GRANTS FOR 'FranciscoAmargo'@'localhost';
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

-- DROP USER 'JuliaRichards'@'localhost' ;
CREATE USER 'JuliaRichards'@'localhost' 
       IDENTIFIED BY 'juliaricardo123';

-- REVOKE ALL PRIVILEGES, GRANT OPTION FROM 'JuliaRichards'@'localhost';       
-- SHOW GRANTS FOR 'JuliaRichards'@'localhost';

-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

-- DROP ROLE Manager;
CREATE ROLE Manager;
GRANT Manager TO 'MariaMel'@'localhost';
-- SHOW GRANTS FOR Manager;
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

-- DROP ROLE OperadoresCaixa;
CREATE ROLE OperadoresCaixa;
GRANT OperadoresCaixa TO 'FranciscoAmargo'@'localhost';
GRANT OperadoresCaixa TO 'JuliaRichards'@'localhost';
-- SHOW GRANTS FOR OperadoresCaixa;
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-- ADICIONAR PERMICOES AO UTILIZADORES \\\\\\\\\\\\\\\\\\
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

GRANT ALL ON joseamargosweets.* TO Manager;
GRANT SELECT ON joseamargosweets.* TO Manager;

GRANT EXECUTE ON PROCEDURE infoCliente TO OperadoresCaixa;
GRANT EXECUTE ON PROCEDURE infoClienteCompra TO OperadoresCaixa;
GRANT EXECUTE ON PROCEDURE inserirCliente TO OperadoresCaixa;
GRANT EXECUTE ON PROCEDURE eliminarCliente TO OperadoresCaixa;
GRANT EXECUTE ON PROCEDURE modificarCliente TO OperadoresCaixa;
GRANT EXECUTE ON PROCEDURE inserirCompra TO OperadoresCaixa;
GRANT EXECUTE ON PROCEDURE eliminarCompra TO OperadoresCaixa;
GRANT EXECUTE ON PROCEDURE modificaCompra TO OperadoresCaixa;
GRANT EXECUTE ON PROCEDURE inserirDonutCompra TO OperadoresCaixa;
GRANT EXECUTE ON PROCEDURE eliminarDonutCompra TO OperadoresCaixa;
GRANT EXECUTE ON PROCEDURE modificaDonutCompra TO OperadoresCaixa;

GRANT SELECT ON joseamargosweets.TodosClientes TO OperadoresCaixa;
GRANT SELECT ON joseamargosweets.TodasVendas TO OperadoresCaixa;
import pandas as pd
import mysql.connector
from mysql.connector import Error


try: 
    # Importar CSVs
    dataCliente = pd.read_csv (r'C:\Users\tumab\OneDrive\Ambiente de Trabalho\CSV\Cliente.csv')   
    dfCliente = pd.DataFrame(dataCliente)
    
    dataFuncionario = pd.read_csv (r'C:\Users\tumab\OneDrive\Ambiente de Trabalho\CSV\Funcionario.csv')   
    dfFuncionario = pd.DataFrame(dataFuncionario)
    
    dataCompra = pd.read_csv (r'C:\Users\tumab\OneDrive\Ambiente de Trabalho\CSV\Compra.csv')   
    dfCompra = pd.DataFrame(dataCompra)
    
    dataDonut = pd.read_csv (r'C:\Users\tumab\OneDrive\Ambiente de Trabalho\CSV\Donut.csv')   
    dfDonut = pd.DataFrame(dataDonut)
    
    dataCompraDonut = pd.read_csv (r'C:\Users\tumab\OneDrive\Ambiente de Trabalho\CSV\CompraDonut.csv')   
    dfCompraDonut = pd.DataFrame(dataCompraDonut)
    
    dataFuncionarioDonut = pd.read_csv (r'C:\Users\tumab\OneDrive\Ambiente de Trabalho\CSV\FuncionarioDonut.csv')   
    dfFuncionarioDonut = pd.DataFrame(dataFuncionarioDonut)
    

    # Conectar ao SQL
    connection = mysql.connector.connect(host='localhost',
                                            database='joseamargosweets',
                                            user='root',
                                            password='Tomas.2003')




    # Inserir na Tabela Cliente
    mySql_insert_cliente = """INSERT INTO joseamargosweets.cliente (idCliente, PrimeiroNome, Apelido, Email, Telemovel)
                    VALUES (%s,%s,%s,%s,%s)"""

    records_to_insert_cliente = list(dfCliente.itertuples(index=False))

    cursor = connection.cursor()
    cursor.executemany(mySql_insert_cliente, records_to_insert_cliente)

    
    
    
    
    
    # Inserir na Tabela Funcionario
    mySql_insert_funcionario = """INSERT INTO joseamargosweets.funcionario (idFuncionario, PrimeiroNome, Apelido, Email, Telemovel, Funcao, Salario)
                    VALUES (%s,%s,%s,%s,%s,%s,%s)"""

    records_to_insert_funcionario = list(dfFuncionario.itertuples(index=False))
    cursor = connection.cursor()
    cursor.executemany(mySql_insert_funcionario, records_to_insert_funcionario)
    
    
    
    
    
    
    # Inserir na Tabela Compra
    mySql_insert_compra = """INSERT INTO joseamargosweets.compra (idCompra, MetodoPagamento, DataCompra, ValorTotal, ClienteID, FuncionarioID)
                    VALUES (%s,%s,%s,%s,%s,%s)"""

    records_to_insert_compra = list(dfCompra.itertuples(index=False))
    cursor = connection.cursor()
    cursor.executemany(mySql_insert_compra, records_to_insert_compra)


    
    

    
    
    # Inserir na Tabela Donut
    mySql_insert_donut = """INSERT INTO joseamargosweets.donut (idDonut, Nome, Preco, Calorias, Tipo, Descricao)
                    VALUES (%s,%s,%s,%s,%s,%s)"""

    records_to_insert_donut = list(dfDonut.itertuples(index=False))
    cursor = connection.cursor()
    cursor.executemany(mySql_insert_donut, records_to_insert_donut)






    # Inserir na Tabela CompraDonut
    mySql_insert_compraDonut = """INSERT INTO joseamargosweets.compradonut (idCompra, idDonut, Quantidade, Preco)
                    VALUES (%s,%s,%s,%s)"""

    records_to_insert_compraDonut = list(dfCompraDonut.itertuples(index=False))
    cursor = connection.cursor()
    cursor.executemany(mySql_insert_compraDonut, records_to_insert_compraDonut)
    
    
    
    
    
    
    # Inserir na Tabela FuncionarioDonut
    mySql_insert_funcionarioDonut = """INSERT INTO joseamargosweets.funcionariodonut (idFuncionario, idDonut)
                    VALUES (%s,%s)"""

    records_to_insert_funcionarioDonut = list(dfFuncionarioDonut.itertuples(index=False))
    cursor = connection.cursor()
    cursor.executemany(mySql_insert_funcionarioDonut, records_to_insert_funcionarioDonut)
    
    
    # Commit
    connection.commit()


except mysql.connector.Error as error:
    print("Falha na migração dos dados {}".format(error))                


finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("Conexão com MySQL fechada")
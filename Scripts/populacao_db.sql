USE prova_sql;

INSERT INTO empresa
		(id_empresa, razao_social, inativo)
VALUES
		(1, "WDtecnica", "N"),
        (2, "VersoTech", "N"),
        (3, "Planiduto" , "S"),
        (4, "Cartao de Todos", "S");

        
INSERT INTO vendedores
		(id_vendedor, nome, cargo, salario, data_admissao, inativo)
VALUES
		(1, "Guilherme", "vendedor", 1500, "2024-07-02", "N"),
        (2, "Gabriela", "vendedor", 1600, "2023-04-15", "N"),
        (3, "João", "vendedor", 1500, "2022-01-05", "S"),
        (4, "Paulo", "vendedor", 1600, "2015-07-17", "S");


INSERT INTO produtos
		(id_produto, descricao, inativo)
VALUES
		(1, "Ventilador Consul, 110w", "N"),
        (2, "Batedeira Philips, 220w", "N"),
        (3, "Chuveiro Elétrico Consul, 220w", "S"),
        (4, "Monitor LG, 110w", "S");
   
   
INSERT INTO clientes
		(id_cliente, razao_social, data_cadastro, id_vendedor, id_empresa, inativo)
VALUES
		(1, "ASRock", "2020-01-10", 1, 1, "N"),
        (2, "COPAG", "2015-10-22", 2, 2, "N"),
        (3, "Xiaomi", "2022-11-15", 3, 3, "S"),
        (4, "PrintMax", "2021-05-07", 4, 4, "S");
        

INSERT INTO pedido
		(id_pedido, valor_total, data_emissao, situacao, id_empresa, id_cliente)
VALUES
		(1, 500, "2024-07-02", "aprovado", 1, 1),
        (2, 1000, "2023-06-07", "aprovado", 2, 2),
        (3, 750, "2022-02-20", "recusado", 3, 3),
        (4, 300, "2018-05-25", "recusado", 4, 4);
        
        
INSERT INTO itens_pedido
		(id_item_pedido, preco_praticado, quantidade, id_pedido, id_produto)
VALUES
		(1, 1000, 2, 1, 1),
        (2, 3000, 3, 2, 2),
        (3, 2250, 3, 3, 3),
        (4, 300, 1, 4, 4);
        

INSERT INTO config_preco_produto
		(id_config_preco_produto, preco_minimo, preco_maximo, id_vendedor, id_empresa, id_produto)
VALUES
		(1, 100, 500, 1, 1, 1),
        (2, 350, 800, 2, 2, 2),
        (3, 200, 600, 3, 3, 3),
        (4, 50, 300, 4, 4, 4);
        

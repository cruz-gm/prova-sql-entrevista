USE prova_sql;

/*Lista de funcionários ordenando pelo salário decrescente*/
SELECT id_vendedor, nome, cargo, salario, data_admissao
FROM vendedores
ORDER BY salario DESC;


/*Lista de pedidos de vendas ordenado por data de emissão*/
SELECT id_pedido, valor_total, data_emissao, situacao
FROM pedido
ORDER BY data_emissao;


/*Valor de faturamento por cliente*/
SELECT c.id_cliente, c.razao_social AS cliente, SUM(p.valor_total) AS faturamento_total
FROM clientes c
JOIN pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.razao_social;


/*Valor de faturamento por empresa*/
SELECT e.id_empresa, e.razao_social AS empresa, SUM(p.valor_total) AS faturamento_total
FROM empresa e
JOIN pedido p ON e.id_empresa = p.id_empresa
GROUP BY e.id_empresa, e.razao_social;


/*Valor de faturamento por vendedor*/
SELECT v.id_vendedor, v.nome AS vendedor, SUM(p.valor_total) AS faturamento_total
FROM vendedores v
JOIN clientes c ON v.id_vendedor = c.id_vendedor
JOIN pedido p ON c.id_cliente = p.id_cliente
GROUP BY v.id_vendedor, v.nome;


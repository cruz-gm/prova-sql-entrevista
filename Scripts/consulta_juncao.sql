USE prova_sql;

/*Escreva consultas SQL para obter as seguintes informações usando junções:
Unindo a listagem de produtos com a listagem de clientes, procure o último preço praticado nesse cliente com esse produto, formule o preço base do produto dentro da coluna chamada preco_base no seu select, conforme a seguinte regra:
O preço base do produto deve obedecer a configuração de preço da tabela CONFIG_PRECO_PRODUTO.
Caso as junções não retornem o último preço praticado, utilize o menor da configuração de preço do produto.*/
CREATE VIEW preco_produto_praticado AS
SELECT
    p.id_produto AS id_produto,
    p.descricao AS descricao_produto,
    c.id_cliente AS id_cliente,
    cl.razao_social AS razao_social_cliente,
    pe.id_empresa AS id_empresa,
    e.razao_social AS razao_social_empresa,
    v.id_vendedor AS id_vendedor,
    v.nome AS nome_vendedor,
    cpp.preco_minimo AS preco_minimo_config,
    cpp.preco_maximo AS preco_maximo_config,
    COALESCE(
        (SELECT MAX(ip.preco_praticado)
         FROM itens_pedido ip
         JOIN pedido pe2 ON ip.id_pedido = pe2.id_pedido
         WHERE ip.id_produto = p.id_produto AND pe2.id_cliente = c.id_cliente AND pe2.id_empresa = pe.id_empresa
        ),
        cpp.preco_minimo
    ) AS preco_base
FROM produtos p
CROSS JOIN clientes c
JOIN pedido pe ON c.id_cliente = pe.id_cliente
JOIN empresa e ON pe.id_empresa = e.id_empresa
JOIN vendedores v ON pe.id_pedido = v.id_vendedor
LEFT JOIN clientes cl ON pe.id_cliente = cl.id_cliente
LEFT JOIN config_preco_produto cpp ON p.id_produto = cpp.id_produto AND pe.id_empresa = cpp.id_empresa
WHERE EXISTS (
    SELECT 1
    FROM itens_pedido ip
    WHERE ip.id_produto = p.id_produto
)
ORDER BY p.id_produto, c.id_cliente;

/*Indices para junções*/
CREATE INDEX idx_produtos_id_produto ON produtos (id_produto);
CREATE INDEX idx_clientes_id_cliente ON clientes (id_cliente);
CREATE INDEX idx_pedido_id_cliente ON pedido (id_cliente);
CREATE INDEX idx_pedido_id_empresa ON pedido (id_empresa);
CREATE INDEX idx_empresa_id_empresa ON empresa (id_empresa);
CREATE INDEX idx_vendedores_id_vendedor ON vendedores (id_vendedor);
CREATE INDEX idx_config_preco_produto_id_produto_id_empresa ON config_preco_produto (id_produto, id_empresa);

/*indices para o comando COALESCE*/
CREATE INDEX idx_itens_pedido_id_produto_id_pedido ON itens_pedido (id_produto, id_pedido);
CREATE INDEX idx_pedido_id_pedido_id_cliente_id_empresa ON pedido (id_pedido, id_cliente, id_empresa);

/*indice para o comando WHERE EXISTS*/
CREATE INDEX idx_itens_pedido_id_produto ON itens_pedido (id_produto);

/*indice para o comando ORDER BY*/
CREATE INDEX idx_produtos_id_produto ON produtos (id_produto);
CREATE INDEX idx_clientes_id_cliente ON clientes (id_cliente);


/*Chamada do SELECT através da view*/
SELECT * FROM preco_produto_praticado;
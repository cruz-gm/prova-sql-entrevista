
# Prova SQL

Tarefa proposta para realização de consultas básicas e com junções através das informações contidas neste [enunciado](https://github.com/cruz-gm/prova-sql-entrevista/tree/main/Enunciado).


Diagrama EER com base nos dados propostos:

[Diagrama](https://github.com/cruz-gm/prova-sql-entrevista/tree/main/DiagramaEER)


____________________________________________________


Scripts de criação do banco de dados, população e das respectivas consultas:

[Scripts](https://github.com/cruz-gm/prova-sql-entrevista/tree/main/Scripts)


____________________________________________________

Dicionário de dados:

Empresa
| Atributo | Tipo de Dados | Descrição| Observações |
|-----------|---------------|----------|-------------|
| id_empresa | INT | Identificador único da empresa | Chave Primária |
| razao_social | VARCHAR(100) | Razão social da empresa | |
| inativo | CHAR(1) | Indica se a empresa está inativa | |

Vendedores
| Atributo | Tipo de Dados | Descrição | Observações |
|-----------|---------------|----------|--------------|
| id_vendedor | INT | Identificador único do vendedor | Chave Primária |
| nome | VARCHAR(45) | Nome do vendedor | |
| cargo | VARCHAR(45) | Cargo do vendedor | |
| salario | INT | Salário do vendedor | |
| data_admissao | DATE | Data de admissão do vendedor | |
| inativo | CHAR(1) | Indica se o vendedor está inativo | |

Produtos
| Atributo | Tipo de Dados | Descrição | Observações |
|-----------|--------------|------------|------------|
| id_produto | INT | Identificador único do produto | Chave Primária |
| descricao | TEXT(200) | Descrição do produto | |
| inativo | CHAR(1) | Indica se o produto está inativo | |

Clientes
| Atributo | Tipo de Dados | Descrição | Observações|
|-------------|--------------|----------|------------|
| id_cliente | INT | Identificador único do cliente | Chave Primária |
| razao_social | VARCHAR(100) | Razão social do cliente | |
| data_cadastro | DATE | Data de cadastro do cliente | |
| inativo | CHAR(1) | Indica se o cliente está inativo | |
| id_vendedor | INT | Identificador do vendedor associado | Chave Estrangeira |
| id_empresa | INT | Identificador da empresa associada | Chave Estrangeira |

Pedido
| Atributo | Tipo de Dados | Descrição | Observações |
|-----------| ------------ | -----------| -----------|
| id_pedido | INT | Identificador único do pedido | Chave Primária |
| valor_total | INT | Valor total do pedido | |
| data_emissao | DATE | Data de emissão do pedido | |
| situacao | VARCHAR(100) | Situação do pedido | |
| id_empresa | INT | Identificador da empresa associada | Chave Estrangeira |
| id_cliente | INT | Identificador do cliente associado | Chave Estrangeira |

Itens_Pedido
| Atributo | Tipo de Dados | Descrição | Observações |
|------------|-------------|------------|-------------|
| id_item_pedido | INT | Identificador único do item de pedido | Chave Primária | 
| preco_praticado | INT | Preço praticado do produto | |
| quantidade | INT | Quantidade do produto | |
| id_pedido | INT | Identificador do pedido associado | Chave Estrangeira |
| id_produto | INT | Identificador do produto associado | Chave Estrangeira |

Config_Preco_Produto
| Atributo | Tipo de Dados | Descrição | Observações |
|------------|-------------|------------|-------------|
| id_config_preco_produto | INT | Identificador único da configuração de preço do produto | Chave Primária |
| preco_minimo | INT | Preço mínimo configurado para o produto | |
| preco_maximo | INT | Preço máximo configurado para o produto | |
| id_vendedor | INT | Identificador do vendedor associado | Chave Estrangeira |
| id_empresa | INT | Identificador da empresa associada | Chave Estrangeira |
| id_produto | INT | Identificador do produto associado | Chave Estrangeira |


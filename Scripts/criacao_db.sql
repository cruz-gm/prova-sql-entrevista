CREATE DATABASE prova_sql;

USE prova_sql;

CREATE TABLE empresa
(
	id_empresa INT NOT NULL AUTO_INCREMENT,
    razao_social VARCHAR(100) NOT NULL,
    inativo CHAR(1) NOT NULL,
    PRIMARY KEY(id_empresa)
);

CREATE TABLE vendedores
(
	id_vendedor INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    cargo VARCHAR(45) NOT NULL,
    salario INT NOT NULL,
    data_admissao DATE NOT NULL,
    inativo CHAR(1) NOT NULL,
    PRIMARY KEY(id_vendedor)
);

CREATE TABLE produtos
(
	id_produto INT NOT NULL AUTO_INCREMENT,
    descricao TEXT(200) NOT NULL,
    inativo CHAR(1) NOT NULL,
    PRIMARY KEY(id_produto)
);

CREATE TABLE clientes
(
	id_cliente INT NOT NULL AUTO_INCREMENT,
    razao_social VARCHAR(100) NOT NULL,
    data_cadastro DATE NOT NULL,
    inativo CHAR(1) NOT NULL,
    id_vendedor INT NOT NULL,
    id_empresa INT NOT NULL,
    CONSTRAINT fk_clientes_vendedor FOREIGN KEY(id_vendedor) REFERENCES vendedores(id_vendedor),
    CONSTRAINT fk_clientes_empresa FOREIGN KEY(id_empresa) REFERENCES empresa(id_empresa),
    PRIMARY KEY(id_cliente)
);

CREATE TABLE pedido
(
	id_pedido INT NOT NULL AUTO_INCREMENT,
    valor_total INT NOT NULL,
    data_emissao DATE NOT NULL,
    situacao VARCHAR(100) NOT NULL,
    id_empresa INT NOT NULL,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_pedido_empresa FOREIGN KEY(id_empresa) REFERENCES empresa(id_empresa),
    CONSTRAINT fk_pedido_cliente FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente),
    PRIMARY KEY(id_pedido)
);

CREATE TABLE itens_pedido
(
	id_item_pedido INT NOT NULL AUTO_INCREMENT,
    preco_praticado INT NOT NULL,
    quantidade INT NOT NULL,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    CONSTRAINT fk_item_pedido_pedido FOREIGN KEY(id_pedido) REFERENCES pedido(id_pedido),
    CONSTRAINT fk_item_pedido_produto FOREIGN KEY(id_produto) REFERENCES produtos(id_produto),
    PRIMARY KEY(id_item_pedido)
);

CREATE TABLE config_preco_produto
(
	id_config_preco_produto INT NOT NULL AUTO_INCREMENT,
    preco_minimo INT NOT NULL,
    preco_maximo INT NOT NULL,
    id_vendedor INT NOT NULL,
    id_empresa INT NOT NULL,
    id_produto INT NOT NULL,
    CONSTRAINT fk_config_vendedor FOREIGN KEY(id_vendedor) REFERENCES vendedores(id_vendedor),
    CONSTRAINT fk_config_empresa FOREIGN KEY(id_empresa) REFERENCES empresa(id_empresa),
    CONSTRAINT fk_config_produto FOREIGN KEY(id_produto) REFERENCES produtos(id_produto),
    PRIMARY KEY(id_config_preco_produto)
);

SHOW TABLES FROM prova_sql;




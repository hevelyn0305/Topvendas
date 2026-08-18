-- Integrantes:
-- Jackson Neto Costa Rosal
-- Wallysson Soares Guimarães
-- Jordanna dos Reis Pires
-- Hevelyn Souza
-- Ana Clara Parrião


CREATE DATABASE IF NOT EXISTS topvendas;

USE topvendas;

-- Desativa a verificação de chaves estrangeiras temporariamente para garantir o reset
SET FOREIGN_KEY_CHECKS = 0;

-- Deleta as tabelas se elas já existirem
DROP TABLE IF EXISTS comentarios;
DROP TABLE IF EXISTS produto_venda;
DROP TABLE IF EXISTS vendas;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;

-- Reativa a verificação
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE clientes(
	idCliente INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Nome do cliente (não necessariamente o real)
    Apelido VARCHAR(20) NOT NULL,
    
    cpf VARCHAR(11) NOT NULL UNIQUE
);

CREATE TABLE produtos(
	idProduto INT AUTO_INCREMENT PRIMARY KEY,
    
    nomeProduto VARCHAR(45) NOT NULL,
    
    Descricao VARCHAR(2400),
    
    garantia DATE,	
    
    -- Quantidade de Produtos no Estoque
    qntd_estoque INT NOT NULL,
    
    lote DATE NOT NULL,
    
    cnpj_fornecedor VARCHAR(14) NOT NULL UNIQUE	
);

CREATE TABLE vendas(
	idVenda INT AUTO_INCREMENT PRIMARY KEY,
    
    idCliente INT,
    
    metodoPagamento VARCHAR(45) NOT NULL,
    
    -- Quantidade de Produtos na venda
    qntdProdutos INT NOT NULL,
    
    -- Valor da venda
    Valor DECIMAL(10, 2) NOT NULL,
    
    -- Em quantas parcelas?
    Parcelas INT NOT NULL,
    
    CONSTRAINT
		FOREIGN KEY(idCliente)
		REFERENCES clientes(idCliente)
        ON DELETE SET NULL
        -- Se um cliente for deletado, a FK é setada para nulo
);

CREATE TABLE produto_venda(
	idProduto INT NOT NULL,
    
    idVenda INT NOT NULL,
    
    PRIMARY KEY (idProduto, idVenda),
    
    FOREIGN KEY(idProduto)
		REFERENCES produtos(idProduto)
        ON DELETE CASCADE,
	
    FOREIGN KEY(idVenda)
		REFERENCES vendas(idVenda)
		ON DELETE CASCADE
);

CREATE TABLE comentarios(
	idComentario INT AUTO_INCREMENT PRIMARY KEY,
	
	idVenda INT NOT NULL,
    
    idCliente INT,
    
	-- de 1 á 5 estrelas
    nota TINYINT NOT NULL,
    
    data_postagem DATE NOT NULL,
    
    comentario VARCHAR(100) NOT NULL,
    
	FOREIGN KEY(idVenda)
        REFERENCES vendas(idVenda)
        ON DELETE CASCADE,

	FOREIGN KEY(idCliente)
        REFERENCES clientes(idCliente)
        ON DELETE SET NULL
);
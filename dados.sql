INSERT INTO clientes (nome, email, data_cadastro, cidade, estado) VALUES 
('Ana Beatriz Silva', 'ana.beatriz@email.com', '2024-01-15', 'São Paulo', 'SP'),
('Lucas Oliveira Santos', 'lucas.osantos@email.com', '2024-01-20', 'Rio de Janeiro', 'RJ'),
('Mariana Costa Ferreira', 'mari.ferreira@email.com', '2024-02-05', 'Belo Horizonte', 'MG'),
('Ricardo Pereira Lima', 'ricardo.lima@email.com', '2024-02-12', 'Curitiba', 'PR'),
('Camila Souza Rocha', 'camila.rocha@email.com', '2024-02-28', 'Salvador', 'BA'),
('Gabriel Almeida Neves', 'gabriel.neves@email.com', '2024-03-10', 'Porto Alegre', 'RS'),
('Juliana Mendes Vieira', 'ju.mendes@email.com', '2024-03-15', 'Fortaleza', 'CE'),
('Thiago Barbosa Martins', 'thiago.martins@email.com', '2024-03-22', 'Brasília', 'DF'),
('Fernanda Gomes Duarte', 'fer.duarte@email.com', '2024-04-02', 'Recife', 'PE'),
('Bruno Cardoso Lima', 'bruno.cardoso@email.com', '2024-04-10', 'Manaus', 'AM');

INSERT INTO clientes (nome, email, data_cadastro, cidade, estado) VALUES
('Carlos Eduardo Mendes', 'carlos.mendes@email.com', '2024-03-10', 'São Paulo', 'SP'),
('Fernanda Lima Souza', 'fernanda.souza@email.com', '2024-03-12', 'Rio de Janeiro', 'RJ'),
('Rafael Gomes', 'rafael.gomes@email.com', '2024-03-18', 'Belo Horizonte', 'MG'),
('Juliana Castro', 'juliana.castro@email.com', '2024-04-02', 'São Paulo', 'SP'),
('Thiago Martins', 'thiago.martins@email.com', '2024-04-05', 'Rio de Janeiro', 'RJ'),
('Beatriz Rocha', 'beatriz.rocha@email.com', '2024-04-10', 'Belo Horizonte', 'MG');

INSERT INTO clientes (nome, email, data_cadastro, cidade, estado) VALUES
('Marcelo Silva Costa', 'marcelo.costa@email.com', '2024-04-15', 'São Paulo', 'SP');


INSERT INTO produtos (nome_produto, tipo_produto, preco) VALUES 
-- Categoria: Eletrônicos
('Mouse Wireless Pro', 'Eletrônicos', 159.90),
('Teclado Mecânico RGB', 'Eletrônicos', 349.00),
('Monitor 24 Polegadas HD', 'Eletrônicos', 899.99),
('Fone de Ouvido Noise Cancelling', 'Eletrônicos', 520.50),
('Webcam Full HD 1080p', 'Eletrônicos', 210.00),
INSERT INTO produtos (nome_produto, tipo_produto, preco) VALUES 
('Carregador Portátil 10000mAh', 'Eletrônicos', 129.90);

-- Categoria: Escritório
('Cadeira Ergonômica', 'Escritório', 1250.00),
('Mesa de Canto em L', 'Escritório', 480.00),
('Organizador de Documentos', 'Escritório', 45.90),
('Luminária de Mesa LED', 'Escritório', 89.00),
('Suporte para Notebook', 'Escritório', 115.00),

-- Categoria: Casa & Decoração
('Cafeteira Elétrica 1.5L', 'Casa', 189.90),
('Aspirador de Pó Vertical', 'Casa', 299.00),
('Conjunto de Panelas Antiaderente', 'Casa', 420.00),
('Quadro Decorativo Abstrato', 'Casa', 75.00),
('Tapete Antiderrapante', 'Casa', 130.00);

INSERT INTO pedidos (id_cliente, data_pedido, status) VALUES 
(1, '2024-04-15', 'aprovado'),
(2, '2024-04-16', 'aprovado'),
(3, '2024-04-17', 'pendente'),
(4, '2024-04-18', 'aprovado'),
(5, '2024-04-19', 'cancelado'),
(6, '2024-04-20', 'aprovado'),
(7, '2024-04-21', 'pendente'),
(8, '2024-04-22', 'aprovado');
INSERT INTO pedidos (id_cliente, data_pedido, status) VALUES 
(1, '2024-06-11', 'aprovado');

select * from pedidos

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES 
(1, 1, 1, 159.90),  -- Pedido 1: Mouse
(1, 6, 1, 1250.00), -- Pedido 1: Cadeira
(2, 2, 1, 349.00),  -- Pedido 2: Teclado
(2, 11, 1, 189.90), -- Pedido 2: Cafeteira
(3, 3, 2, 899.99),  -- Pedido 3: Monitor (x2)
(4, 7, 1, 480.00),  -- Pedido 4: Mesa
(4, 10, 1, 115.00), -- Pedido 4: Suporte Note
(5, 4, 1, 520.50),  -- Pedido 5: Fone
(6, 12, 1, 299.00), -- Pedido 6: Aspirador
(6, 15, 2, 130.00), -- Pedido 6: Tapete (x2)
(7, 8, 3, 45.90),   -- Pedido 7: Organizador (x3)
(7, 9, 1, 89.00),   -- Pedido 7: Luminária
(8, 13, 1, 420.00), -- Pedido 8: Panelas
(8, 5, 1, 210.00),  -- Pedido 8: Webcam
(8, 14, 2, 75.00);  -- Pedido 8: Quadro (x2)
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES 
(9, 1, 1, 159.90);  -- Pedido 9: Mouse

INSERT INTO pagamentos (id_pedido, valor, tipo, status, data_pagamento) VALUES 
(1, 1409.90, 'Cartão Crédito', 'aprovado', '2024-04-15'),
(2, 538.90, 'Pix', 'aprovado', '2024-04-16'),
(3, 1799.98, 'Boleto', 'pendente', '2024-04-17'),
(4, 595.00, 'Cartão Crédito', 'aprovado', '2024-04-18'),
(5, 520.50, 'Cartão Débito', 'cancelado', '2024-04-19'),
(6, 559.00, 'Pix', 'aprovado', '2024-04-20'),
(7, 226.70, 'Boleto', 'pendente', '2024-04-21'),
(8, 780.00, 'Cartão Crédito', 'aprovado', '2024-04-22');
INSERT INTO pagamentos (id_pedido, valor, tipo, status, data_pagamento) VALUES 
(9, 159.90, 'Cartão Crédito', 'aprovado', '2024-06-11');
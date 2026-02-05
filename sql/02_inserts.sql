-- =================================
-- INSERTS - TABELA PRODUTOS
-- =================================
INSERT INTO produtos (nome, categoria, preco, descricao) VALUES
('Notebook Dell', 'Eletrônicos', 4500.00, 'Notebook para uso profissional'),
('Mouse Logitech', 'Acessórios', 120.00, 'Mouse sem fio'),
('Teclado Mecânico', 'Acessórios', 350.00, 'Teclado mecânico RGB'),
('Monitor LG 24"', 'Eletrônicos', 900.00, 'Monitor Full HD'),
('Headset HyperX', 'Acessórios', 500.00, 'Headset gamer'),
('Cadeira Gamer', 'Móveis', 1100.00, 'Cadeira ergonômica'),
('HD Externo 1TB', 'Armazenamento', 420.00, 'HD portátil'),
('SSD 512GB', 'Armazenamento', 480.00, 'SSD alta velocidade'),
('Webcam Logitech', 'Acessórios', 300.00, 'Webcam Full HD'),
('Notebook Lenovo', 'Eletrônicos', 3900.00, 'Notebook para estudos');

-- =================================
-- INSERTS - TABELA PEDIDOS
-- =================================
INSERT INTO pedidos (cliente_id, data_pedido) VALUES
(1, '2024-01-10'),
(2, '2024-01-12'),
(3, '2024-01-15'),
(4, '2024-01-18'),
(5, '2024-01-20'),
(6, '2024-01-22'),
(7, '2024-01-25');

-- =====================================
-- INSERTS - TABELA ITENS_PEDIDOS
-- =====================================
INSERT INTO itens_pedidos (pedido_id, produto_id, quantidade) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(2, 4, 1),
(3, 5, 1),
(3, 6, 1),
(4, 7, 2),
(5, 8, 1),
(6, 9, 1),
(7, 10, 1);

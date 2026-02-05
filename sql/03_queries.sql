-- Quais pedidos foram feitos, por quem e em qual data? --
-- ==================================================== --
SELECT p.id, c.nome, p.data_pedido
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
-- ==================================================== --
-- Quais produtos existem em cada pedido e em que quantidade? --
-- ==================================================== --
SELECT p.id, pd.nome as nome_produto, ip.quantidade
FROM pedidos p
JOIN itens_pedidos ip ON p.id = ip.pedido_id
JOIN produtos pd ON pd.id = ip.produto_id 
-- ============================================== --
-- Quantos itens no total existem em cada pedido? --
-- ==================================================== --
SELECT 
    p.id AS pedido_id,
    SUM(ip.quantidade) AS total_itens
FROM itens_pedidos ip
JOIN pedidos p ON p.id = ip.pedido_id
GROUP BY p.id;
-- ==================================================== --
-- Qual valor total de cada pedido? --
-- ==================================================== --
SELECT 
	p.id as pedido_id,
    SUM(ip.quantidade * pd.preco) AS valor_total
FROM itens_pedidos ip
JOIN pedidos p ON p.id = ip.pedido_id
JOIN produtos pd ON pd.id = ip.produto_id
GROUP BY p.id
-- ===================================================--
-- Quanto cada cliente já gastou somando todos os pedidos? --
-- ==================================================== --
SELECT 
	c.nome as nome_cliente,
    SUM(ip.quantidade * pd.preco) as valor_gastado
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
JOIN itens_pedidos ip ON p.id = ip.pedido_id
JOIN produtos pd ON pd.id = ip.produto_id
GROUP BY c.nome
-- ================================================= --
-- Qual cliente fez mais pedidos? --
-- ==================================================== --
SELECT
	c.nome,
    COUNT(p.id) as total_pedidos
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.nome
ORDER BY total_pedidos DESC
LIMIT 1
-- ===================================================== --
-- Quais são os 3 clientes que mais gastaram no total? --
-- ==================================================== --
SELECT 
	c.nome as top3_clientes,
    SUM(ip.quantidade * pd.preco) as valor_gastado
FROM clientes c
JOIN pedidos p ON c.id = p.cliente_id
JOIN itens_pedidos ip ON p.id = ip.pedido_id
JOIN produtos pd ON pd.id = ip.produto_id
GROUP BY c.nome
ORDER BY valor_gastado DESC 
LIMIT 3
-- ================================================== --
-- Qual é o valor médio dos pedidos? --
-- ==================================================== --
SELECT 
    AVG(valor_total) AS ticket_medio
FROM (
    SELECT
        p.id AS pedido_id,
        SUM(ip.quantidade * pd.preco) AS valor_total
    FROM itens_pedidos ip
    JOIN pedidos p ON p.id = ip.pedido_id
    JOIN produtos pd ON pd.id = ip.produto_id
    GROUP BY p.id
) AS pedidos_totais;

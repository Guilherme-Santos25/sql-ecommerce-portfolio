--1. Qual o total de receita gerada pelos pedidos com status aprovado?
select id_pedido, status from pedidos where status = 'aprovado'; --listando os pedidos aprovados e mostrando quais devo somar
select p.id_pedido, i.preco_unitario, i.quantidade from pedidos p join itens_pedido i on p.id_pedido = i.id_pedido where p.status = 'aprovado'; 
--aqui estou conectando com itens_pedido via JOIN, além de já conseguir ver os itens de cada pedido aprovado
select sum(i.quantidade * i.preco_unitario) as receita_total from pedidos p join itens_pedido i on p.id_pedido = i.id_pedido where p.status = 'aprovado';
-- aqui estou respondendo a pergunta. somando a quantidade vezes preço de todos os itens, vindo da tabela pedidos conectada com itens_pedido, mas só onde o status for aprovado.

-- 2. Quais são os 3 produtos mais caros do catálogo?
select nome_produto, preco as preco_unitario from produtos order by preco desc limit 3;

-- 3. Quantos pedidos cada cliente fez? Liste o nome do cliente e a quantidade de pedidos, ordenado do maior para o menor.
select count(*) as quantidade_de_pedidos from pedidos; -- mostrando quantos pedidos tiveram
select c.nome, count(*) as quantidade_de_pedidos from pedidos p join clientes c on c.id_cliente = p.id_cliente group by c.nome order by quantidade_de_pedidos desc;

-- 4. Qual cidade tem mais clientes cadastrados?
select cidade, count(id_cliente) as quantidade_clientes from clientes group by cidade order by quantidade_clientes desc limit 1;

-- 5. Qual o ticket médio dos pagamentos aprovados?
select avg(valor) as ticket_medio from pagamentos where status = 'aprovado';

-- 6. Quais produtos nunca foram vendidos?
select p.nome_produto as produtos_nao_vendidos from produtos p left join itens_pedido i on i.id_produto = p.id_produto where i.id_pedido is null;

-- 7. Qual o valor total de cada pedido? Liste nome do cliente, id do pedido e valor total, ordenado do maior para o menor.
select c.nome, p.id_pedido, sum(i.preco_unitario * i.quantidade) as total_pedido from clientes c join pedidos p on c.id_cliente = p.id_cliente 
join itens_pedido i on p.id_pedido = i.id_pedido group by c.nome, p.id_pedido order by total_pedido desc;

-- 8. Quais clientes gastaram mais de R$500 no total? Liste nome e valor total gasto.
select c.nome, sum(pg.valor) as total_gasto from clientes c join pedidos p on c.id_cliente = p.id_cliente 
join pagamentos pg on pg.id_pedido = p.id_pedido where pg.status = 'aprovado' group by c.nome having sum(pg.valor) > 500 order by total_gasto desc 

-- 9. Liste todos os produtos com seu preço e a média de preço da sua categoria ao lado sem usar GROUP BY
select nome_produto, preco, tipo_produto as categoria, 
avg(preco) over(partition by tipo_produto) as media_valor_categoria 
from produtos;

-- 10. Qual o ranking dos clientes que mais gastaram? Use RANK() para numerar do maior para o menor
--- primeiros vamos caucular o total gasto por cliente
select c.nome, sum(pg.valor) as total_gasto from clientes c
join pedidos p on c.id_cliente = p.id_cliente 
join pagamentos pg on pg.id_pedido = p.id_pedido
group by c.nome

--- agora vamos transformar numa CTE (uma tabela temporário que eu posso utilizar como se fosse uma tabela normal)
with total_por_cliente as (
    select c.nome, sum(pg.valor) as total_gasto
    from clientes c
    join pedidos p on c.id_cliente = p.id_cliente
    join pagamentos pg on pg.id_pedido = p.id_pedido
    group by c.nome
)
select 
    nome,
    total_gasto,
    rank() over (order by total_gasto desc) as ranking
from total_por_cliente;

-- 11. Quais pedidos tiveram valor acima da média geral de todos os pedidos?
with valor_por_pedido AS (
    select p.id_pedido, c.nome, sum(i.quantidade * i.preco_unitario) as valor_pedido
    from pedidos p
    join clientes c on c.id_cliente = p.id_cliente
    join itens_pedido i on p.id_pedido = i.id_pedido
    group by p.id_pedido, c.nome
)
select 
    id_pedido,
    nome,
    valor_pedido,
    round(avg(valor_pedido) over (), 2) as media_geral
from valor_por_pedido
where valor_pedido > (select avg(valor_pedido) from valor_por_pedido)
order by valor_pedido desc;

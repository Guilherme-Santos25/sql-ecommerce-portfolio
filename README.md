# ShopData — Análise de E-commerce com SQL

## Sobre o Projeto
Projeto de portfólio simulando o banco de dados de uma empresa 
de e-commerce fictícia chamada ShopData. O objetivo foi modelar 
o banco do zero, popular com dados realistas e extrair insights 
de negócio usando PostgreSQL.

## Modelagem do Banco
O banco é composto por 5 tabelas:
- **clientes** — cadastro de clientes
- **produtos** — catálogo de produtos
- **pedidos** — pedidos realizados
- **itens_pedido** — itens de cada pedido
- **pagamentos** — pagamentos associados aos pedidos

## Análises Realizadas

### Nível 1 — Exploratórias
- Receita total de pedidos aprovados
- Top 3 produtos mais caros
- Pedidos por cliente
- Cidade com mais clientes
- Ticket médio de pagamentos aprovados

### Nível 2 — Intermediárias
- Produtos nunca vendidos
- Valor total por pedido
- Clientes que gastaram acima de R$500

### Nível 3 — Avançadas
- Média de preço por categoria com Window Function
- Ranking de clientes por total gasto
- Pedidos acima da média geral

## Principais Insights
- A receita total de pedidos aprovados foi de R$ 4.042,70
- Os 3 produtos mais caros são Monitor e Fone (Eletrônicos) 
  e Cadeira Ergonômica (Escritório)
- Apenas 3 pedidos ficaram acima da média geral de R$ 1.329,96

## Tecnologias
- PostgreSQL
- PgAdmin

## Estrutura do Projeto
├── schema.sql     — criação das tabelas
├── dados.sql      — inserção dos dados
└── analises.sql   — queries de análise

## Como Executar
1. Criar o banco de dados no PostgreSQL
2. Rodar o schema.sql
3. Rodar o dados.sql
4. Rodar as queries do analises.sql

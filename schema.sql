create table clientes(
	id_cliente serial primary key,
	nome varchar(100) not null,
	email varchar(100) not null,
	data_cadastro date not null,
	cidade varchar(100) not null,
	estado varchar(2) not null
);

create table produtos(
	id_produto serial primary key,
	nome_produto varchar(100) not null,
	tipo_produto varchar(100) not null,
	preco decimal(10, 2) not null
);

create table pedidos(
	id_pedido serial primary key,
	id_cliente int not null,
	data_pedido date not null,
	status varchar(20) not null check (status in ('pendente','aprovado', 'cancelado')),

	constraint pedidos_id_cliente_fk foreign key (id_cliente) references clientes(id_cliente)
);

create table itens_pedido(
	id_item_pedido serial primary key,
	id_pedido int not null,
	id_produto int not null,
	quantidade int not null,
	preco_unitario decimal (10,2) not null,

	constraint itens_pedido_id_pedido_fk foreign key (id_pedido) references pedidos(id_pedido),
	constraint itens_pedido_id_produto_fk foreign key (id_produto) references produtos(id_produto)
);

create table pagamentos(
	id_pagamento serial primary key,
	id_pedido int not null,
	valor decimal(10,2) not null,
	tipo varchar(15) not null,
	status varchar(20) not null check (status in ('pendente','aprovado', 'cancelado')),
	data_pagamento date not null,

	constraint pagamentos_id_pedido_fk foreign key (id_pedido) references pedidos(id_pedido)
);

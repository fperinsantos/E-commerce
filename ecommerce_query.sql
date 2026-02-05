-- recuperações simples com select

-- Seleciona todos os produtos (consulta básica)
select * from product;

-- Seleciona nome, categoria e avaliação apenas de produtos eletrônicos
select Pname, category, avaliacao from product where category = 'Eletrônico';

-- Seleciona ID, descrição e status apenas de pedidos confirmados
select idOrder, orderDescription, orderStatus from orders where orderStatus = 'Confirmado';


-- filtros com where

-- Seleciona produtos com avaliação superior a 4.5
select Pname, category, avaliacao from product where avaliacao > 4.5;

-- Seleciona roupas com peso menor que 1kg
select Pname, category, peso from product where category = 'Vestimenta' and peso < 1.0;

-- Seleciona entregas ainda não realizadas (data de entrega vazia)
select idDelivery, trackingCode, deliveryStatus from delivery where deliveryDate is null;


-- expressões para gerar atributos derivados

-- Junta tabelas client e person para mostrar nome completo de clientes PF
select 
    c.idClient,
    c.clientType,
    concat(p.Fname, ' ', p.Minit, ' ', p.Lname) as NomeCompleto,
    p.CPF
from client c
inner join person p on c.idClient = p.idClient;

-- Calcula preço estimado baseado no peso do produto (R$ 50 por kg)
select 
    Pname,
    peso,
    peso * 50 as PrecoEstimado,
    concat('R$ ', round(peso * 50, 2)) as PrecoFormatado
from product
where peso is not null;

-- Classifica produtos em categorias de peso (leve, médio, pesado, muito pesado)
select 
    Pname,
    peso,
    case 
        when peso < 1 then 'Leve'
        when peso >= 1 and peso < 10 then 'Médio'
        when peso >= 10 and peso < 50 then 'Pesado'
        else 'Muito Pesado'
    end as ClassificacaoPeso
from product
where peso is not null;

-- Mostra informações completas de clientes (PF ou PJ) com join condicional
select 
    c.idClient,
    c.clientType,
    case 
        when c.clientType = 'PF' then concat(p.Fname, ' ', p.Lname)
        when c.clientType = 'PJ' then comp.SocialName
    end as NomeCliente,
    case 
        when c.clientType = 'PF' then p.CPF
        when c.clientType = 'PJ' then comp.CNPJ
    end as Documento,
    c.Address
from client c
left join person p on c.idClient = p.idClient
left join company comp on c.idClient = comp.idClient;


-- ordenações com order by

-- Lista produtos ordenados por avaliação (melhores primeiro)
select Pname, category, avaliacao from product order by avaliacao desc;

-- Lista clientes ordenados por tipo (PF/PJ) e depois por endereço
select idClient, clientType, Address from client order by clientType, Address;

-- Lista produtos com peso, ordenados do mais pesado para o mais leve
select Pname, peso, category from product where peso is not null order by peso desc;


-- filtros aos grupos com having

-- Clientes com mais de 2 pedidos (agrupamento com filtro no grupo)
select 
    o.idOrderClient,
    count(*) as TotalPedidos
from orders o
group by o.idOrderClient
having count(*) > 2;

-- Categorias com avaliação média superior a 4.0
select 
    category,
    round(avg(avaliacao), 2) as AvaliacaoMedia,
    count(*) as TotalProdutos
from product
group by category
having avg(avaliacao) > 4.0;

-- Fornecedores que fornecem mais de 2 produtos diferentes
select 
    s.SocialName,
    count(ps.idPsProduct) as TotalProdutosFornecidos
from supplier s
inner join productSupplier ps on s.idSupplier = ps.idPsSupplier
group by s.idSupplier, s.SocialName
having count(ps.idPsProduct) > 2;

-- Clientes com limite total de pagamento superior a R$ 10.000
select 
    p.idClient,
    sum(p.limitAvailable) as LimiteTotal
from payments p
group by p.idClient
having sum(p.limitAvailable) > 10000;


-- quantos pedidos foram feitos por cada cliente (análise de vendas por cliente)
select 
    c.idClient,
    case 
        when c.clientType = 'PF' then concat(p.Fname, ' ', p.Lname)
        when c.clientType = 'PJ' then comp.SocialName
    end as NomeCliente,
    c.clientType,
    count(o.idOrder) as TotalPedidos
from client c
left join person p on c.idClient = p.idClient
left join company comp on c.idClient = comp.idClient
left join orders o on c.idClient = o.idOrderClient
group by c.idClient, NomeCliente, c.clientType
order by TotalPedidos desc;


-- algum vendedor também é fornecedor (verificação de dupla função)
select 
    s.SocialName as NomeVendedor,
    s.CNPJ as CNPJ_Vendedor,
    sup.SocialName as NomeFornecedor,
    sup.CNPJ as CNPJ_Fornecedor,
    'SIM - Vendedor também é Fornecedor' as Status
from seller s
inner join supplier sup on s.CNPJ = sup.CNPJ
where s.CNPJ is not null;


-- relação de produtos, fornecedores e estoques (visão completa do inventário)
select 
    p.Pname as Produto,
    p.category as Categoria,
    sup.SocialName as Fornecedor,
    ps.quantity as QuantidadeFornecedor,
    st.storageLocation as LocalEstoque,
    st.quantity as QuantidadeEstoque
from product p
inner join productSupplier ps on p.idProduct = ps.idPsProduct
inner join supplier sup on ps.idPsSupplier = sup.idSupplier
left join storageLocation sl on p.idProduct = sl.idLproduct
left join productStorage st on sl.idLstorage = st.idProdStorage
order by p.Pname;


-- relação de nomes dos fornecedores e nomes dos produtos (catálogo de fornecimento)
select 
    sup.SocialName as Fornecedor,
    sup.CNPJ,
    p.Pname as Produto,
    p.category as Categoria,
    ps.quantity as QuantidadeFornecida
from supplier sup
inner join productSupplier ps on sup.idSupplier = ps.idPsSupplier
inner join product p on ps.idPsProduct = p.idProduct
order by sup.SocialName, p.Pname;


-- pedidos com detalhes completos (visão 360° do pedido)
select 
    o.idOrder,
    case 
        when c.clientType = 'PF' then concat(p.Fname, ' ', p.Lname)
        when c.clientType = 'PJ' then comp.SocialName
    end as Cliente,
    o.orderStatus,
    pay.typePayment as FormaPagamento,
    d.deliveryStatus as StatusEntrega,
    d.trackingCode as CodigoRastreio
from orders o
inner join client c on o.idOrderClient = c.idClient
left join person p on c.idClient = p.idClient
left join company comp on c.idClient = comp.idClient
left join payments pay on o.idPayment = pay.idPayment
left join delivery d on o.idOrder = d.idOrder
order by o.idOrder;


-- relatório de estoque por categoria (análise por categoria)
select 
    p.category as Categoria,
    count(distinct p.idProduct) as TotalProdutos,
    sum(st.quantity) as QuantidadeTotalEstoque,
    round(avg(p.avaliacao), 2) as AvaliacaoMedia
from product p
left join storageLocation sl on p.idProduct = sl.idLproduct
left join productStorage st on sl.idLstorage = st.idProdStorage
group by p.category
order by TotalProdutos desc;


-- ranking de produtos mais pedidos (top 10 produtos mais populares)
select 
    p.Pname,
    p.category,
    count(po.idPOorder) as TotalPedidos,
    sum(po.poQuantity) as QuantidadeTotal
from product p
inner join productOrder po on p.idProduct = po.idPOproduct
group by p.idProduct, p.Pname, p.category
order by TotalPedidos desc
limit 10;


-- análise de entregas por status (distribuição do status de entregas)
select 
    d.deliveryStatus,
    count(*) as TotalEntregas,
    round(count(*) * 100.0 / (select count(*) from delivery), 2) as PercentualTotal
from delivery d
group by d.deliveryStatus
order by TotalEntregas desc;


-- relatório executivo (KPIs gerais do e-commerce)
select 
    (select count(*) from client) as TotalClientes,
    (select count(*) from product) as TotalProdutos,
    (select count(*) from orders) as TotalPedidos,
    (select count(*) from orders where orderStatus = 'Confirmado') as PedidosConfirmados,
    (select round(avg(avaliacao), 2) from product) as AvaliacaoMediaGeral;
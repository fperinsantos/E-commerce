
create database ecommerce;
use ecommerce;

-- criar tabela cliente
create table client(
    idClient int auto_increment primary key,
    clientType enum('PF','PJ') not null,
    Address varchar(255)
);

create table person(
    idClient int primary key,
    Fname varchar(50),
    Minit char(3),
    Lname varchar(50),
    CPF char(11) not null,
    constraint unique_cpf_person unique (CPF),
    constraint fk_person_client
        foreign key (idClient)
        references client(idClient)
);

create table company(
    idClient int primary key,
    SocialName varchar(255) not null,
    CNPJ char(18) not null,
    constraint unique_cnpj_company unique (CNPJ),
    constraint fk_company_client
        foreign key (idClient)
        references client(idClient)
);

-- criar tabela produto
create table product(
    idProduct int auto_increment primary key,
    Pname varchar(60) not null,
    classification_kids bool default false,
    category enum('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis') not null,
    avaliacao float default 0,
    peso decimal(6,2),
    size varchar(10),
    constraint unique_pname_product unique (Pname)
);

-- tabela de pagamentos
create table payments(
    idPayment int auto_increment primary key,
    idClient int not null,
    typePayment enum('Boleto','Cartão','Dois cartões'),
    limitAvailable decimal(10,2),
    constraint fk_payments_client
        foreign key (idClient)
        references client(idClient)
);

-- tabela de pedidos
create table orders(
    idOrder int auto_increment primary key,
    idOrderClient int not null,
    orderStatus enum('Cancelado','Confirmado','Em processamento')
        default 'Em processamento',
    orderDescription varchar(255),
    sendValue decimal(10,2) default 10,
    paymentCash bool default false,
    idPayment int,
    constraint fk_orders_client
        foreign key (idOrderClient)
        references client(idClient),
    constraint fk_orders_payment
        foreign key (idPayment)
        references payments(idPayment)
);

create table delivery(
    idDelivery int auto_increment primary key,
    idOrder int not null,
    deliveryStatus enum('Pendente','Processando','Em trânsito','Entregue','Cancelada')
        default 'Pendente',
    trackingCode varchar(50),
    estimatedDate date,
    deliveryDate date,
    constraint fk_delivery_order
        foreign key (idOrder)
        references orders(idOrder)
);

-- criar tabela estoque
create table productStorage(
    idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

-- criar tabela fornecedor
create table supplier(
    idSupplier int auto_increment primary key,
    SocialName varchar(255) not null,
    CNPJ char(18) not null,
    contact varchar(15) not null,
    constraint unique_supplier unique (CNPJ)
);

-- criar tabela vendedor
create table seller(
    idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(18),
    CPF char(11),
    location varchar(255),
    contact varchar(15) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF),
    constraint check_seller_doc
        check (
            (CNPJ is not null and CPF is null)
         or (CPF is not null and CNPJ is null)
        )
);

create table productSeller(
    idPSeller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPSeller, idPproduct),
    constraint fk_productseller_seller
        foreign key (idPSeller)
        references seller(idSeller),
    constraint fk_productseller_product
        foreign key (idPproduct)
        references product(idProduct)
);

create table productOrder(
    idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_productorder_product
        foreign key (idPOproduct)
        references product(idProduct),
    constraint fk_productorder_order
        foreign key (idPOorder)
        references orders(idOrder)
);

create table storageLocation(
    idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    primary key (idLproduct, idLstorage),
    constraint fk_storagelocation_product
        foreign key (idLproduct)
        references product(idProduct),
    constraint fk_storagelocation_storage
        foreign key (idLstorage)
        references productStorage(idProdStorage)
);

create table productSupplier(
    idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_productsupplier_supplier
        foreign key (idPsSupplier)
        references supplier(idSupplier),
    constraint fk_productsupplier_product
        foreign key (idPsProduct)
        references product(idProduct)
);

show tables;
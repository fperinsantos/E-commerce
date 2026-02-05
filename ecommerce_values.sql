insert into client (idClient, clientType, Address) values
    (1, 'PF', 'Rua das Flores, 123, São Paulo, SP'),
    (2, 'PJ', 'Av. Paulista, 1000, São Paulo, SP'),
    (3, 'PF', 'Rua Amazonas, 456, Rio de Janeiro, RJ'),
    (4, 'PJ', 'Rua Comercial, 789, Curitiba, PR'),
    (5, 'PF', 'Av. Brasil, 321, Belo Horizonte, MG'),
    (6, 'PF', 'Rua das Acácias, 111, Porto Alegre, RS');

insert into person (idClient, Fname, Minit, Lname, CPF) values
    (1, 'João', 'A', 'Silva', '12345678901'),
    (3, 'Maria', 'B', 'Santos', '23456789012'),
    (5, 'Carlos', 'C', 'Oliveira', '34567890123'),
    (6, 'Ana', 'D', 'Costa', '45678901234');

insert into company (idClient, SocialName, CNPJ) values
    (2, 'Tech Solutions Ltda', '12.345.678/0001-90'),
    (4, 'Comercial Paraná S.A.', '23.456.789/0001-01');

insert into product (Pname, classification_kids, category, avaliacao, peso, size) values
    ('Notebook Dell Inspiron', false, 'Eletrônico', 4.5, 2.5, 'N/A'),
    ('Smart TV Samsung 50"', false, 'Eletrônico', 4.7, 15.0, '50 pol'),
    ('Camiseta Nike Dry-Fit', false, 'Vestimenta', 4.2, 0.2, 'M'),
    ('Tênis Adidas Ultraboost', false, 'Vestimenta', 4.8, 0.8, '42'),
    ('LEGO Star Wars', true, 'Brinquedos', 4.9, 1.2, 'Grande'),
    ('Boneca Barbie', true, 'Brinquedos', 4.3, 0.3, 'Padrão'),
    ('Chocolate Nestlé 200g', false, 'Alimentos', 4.0, 0.2, 'N/A'),
    ('Café Pilão 500g', false, 'Alimentos', 4.6, 0.5, 'N/A'),
    ('Sofá 3 lugares', false, 'Móveis', 4.4, 80.0, '2.1m'),
    ('Mesa de Jantar', false, 'Móveis', 4.5, 45.0, '1.8m');

insert into payments (idClient, typePayment, limitAvailable) values
    (1, 'Cartão', 5000.00),
    (1, 'Boleto', 10000.00),
    (2, 'Dois cartões', 20000.00),
    (3, 'Cartão', 3000.00),
    (4, 'Boleto', 50000.00),
    (5, 'Cartão', 8000.00),
    (5, 'Dois cartões', 8000.00),
    (6, 'Boleto', 2000.00);

insert into orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash, idPayment) values
    (1, 'Confirmado', 'Pedido de eletrônicos', 15.00, false, 1),
    (1, 'Em processamento', 'Pedido de roupas', 12.00, false, 2),
    (2, 'Confirmado', 'Pedido corporativo', 50.00, false, 3),
    (3, 'Confirmado', 'Pedido de brinquedos', 10.00, true, 4),
    (4, 'Em processamento', 'Pedido de móveis', 80.00, false, 5),
    (5, 'Confirmado', 'Pedido de alimentos', 8.00, false, 6),
    (6, 'Cancelado', 'Pedido cancelado pelo cliente', 10.00, false, 8),
    (1, 'Confirmado', 'Segundo pedido', 15.00, false, 1);

insert into delivery (idOrder, deliveryStatus, trackingCode, estimatedDate, deliveryDate) values
    (1, 'Entregue', 'BR123456789', '2026-01-20', '2026-01-18'),
    (2, 'Em trânsito', 'BR987654321', '2026-02-10', null),
    (3, 'Processando', 'BR456789123', '2026-02-15', null),
    (4, 'Entregue', 'BR789123456', '2026-01-25', '2026-01-24'),
    (5, 'Pendente', 'BR321654987', '2026-02-20', null),
    (6, 'Em trânsito', 'BR654987321', '2026-02-08', null),
    (7, 'Cancelada', 'BR111222333', null, null),
    (8, 'Processando', 'BR444555666', '2026-02-12', null);

insert into productStorage (storageLocation, quantity) values
    ('Armazém São Paulo - Setor A', 150),
    ('Armazém Rio de Janeiro - Setor B', 200),
    ('Armazém Curitiba - Setor C', 100),
    ('Centro de Distribuição SP', 500);

insert into supplier (SocialName, CNPJ, contact) values
    ('Fornecedor Tech Ltda', '11.222.333/0001-44', '11987654321'),
    ('Distribuidora Roupas S.A.', '22.333.444/0001-55', '21987654321'),
    ('Brinquedos Importados', '33.444.555/0001-66', '41987654321'),
    ('Alimentos Distribuição', '44.555.666/0001-77', '31987654321'),
    ('Móveis e Decoração', '55.666.777/0001-88', '51987654321');

insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
    ('Vendedor João ME', 'João Vendas', null, '98765432109', 'São Paulo, SP', '11999887766'),
    ('Loja Tech EIRELI', 'Tech Store', '66.777.888/0001-99', null, 'Rio de Janeiro, RJ', '21999887766'),
    ('Maria Comercial', 'Maria Store', null, '87654321098', 'Curitiba, PR', '41999887766'),
    ('Comercial Paraná S.A.', 'Paraná Vendas', '23.456.789/0001-01', null, 'Curitiba, PR', '41988776655');

insert into productSeller (idPSeller, idPproduct, prodQuantity) values
    (1, 1, 10),
    (1, 3, 50),
    (2, 2, 5),
    (2, 1, 8),
    (3, 5, 20),
    (3, 6, 30),
    (4, 9, 3),
    (4, 10, 2);

insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
    (1, 1, 1, 'Disponível'),
    (3, 2, 2, 'Disponível'),
    (4, 2, 1, 'Disponível'),
    (2, 3, 2, 'Disponível'),
    (5, 4, 3, 'Disponível'),
    (6, 4, 2, 'Disponível'),
    (9, 5, 1, 'Disponível'),
    (7, 6, 10, 'Disponível'),
    (8, 6, 5, 'Disponível'),
    (1, 8, 1, 'Sem estoque');

insert into storageLocation (idLproduct, idLstorage, location) values
    (1, 1, 'Corredor A - Prateleira 5'),
    (2, 1, 'Corredor A - Prateleira 7'),
    (3, 2, 'Corredor B - Prateleira 2'),
    (4, 2, 'Corredor B - Prateleira 3'),
    (5, 3, 'Corredor C - Prateleira 10'),
    (6, 3, 'Corredor C - Prateleira 11'),
    (7, 4, 'Corredor D - Prateleira 1'),
    (8, 4, 'Corredor D - Prateleira 2'),
    (9, 1, 'Corredor E - Prateleira 20'),
    (10, 1, 'Corredor E - Prateleira 21');

insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
    (1, 1, 50),
    (1, 2, 30),
    (2, 3, 200),
    (2, 4, 150),
    (3, 5, 100),
    (3, 6, 80),
    (4, 7, 500),
    (4, 8, 300),
    (5, 9, 20),
    (5, 10, 15);
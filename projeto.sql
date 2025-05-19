CREATE DATABASE LojaOnline;
USE LojaOnline;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100)
);
CREATE TABLE produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    preco DECIMAL(10,2)
);
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);
CREATE TABLE itens_pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_pedido INT,
    id_produto INT,
    quantidade INT,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);
INSERT INTO clientes (nome, email) VALUES
('Ana Souza', 'ana@email.com'),
('Bruno Lima', 'bruno@email.com'),
('Carlos Mendes', 'carlos@email.com'),
('Daniela Castro', 'daniela@email.com'),
('Eduardo Silva', 'eduardo@email.com'),
('Fernanda Rocha', 'fernanda@email.com'),
('Gustavo Neves', 'gustavo@email.com'),
('Helena Dias', 'helena@email.com'),
('Igor Santos', 'igor@email.com'),
('Julia Freitas', 'julia@email.com');

INSERT INTO produtos (nome, preco) VALUES
('Notebook Lenovo', 3500.00),
('Smartphone Samsung', 2200.00),
('Teclado Mecânico', 300.00),
('Mouse Sem Fio', 150.00),
('Monitor 24" LG', 899.99),
('Headset Gamer', 499.90),
('Webcam Full HD', 199.90),
('Impressora HP', 650.00),
('Pen Drive 64GB', 80.00),
('Cadeira Gamer', 1200.00);

INSERT INTO pedidos (id_cliente, data_pedido) VALUES
(1, '2024-05-01'),
(2, '2024-05-02'),
(3, '2024-05-03'),
(4, '2024-05-04'),
(5, '2024-05-05'),
(6, '2024-05-06'),
(7, '2024-05-07'),
(8, '2024-05-08'),
(9, '2024-05-09'),
(10, '2024-05-10');

INSERT INTO itens_pedido (id_pedido, id_produto, quantidade) VALUES
(1, 1, 1),
(1, 4, 2),
(2, 2, 1),
(3, 3, 1),
(3, 5, 1),
(4, 6, 1),
(5, 7, 1),
(6, 8, 2),
(7, 9, 3),
(8, 10, 1);

SELECT pedidos.id, clientes.nome, pedidos.data_pedido
FROM pedidos
INNER JOIN clientes ON pedidos.id_cliente = clientes.id;

SELECT clientes.nome AS cliente, produtos.nome AS produto, itens_pedido.quantidade
FROM itens_pedido
INNER JOIN pedidos ON itens_pedido.id_pedido = pedidos.id
INNER JOIN clientes ON pedidos.id_cliente = clientes.id
INNER JOIN produtos ON itens_pedido.id_produto = produtos.id;

SELECT pedidos.id, clientes.nome
FROM pedidos
INNER JOIN clientes ON pedidos.id_cliente = clientes.id
WHERE clientes.nome LIKE '%a%';

SELECT produtos.nome, clientes.nome
FROM itens_pedido
INNER JOIN pedidos ON itens_pedido.id_pedido = pedidos.id
INNER JOIN clientes ON pedidos.id_cliente = clientes.id
INNER JOIN produtos ON itens_pedido.id_produto = produtos.id
WHERE produtos.nome LIKE '%Gamer%';

SELECT DISTINCT clientes.nome
FROM clientes
INNER JOIN pedidos ON clientes.id = pedidos.id_cliente
INNER JOIN itens_pedido ON pedidos.id = itens_pedido.id_pedido
INNER JOIN produtos ON itens_pedido.id_produto = produtos.id
WHERE produtos.nome LIKE '%Mouse%';
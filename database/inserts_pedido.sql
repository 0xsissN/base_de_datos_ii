
--TRUNCATE pedido RESTART IDENTITY CASCADE;
--TRUNCATE producto RESTART IDENTITY CASCADE;
--TRUNCATE detalle_pedido RESTART IDENTITY CASCADE;
--TRUNCATE cliente RESTART IDENTITY CASCADE;

-- INSERTS ACTUALIZADOS
-- Insertar productos

SELECT * FROM cliente;
SELECT * FROM producto;
SELECT * FROM pedido;
SELECT * FROM detalle_pedido;
INSERT INTO producto (nombre, precio,stock) VALUES
('Teclado Mecánico', 450,10),
('Mouse Óptico', 150,50),
('Monitor 24"', 1200,45),
('Laptop Pro 15"', 7200,34),
('USB 64GB', 120,22),
('Audífonos Bluetooth', 300,55),
('Teclado Inalámbrico', 500,9),
('Tablet 10"', 2500,42),
('Silla Gamer', 1800,72),
('Webcam HD', 600,102),
('Impresora Láser', 2300,32),
('Router WiFi', 350,56),
('Hub USB', 100,91),
('Base para Laptop', 250,101),
('Disco Duro 1TB', 900,200),
('Monitor 27"', 1800,150),
('Mouse Gamer', 220,57),
('Teclado RGB', 520,200),
('SSD 512GB', 1100,20),
('Micrófono USB', 450,72),
('Switch HDMI', 200,22),
('Cámara de Seguridad', 2100,66),
('Power Bank 20000mAh', 320,23),
('Cargador Rápido', 180,12),
('Antena WiFi USB', 80,2),
('Luz LED USB', 60,5),
('Soporte Monitor', 270,8),
('Toner Láser', 850,10),
('Cooler para Laptop', 230,29),
('Duplicador USB', 90,57);

-- Insertar clientes
INSERT INTO cliente (nombre, correo, ciudad) VALUES
('Ana María', 'ana@gmail.com', 'Cochabamba'),
('José Pérez', 'jose@gmail.com', 'La Paz'),
('Elena Díaz', 'elena@gmail.com', 'Santa Cruz'),
('Carlos Ramos', 'carlos@gmail.com', 'La Paz'),
('Andrea López', 'andrea@gmail.com', 'Cochabamba'),
('Luis Suárez', 'luis@gmail.com', 'Tarija'),
('Abigail Cortez', 'abigail@gmail.com', 'Sucre'),
('Bruno Méndez', 'bruno@gmail.com', 'Potosí'),
('Mario Vargas', 'mario@gmail.com', 'La Paz'),
('Tatiana Ríos', 'tatiana@gmail.com', 'Cochabamba'),
('Daniel Arce', 'daniel@gmail.com', 'Beni'),
('Fernando Aliaga', 'fernando@gmail.com', 'Oruro'),
('Pamela Guzmán', 'pamela@gmail.com', 'La Paz'),
('Yolanda Castro', 'yolanda@gmail.com', 'Santa Cruz'),
('Camila Rivas', 'camila@gmail.com', 'Tarija'),
('Adrián Flores', 'adrian@gmail.com', 'Chuquisaca'),
('Martina Herrera', 'martina@gmail.com', 'Cochabamba'),
('Rodolfo Quiroga', 'rodolfo@gmail.com', 'La Paz'),
('Alexis Torres', 'alexis@gmail.com', 'Santa Cruz'),
('Natalia Sánchez', 'natalia@gmail.com', 'Cochabamba');

SELECT * FROM cliente;
SELECT * FROM producto;
SELECT * FROM pedido;
SELECT * FROM detalle_pedido;

-- Insertar pedidos
INSERT INTO pedido (id_cliente, fecha_pedido, estado) VALUES
(1, '2025-06-15', 'Entregado'),
(2, '2025-06-15', 'Pendiente'),
(3, '2025-06-14', 'Cancelado'),
(4, '2025-06-15', 'Entregado'),
(5, '2025-06-10', 'Pendiente'),
(6, '2025-06-20', 'Entregado'),
(7, '2025-06-05', 'Entregado'),
(8, '2025-06-12', 'Pendiente'),
(9, '2025-06-15', 'Entregado'),
(10, '2025-06-16', 'Pendiente'),
(11, '2025-06-21', 'Entregado'),
(12, '2025-06-25', 'Entregado'),
(13, '2025-06-17', 'Entregado'),
(14, '2025-06-18', 'Cancelado'),
(15, '2025-06-22', 'Entregado'),
(16, '2025-06-22', 'Pendiente'),
(17, '2025-06-23', 'Entregado'),
(18, '2025-06-24', 'Entregado'),
(19, '2025-06-24', 'Pendiente'),
(20, '2025-06-25', 'Entregado'),
(1, '2025-06-26', 'Entregado'),
(2, '2025-06-26', 'Entregado'),
(3, '2025-06-26', 'Entregado'),
(4, '2025-06-27', 'Entregado'),
(5, '2025-06-27', 'Pendiente'),
(6, '2025-06-27', 'Entregado'),
(7, '2025-06-28', 'Pendiente'),
(8, '2025-06-28', 'Entregado'),
(9, '2025-06-29', 'Entregado'),
(10, '2025-06-30', 'Pendiente');

-- Insertar detalles de pedido
-- Aquí se asume que el precio_unitario es el mismo que el precio del producto.
-- Puedes ajustarlo si deseas simular descuentos o variaciones.
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 450), (1, 2, 2, 150), (1, 3, 1, 1200),
(2, 4, 1, 7200),
(3, 5, 3, 120),
(4, 6, 2, 300), (4, 7, 1, 500),
(5, 8, 1, 2500), (5, 9, 1, 1800),
(6, 10, 2, 600),
(7, 11, 1, 2300), (7, 12, 1, 350),
(8, 13, 1, 100),
(9, 14, 2, 250), (9, 15, 2, 900),
(10, 16, 1, 1800), (10, 17, 1, 220),
(11, 18, 1, 520),
(12, 19, 2, 1100), (12, 20, 2, 450),
(13, 21, 2, 200),
(14, 22, 1, 2100),
(15, 23, 2, 320), (15, 24, 1, 180),
(16, 25, 2, 80), (16, 26, 1, 60),
(17, 27, 2, 270), (17, 28, 1, 850),
(18, 29, 3, 230),
(19, 30, 2, 90),
(20, 1, 1, 450), (20, 3, 1, 1200), (20, 5, 2, 120),
(21, 6, 1, 300), (21, 8, 1, 2500),
(22, 9, 2, 1800),
(23, 10, 1, 600), (23, 12, 1, 350),
(24, 13, 1, 100), (24, 14, 1, 250),
(25, 15, 1, 900),
(26, 16, 2, 1800),
(27, 17, 1, 220), (27, 18, 1, 520),
(28, 19, 1, 1100),
(29, 20, 2, 450), (29, 21, 1, 200),
(30, 22, 2, 2100), (30, 23, 2, 320), (30, 24, 2, 180);

-- ===================================================
-- CONSULTAS BÁSICAS EN POSTGRESQL
-- ===================================================
-- ===================================================
-- Base de datos: Práctica con base de datos de tienda_online
-- ===================================================
-- En este archivo encontrarán ejemplos prácticos para aprender a:
-- Seleccionar datos (SELECT)
-- Filtrar resultados (WHERE)
-- Ordenar registros (ORDER BY)
-- Usar funciones como SUM, AVG y COUNT
-- Relacionar tablas con JOIN
-- Buscar patrones con LIKE
-- Trabajar con rangos usando BETWEEN
-- Limitar resultados con LIMIT

-- ===================================================
-- CONSULTAS BÁSICAS
-- ===================================================

-- Mostrar todos los datos de la tabla cliente
SELECT * FROM cliente;

-- Mostrar solo nombre y ciudad de los cliente
SELECT nombre, ciudad FROM cliente;

-- Mostrar todos los pedido registrados
SELECT * FROM pedido;

-- ===================================================
-- FILTRAR DATOS (WHERE)
-- ===================================================

-- Clientes que viven en La Paz
SELECT * FROM cliente WHERE ciudad = 'La Paz';

-- Productos con precio mayor a 600
SELECT * FROM producto WHERE precio > 600;

-- Pedidos realizados en una fecha específica
SELECT * FROM pedido WHERE fecha_pedido = '2025-06-15';

-- ===================================================
-- ORDENAR RESULTADOS (ORDER BY)
-- ===================================================

-- Clientes ordenados por nombre alfabéticamente (A-Z)
SELECT * FROM cliente ORDER BY nombre ASC;

-- Productos ordenados por precio del más caro al más barato
SELECT * FROM producto ORDER BY precio DESC;

-- ===================================================
-- OPERADORES LÓGICOS
-- ===================================================

-- Clientes que viven en La Paz o Santa Cruz
SELECT * FROM cliente
WHERE ciudad = 'La Paz' OR ciudad = 'Santa Cruz';

-- Productos con precio > 100 Y cantidad mayor a 1
SELECT * FROM producto
WHERE precio > 300 AND stock > 50;

-- ===================================================
--  AGREGACIÓN
-- ===================================================

-- Calcular el total de productos pedidos (suma de productos)
SELECT SUM(cantidad) AS total_productos FROM detalle_pedido;

-- Promedio de precio de los productos
SELECT AVG(precio) AS promedio_producto FROM producto;

-- Contar cuántos pedidos se han hecho
SELECT COUNT(*) AS total_pedidos FROM pedido;

-- ===================================================
-- AGRUPAR RESULTADOS (GROUP BY)
-- ===================================================

-- Cantidad de pedidos por cliente
SELECT id_cliente, count(id_pedido) AS total
FROM pedido
GROUP BY id_cliente;

-- Promedio de clientes por ciudad
SELECT ciudad, AVG(id_cliente) AS promedio
FROM cliente
GROUP BY ciudad;

-- ===================================================
-- RELACIONAR TABLAS (INNER JOIN)
-- ===================================================

-- Mostrar el nombre del cliente con su producto pedido y precio
SELECT c.nombre, p.producto, p.precio
FROM pedidos p
INNER JOIN clientes c ON p.id_cliente = c.id_cliente;

-- ===================================================
-- BUSCAR PATRONES DE TEXTO (LIKE)
-- ===================================================

-- Clientes cuyo nombre empieza con la letra A
SELECT * FROM cliente
WHERE nombre LIKE 'A%';

-- Clientes con correos que terminan en '@email.com'
SELECT * FROM cliente
WHERE nombre LIKE '%z';

-- ===================================================
-- CONSULTAS POR RANGO DE FECHAS (BETWEEN)
-- ===================================================

-- Pedidos hechos entre el 1 y el 2 de julio
SELECT * FROM pedido
WHERE fecha_pedido BETWEEN '2025-06-01' AND '2025-06-15';

-- ===================================================
-- LIMITAR CANTIDAD DE RESULTADOS (LIMIT)
-- ===================================================

-- Mostrar los 2 pedidos más recientes
SELECT * FROM pedido
ORDER BY fecha_pedido DESC
LIMIT 2;


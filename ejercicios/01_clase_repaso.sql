select *  FROM cliente;

select * FROM producto;

select * from pedido;

--CONSULTAS BASICAS

SELECT * FROM detalle_pedido;
--1. Mostrar el nombre y ciudad de los clientes, ordenados por ciudad de forma
--descendente.
SELECT * FROM cliente
ORDER BY ciudad DESC

--2. Mostrar productos cuyo precio no sea igual a 100.
select * FROM producto
where precio <> 564.60;

--3. Mostrar los pedidos realizados entre el 2024-01-01 y el 2024-12-31, ordenados
--por fecha más reciente.
SELECT * FROM pedido
WHERE fecha_pedido BETWEEN '2025-06-01' AND '2025-06-30'

select * FROM pedido
where id_cliente BETWEEN 1 AND 10;

--4 Buscar clientes cuya ciudad contenga la palabra "gi" (sin importar
--mayúsculas) y ordenar por nombre.

SELECT * FROM cliente
where ciudad ilike '%gi%'

--5 Mostrar productos cuyos nombres terminan en “ina” o contengan la palabra
--“gel”.

SELECT * FROM producto
where nombre like '%vo' or  nombre like 'la%';

--6 Mostrar cuántos pedidos realizó cada cliente y solo mostrar aquellos que
--hicieron más de 1 pedido.

SELECT id_cliente, count(id_pedido) FROM pedido
GROUP BY id_cliente
HAVING count(id_pedido) > 1;

--7. Mostrar el total gastado por cada pedido (id_pedido), solo si supera los 100

select id_pedido,SUM(cantidad * precio_unitario) 
FROM detalle_pedido
GROUP BY id_pedido
HAVING SUM(precio_unitario) > 900;

--8 Mostrar los productos cuyo precio sea mayor que el precio promedio de todos
-- los productos.

--9 Mostrar los nombres de los clientes que han hecho pedidos
SELECT distinct cliente.nombre FROM cliente
INNER JOIN pedido ON cliente.id_cliente = pedido.id_cliente;

--10 Mostrar todos los productos que hayan sido pedidos al menos una vez.
SELECT DISTINCT producto.nombre FROM detalle_pedido
inner join producto on detalle_pedido.id_producto = producto.id_producto;

--11 Mostrar el nombre del cliente y la fecha de cada pedido estado Enviado

SELECT cliente.nombre, pedido.estado,pedido.fecha_pedido FROM cliente
inner JOIN pedido on pedido.id_cliente = cliente.id_cliente
WHERE pedido.estado= 'Enviado';

select cliente.nombre, count(*) FROM cliente
INNER JOIN pedido on cliente.id_cliente = pedido.id_cliente
GROUP BY cliente.nombre
HAVING COUNT(*)>=3;
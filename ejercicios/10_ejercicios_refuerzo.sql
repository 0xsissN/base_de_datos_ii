-- =====================================================================================================
-- Descripción: Este archivo contiene una serie de ejercicios prácticos orientados al refuerzo y 
-- aplicación de conceptos avanzados en bases de datos utilizando PostgreSQL. 
-- Los temas abordados incluyen subconsultas, expresiones comunes de tabla (CTE), funciones definidas 
-- por el usuario y triggers.
-- Cada ejercicio está documentado con su enunciado correspondiente y está diseñado para trabajar 
-- sobre un modelo de datos que incluye tablas como cliente, producto, pedido, detalle_pedido, 
-- comentario, categoría y pago.
-- =====================================================================================================

-- ========================================
-- EJERCICIO 1
-- Obtener el nombre completo de cada cliente y la cantidad total de pedidos que ha realizado.
-- ========================================

-- ========================================
-- EJERCICIO 2
-- Para cada producto, calcular la suma total de unidades vendidas.
-- Mostrar solo aquellos productos cuya venta acumulada supere las 40 unidades.
-- Ordenar de mayor a menor según la cantidad vendida.
-- ========================================

-- ========================================
-- EJERCICIO 3
-- Listar los productos cuyo precio es superior al precio promedio de todos los productos.
-- Utilizar subconsultas.
-- ========================================

-- ========================================
-- EJERCICIO 4
-- Para cada categoría, contar cuántos productos tienen un precio mayor al promedio de su categoría.
-- Utilizar subconsultas correlacionadas.
-- ========================================

-- ========================================
-- EJERCICIO 5
-- Usando un CTE, calcular el número de pedidos y el monto total facturado por mes en el último año.
-- Mostrar solo los meses con más de 50 pedidos.
-- ========================================

-- ========================================
-- EJERCICIO 6
-- Calcular el total vendido de cada producto (cantidad × precio_unitario) en pedidos con estado “pagado”.
-- Unir con las tablas producto y categoría para obtener sus nombres.
-- Mostrar solo los productos cuyo total vendido supere la media de todos los productos.
-- Ordenar de mayor a menor por total vendido.
-- ========================================

-- ========================================
-- EJERCICIO 7
-- Crear una función que aplique un descuento porcentual a un precio dado.
-- Debe retornar el resultado redondeado a dos decimales.
-- ========================================

-- ========================================
-- EJERCICIO 8
-- Crear una función que, dado un cliente_id, retorne su nombre completo y el total facturado por dicho cliente.
-- ========================================

-- ========================================
-- EJERCICIO 9
-- Trigger
-- Antes de insertar un nuevo comentario, asignar puntaje = 3 si no se especifica (puntaje IS NULL).
-- ========================================

-- ========================================
-- EJERCICIO 10
-- Trigger
-- Luego de insertar un pedido con estado “pagado”, insertar automáticamente un registro en la tabla pago con el mismo monto.
-- ========================================

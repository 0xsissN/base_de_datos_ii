
-- Ejercicios de consultas para la base de datos CineDB

-- 1. Listar todos los espectadores con su nombre y correo.
SELECT nombre, correo FROM espectador;

-- 2. Mostrar todas las películas con su título y género.
SELECT titulo, genero FROM pelicula;

-- 3. Mostrar todas las salas con su nombre y capacidad.
SELECT nombre, capacidad FROM sala;

-- 4. Listar todas las funciones con fecha, hora, nombre de la película y nombre de la sala.
SELECT f.fecha, f.hora, p.titulo, s.nombre AS sala
FROM funcion f
INNER JOIN pelicula p ON f.id_pelicula = p.id_pelicula
INNER JOIN sala s ON f.id_sala = s.id_sala;

SELECT* FROM pelicula;

-- 5. Mostrar todos los boletos con el nombre del espectador, título de la película y precio.
SELECT e.nombre AS espectador, p.titulo AS pelicula, b.precio
FROM boleto b
INNER JOIN espectador e ON b.id_espectador = e.id_espectador
INNER JOIN funcion f ON b.id_funcion = f.id_funcion
INNER JOIN pelicula p ON f.id_pelicula = p.id_pelicula;

-- 6. Mostrar el total de boletos vendidos por cada función (id_funcion y cantidad).
SELECT id_funcion, COUNT(*) AS total_boletos
FROM boleto
GROUP BY id_funcion;

-- 7. Mostrar las películas junto con la cantidad de funciones programadas para cada una.
SELECT p.titulo, COUNT(f.id_funcion) AS total_funciones
FROM pelicula p
INNER JOIN funcion f ON p.id_pelicula = f.id_pelicula
GROUP BY p.titulo;

-- 8. Listar los espectadores que compraron boleto para la función con id_funcion = 5.
SELECT e.nombre, e.correo
FROM boleto b
INNER JOIN espectador e ON b.id_espectador = e.id_espectador
WHERE b.id_funcion = 5;

-- 9. Mostrar todas las funciones que se realizan en la sala llamada 'Sala 1'.
SELECT f.fecha, f.hora, p.titulo
FROM funcion f
INNER JOIN sala s ON f.id_sala = s.id_sala
INNER JOIN pelicula p ON f.id_pelicula = p.id_pelicula
WHERE s.nombre = 'Sala 1';

SELECT * FROM funcion f

-- 10. Mostrar el total de ingresos (suma de precios) por cada película.
SELECT p.titulo, SUM(b.precio) AS ingresos_totales
FROM boleto b
INNER JOIN funcion f ON b.id_funcion = f.id_funcion
INNER JOIN pelicula p ON f.id_pelicula = p.id_pelicula
GROUP BY p.titulo;

-- 11. Listar las funciones del día '2025-07-12' con hora, título de película y sala.
SELECT f.hora, p.titulo, s.nombre AS sala
FROM funcion f
INNER JOIN pelicula p ON f.id_pelicula = p.id_pelicula
INNER JOIN sala s ON f.id_sala = s.id_sala
WHERE f.fecha = '2025-07-12';

-- 12. Mostrar todos los espectadores mayores de 30 años que compraron boletos.
SELECT DISTINCT e.nombre, e.edad, p.titulo
FROM boleto b
INNER JOIN espectador e ON b.id_espectador = e.id_espectador
INNER JOIN funcion f ON b.id_funcion = f.id_funcion
INNER JOIN pelicula p ON f.id_pelicula = p.id_pelicula
WHERE e.edad > 30;

-- 13. Listar las películas del género 'Ciencia Ficción' junto con sus funciones.
SELECT p.titulo, f.fecha, f.hora
FROM pelicula p
INNER JOIN funcion f ON p.id_pelicula = f.id_pelicula
WHERE p.genero = 'Ciencia Ficción';

-- 14. Mostrar para cada sala, la cantidad de funciones programadas.
SELECT s.nombre AS sala, COUNT(f.id_funcion) AS total_funciones
FROM sala s
LEFT JOIN funcion f ON s.id_sala = f.id_sala
GROUP BY s.nombre;

-- 15. Listar los espectadores que asistieron a funciones después de las 20:00 horas.
SELECT DISTINCT e.nombre, p.titulo, f.hora
FROM boleto b
INNER JOIN espectador e ON b.id_espectador = e.id_espectador
INNER JOIN funcion f ON b.id_funcion = f.id_funcion
INNER JOIN pelicula p ON f.id_pelicula = p.id_pelicula
WHERE f.hora > '20:00';

-- 16. Mostrar los boletos con precios entre 25 y 28.
SELECT id_boleto, precio, id_funcion, id_espectador
FROM boleto
WHERE precio BETWEEN 25 AND 28;

-- 17. Listar los espectadores cuyo nombre comienza con la letra 'M'.
SELECT id_espectador, nombre, correo
FROM espectador
WHERE nombre LIKE 'M%';

-- 18. Mostrar las 5 películas con mayor duración.
SELECT titulo, duracion
FROM pelicula
ORDER BY duracion DESC
LIMIT 5;

-- 19. Mostrar el total de boletos vendidos y la suma total recaudada.
SELECT COUNT(*) AS total_boletos, SUM(precio) AS total_recaudado
FROM boleto;

-- 20. Listar las funciones programadas entre el 2025-07-10 y 2025-07-13.
SELECT f.fecha, f.hora, p.titulo, s.nombre AS sala
FROM funcion f
INNER JOIN pelicula p ON f.id_pelicula = p.id_pelicula
INNER JOIN sala s ON f.id_sala = s.id_sala
WHERE f.fecha BETWEEN '2025-07-10' AND '2025-07-13';

-- ================================================
-- BASE DE DATOS
-- ================================================

-- Ejercicio 1.
-- Muestra los nombres de las personas que están inscritas en más de un curso.
-- 🔸 Campos a mostrar: nombre, apellido_paterno, apellido_materno.

SELECT p.nombre, p.apellido_materno,p.apellido_materno FROM persona p
INNER JOIN usuario u on p.id=u.id
where p.id IN (
    SELECT usuario_id FROM
    inscripcion
    group by usuario_id
    HAVING count(*)>=1
)

select u.id, count(*) from persona p
INNER JOIN usuario u on p.id=u.id
INNER JOIN inscripcion ic on ic.usuario_id=u.id
GROUP by u.id
order by 2 desc

-- Ejercicio 2.
-- Lista los títulos de los cursos que tienen 3 o más tareas asignadas en alguno de sus módulos.
-- 🔸 Campos a mostrar: titulo, estado, fecha_creacion.

SELECT distinct c.titulo,c.estado,c.fecha_creacion FROM curso c
INNER JOIN modulo m on m.curso_id= c.id
WHERE m.id in(
    SELECT modulo_id from tarea
    group by modulo_id
    HAVING count(*) >= 3
)

SELECT titulo,estado,fecha_creacion FROM curso
where id in (SELECT curso_id FROM modulo
where id in (
SELECT modulo_id
FROM tarea
group by modulo_id
HAVING COUNT(*)>2)
)

-- Ejercicio 3.
-- Muestra los cursos que tienen al menos un comentario realizado
-- por un usuario que no está inscrito en ese curso.
-- 🔸 Campos a mostrar: id del curso, titulo.

SELECT DISTINCT c.curso_id, cu.titulo,c.usuario_id
FROM comentario c
INNER JOIN curso cu ON cu.id = c.curso_id
WHERE c.usuario_id NOT IN (
    SELECT i.usuario_id
    FROM inscripcion i
    WHERE i.curso_id = c.curso_id
);

-- Ejercicio 4.
-- Lista los usuarios que únicamente tienen inscripciones con estado "completado".
-- 🔸 Campos a mostrar: nombre completo, email.

SELECT concat(p.nombre,' ',p.apellido_paterno) as nombre_completo,
u.email
FROM persona p
INNER JOIN usuario u on u.id = p.id
where p.id in (SELECT usuario_id FROM inscripcion
where estado='completado'
)

-- Ejercicio 5.
-- Muestra el nombre del usuario que obtuvo la calificación más alta registrada
-- en el sistema.
-- 🔸 Campos a mostrar: nombre, apellido_paterno.

SELECT * FROM persona p
INNER JOIN usuario u on p.id=u.id
where u.id in (
    SELECT e.usuario_id FROM calificacion c
    INNER JOIN entrega e on c.entrega_id=e.id
    order by c.calificacion DESC
    LIMIT 1
)



-- Ejercicio 6.
-- Muestra los cursos que no tienen ninguna tarea registrada en sus módulos.
-- 🔸 Campos a mostrar: id del curso, titulo, estado.

select * FROM curso
where id not in(
    SELECT modulo.curso_id FROM modulo
    inner join tarea on modulo.id=tarea.modulo_id
)

-- Ejercicio 7.
-- Lista los usuarios que tienen al menos un certificado emitido pero nunca hayan realizado una entrega.
-- 🔸 Campos a mostrar: nombre, apellidos, email.

-- Ejercicio 8.
-- Muestra los cursos que tienen más de una categoría asignada.
-- 🔸 Campos a mostrar: id del curso, titulo, cantidad_de_categorias.

-- Ejercicio 9.
-- Muestra los nombres de los docentes que tienen al menos un curso con más de 3 módulos.
-- 🔸 Campos a mostrar: nombre, apellido_paterno, titulo_del_curso.

-- Ejercicio 10.
-- Lista los 10 usuarios que realizaron una entrega reciente en tareas con título que contenga la palabra 'final' o 'examen'.
-- Solo se muestra la entrega más reciente por usuario.
-- 🔸 Campos a mostrar: nombre, apellido_paterno, titulo_de_tarea, fecha_entrega.


-- Ejercicios con subconsultas en cláusula SELECT
-- Cada ejercicio incluye los campos que deben mostrarse y está pensado para usarse solo con subconsultas en el SELECT

-- Ejercicio 1.
-- Mostrar el nombre y email de cada usuario junto con el total de cursos en los que está inscrito.
-- Campos a mostrar: nombre, email, total_cursos

-- Ejercicio 2.
-- Listar el nombre completo de cada persona y mostrar su fecha de nacimiento junto con su edad (calculada con subconsulta).
-- Campos a mostrar: nombre_completo, fecha_nacimiento, edad

-- Ejercicio 3.
-- Listar los títulos de los cursos junto con la cantidad total de módulos que tiene cada uno.
-- Campos a mostrar: titulo, cantidad_modulos

-- Ejercicio 4.
-- Listar el nombre del docente de cada curso junto con la cantidad de tareas que tiene el curso.
-- Campos a mostrar: nombre_docente, apellido_paterno, titulo_curso, cantidad_tareas

-- Ejercicio 5.
-- Listar el nombre y email de cada usuario junto con la fecha de su entrega más reciente (si tiene).
-- Campos a mostrar: nombre, email, ultima_entrega
-- ========================================
-- 1. Mostrar los nombres completos de las personas que están registradas como usuarios.
-- Utiliza una subconsulta para identificar a las personas cuyo ID aparece en la tabla de usuario.
-- ========================================



-- ========================================
-- 2. Mostrar los nombres completos de las personas que tienen el rol con nombre "docente".
-- Usa una subconsulta para obtener el ID del rol 'docente' y otra para filtrar las personas con ese rol.
-- ========================================



-- ========================================
-- 3. Mostrar los usuarios con más de un rol distinto asignado históricamente.
-- Emplea una subconsulta con GROUP BY y HAVING para identificar usuarios con más de un rol.
-- ========================================



-- ========================================
-- 4. Mostrar el nombre completo de las personas que se han inscrito en al menos un curso.
-- Usa una subconsulta para encontrar personas que tengan inscripciones registradas.
-- ========================================



-- ========================================
-- 5. Mostrar los nombres de los usuarios que realizaron una entrega después de la fecha límite de la tarea.
-- Compara con una subconsulta las fechas de entrega y la fecha límite de la tarea correspondiente.
-- ========================================



-- ========================================
-- 6. Mostrar los títulos de los cursos cuyos docentes han creado más de un curso.
-- Usa una subconsulta para contar cuántos cursos ha creado cada docente y filtrar los que tienen más de uno.
-- ========================================



-- ========================================
-- 7. Mostrar los títulos de los cursos que no tienen ninguna tarea registrada.
-- Identifica cursos cuyos módulos no tienen tareas asociadas, utilizando subconsultas anidadas.
-- ========================================



-- ========================================
-- 8. Mostrar los nombres completos de los usuarios que dejaron comentarios en cursos donde no están inscritos.
-- Utiliza una subconsulta que compare la tabla de comentarios con la de inscripciones.
-- ========================================


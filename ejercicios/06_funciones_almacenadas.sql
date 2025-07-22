-- 1. Obtener nombre completo
-- Dado el ID de una persona, retornar su nombre completo.
--     Parámetro: p_id INT
--     Retorna: nombrecompleto

-- 2. Calcular edad
-- Dado el ID de una persona, retornar su edad en años.
--     Parámetro: p_id INT
--     Retorna: INT

-- 3. Obtener email de usuario
-- Dado el ID de una persona, retornar su correo electrónico.
--     Parámetro: p_id INT
--     Retorna: VARCHAR

-- 4. Contar cantidad de cursos inscritos por usuario
-- Dado el ID de usuario, contar cuántos cursos ha inscrito.
--     Parámetro: p_usuario_id INT
--     Retorna: INT


-- 5. Verificar si un curso está activo
-- Dado el ID del curso, retornar TRUE si su estado es “activo”.
--     Parámetro: p_curso_id INT
--     Retorna: BOOLEAN

-- 6. Calcular promedio de puntaje de entregas por usuario
-- Dado el ID de usuario, retornar su promedio de puntajes.
--     Parámetro: p_usuario_id INT
--     Retorna: DECIMAL

-- 7. Listar los cursos completados por un usuario
-- Dado el ID de usuario, retornar los títulos de cursos con inscripción "completado".
--     Parámetro: p_usuario_id INT
--     Retorna: TABLE(titulo)

-- 8. Obtener los cursos donde un usuario ha comentado
-- Objetivo: Dado el ID de usuario, retornar los títulos de cursos donde comentó.
--     Parámetro: p_usuario_id INT
--     Retorna: TABLE(titulo VARCHAR, fecha TIMESTAMPTZ)

-- 9. Obtener resumen de entregas de un usuario
-- Objetivo: Dado el ID del usuario, retornar la lista de tareas entregadas con su puntaje y fecha.
--     Parámetro: p_usuario_id INT
--     Retorna: TABLE(tarea TEXT, puntaje DECIMAL, fecha TIMESTAMPTZ)

-- 10. Obtener cursos con promedio de calificación mayor a un valor
-- Objetivo: Dado un valor mínimo, retornar los cursos cuyo promedio de calificación supera ese valor.
--     Parámetro: p_promedio_min DECIMAL
--     Retorna: TABLE(curso TEXT, promedio NUMERIC)


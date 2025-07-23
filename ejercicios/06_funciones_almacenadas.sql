-- 1. Obtener nombre completo
-- Dado el ID de una persona, retornar su nombre completo.
--     Parámetro: p_id INT
--     Retorna: nombrecompleto

CREATE OR REPLACE FUNCTION obtener_nombre_completo(p_id INT)
RETURNS TEXT
LANGUAGE sql
AS $$
    SELECT CONCAT(nombre, ' ', apellido_paterno, ' ', COALESCE(apellido_materno, ''))
    FROM persona
    WHERE id = p_id;
$$;

SELECT obtener_nombre_completo(1);

-- 2. Calcular edad
-- Dado el ID de una persona, retornar su edad en años.
--     Parámetro: p_id INT
--     Retorna: INT

CREATE OR REPLACE FUNCTION calcular_edad(p_id INT)
RETURNS INT
LANGUAGE sql
AS $$
    SELECT EXTRACT(YEAR FROM AGE(CURRENT_DATE, fecha_nacimiento))
    FROM persona
    WHERE id = p_id;
$$;

SELECT calcular_edad(1)
-- 3. Obtener email de usuario
-- Dado el ID de una persona, retornar su correo electrónico.
--     Parámetro: p_id INT
--     Retorna: VARCHAR

CREATE OR REPLACE FUNCTION obtener_email_usuario(p_id INT)
RETURNS TEXT
LANGUAGE sql
AS $$
    SELECT email FROM usuario WHERE id = p_id;
$$;

SELECT obtener_email_usuario(1);

-- 4. Contar cantidad de cursos inscritos por usuario
-- Dado el ID de usuario, contar cuántos cursos ha inscrito.
--     Parámetro: p_usuario_id INT
--     Retorna: INT

CREATE OR REPLACE FUNCTION cantidad_cursos_inscritos(p_usuario_id INT)
RETURNS INT
LANGUAGE sql
AS $$
    SELECT COUNT(*) FROM inscripcion WHERE usuario_id = p_usuario_id;
$$;

-- 5. Verificar si un curso está activo
-- Dado el ID del curso, retornar TRUE si su estado es “activo”.
--     Parámetro: p_curso_id INT
--     Retorna: BOOLEAN

CREATE OR REPLACE FUNCTION curso_activo(p_curso_id INT)
RETURNS BOOLEAN
LANGUAGE sql
AS $$
    SELECT estado = 'activo' FROM curso WHERE id = p_curso_id;
$$;

SELECT curso_activo(1)

-- 6. Calcular promedio de puntaje de entregas por usuario
-- Dado el ID de usuario, retornar su promedio de puntajes.
--     Parámetro: p_usuario_id INT
--     Retorna: DECIMAL

CREATE OR REPLACE FUNCTION promedio_puntaje(p_usuario_id INT)
RETURNS DECIMAL
LANGUAGE sql
AS $$
    SELECT ROUND(AVG(c.calificacion), 2)
    FROM calificacion c
    INNER JOIN entrega e ON e.id = c.entrega_id
    WHERE e.usuario_id = p_usuario_id;
$$;

-- 7. Listar los cursos completados por un usuario
-- Dado el ID de usuario, retornar los títulos de cursos con inscripción "completado".
--     Parámetro: p_usuario_id INT
--     Retorna: TABLE(titulo)

CREATE OR REPLACE FUNCTION cursos_completados(p_usuario_id INT)
RETURNS TABLE(titulo_curso TEXT)
LANGUAGE sql
AS $$
    SELECT c.titulo
    FROM inscripcion i
    INNER JOIN curso c ON c.id = i.curso_id
    WHERE i.estado = 'completado' AND i.usuario_id = p_usuario_id;
$$;

-- 8. Obtener los cursos donde un usuario ha comentado
-- Objetivo: Dado el ID de usuario, retornar los títulos de cursos donde comentó.
--     Parámetro: p_usuario_id INT
--     Retorna: TABLE(titulo VARCHAR, fecha TIMESTAMPTZ)

CREATE OR REPLACE FUNCTION cursos_comentados(p_usuario_id INT)
RETURNS TABLE(titulo TEXT, fecha TIMESTAMPTZ)
LANGUAGE sql
AS $$
    SELECT c.titulo, cm.fecha
    FROM comentario cm
    INNER JOIN curso c ON c.id = cm.curso_id
    WHERE cm.usuario_id = p_usuario_id;
$$;


-- 9. Obtener resumen de entregas de un usuario
-- Objetivo: Dado el ID del usuario, retornar la lista de tareas entregadas con su puntaje y fecha.
--     Parámetro: p_usuario_id INT
--     Retorna: TABLE(tarea TEXT, puntaje DECIMAL, fecha TIMESTAMPTZ)

CREATE OR REPLACE FUNCTION resumen_entregas(p_usuario_id INT)
RETURNS TABLE(tarea TEXT, puntaje DECIMAL, fecha TIMESTAMPTZ)
LANGUAGE sql
AS $$
    SELECT t.nombre, e.puntaje, e.fecha_entrega
    FROM entrega e
    INNER JOIN tarea t ON t.id = e.tarea_id
    WHERE e.usuario_id = p_usuario_id;
$$;

-- 10. Obtener cursos con promedio de calificación mayor a un valor
-- Objetivo: Dado un valor mínimo, retornar los cursos cuyo promedio de calificación supera ese valor.
--     Parámetro: p_promedio_min DECIMAL
--     Retorna: TABLE(curso TEXT, promedio NUMERIC)

CREATE OR REPLACE FUNCTION cursos_con_promedio_mayor(p_promedio_min DECIMAL)
RETURNS TABLE(curso TEXT, promedio NUMERIC)
LANGUAGE sql
AS $$
    SELECT c.titulo, AVG(cal.calificacion) as promedio
    FROM curso c
    INNER JOIN inscripcion i ON i.curso_id = c.id
    INNER JOIN entrega e ON e.usuario_id = i.usuario_id AND e.curso_id = c.id
    INNER JOIN calificacion cal ON cal.entrega_id = e.id
    GROUP BY c.titulo
    HAVING AVG(cal.calificacion) > p_promedio_min;
$$;
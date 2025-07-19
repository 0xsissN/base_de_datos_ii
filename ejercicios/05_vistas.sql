-- ¿Qué es una vista?
-- Una vista es una tabla virtual basada en el resultado de una consulta SQL. 
-- No almacena datos por sí misma, pero se comporta como una tabla a la hora de consultarla.

-- Ventajas de las vistas:

-- Simplifican consultas complejas.
-- Mejoran la seguridad (se puede dar acceso a vistas en lugar de a tablas reales).
-- Facilitan la reutilización de lógica SQL.

-- Limitaciones:

-- No siempre se pueden actualizar (especialmente si usan GROUP BY, JOIN, etc.).
-- Puede tener impacto en el rendimiento si se abusa de ellas con consultas pesadas.

-- Ejemplo 1: Vista de usuarios con su nombre completo y correo electrónico.

CREATE VIEW vista_usuarios AS
SELECT
    p.id AS persona_id,
    CONCAT(p.nombre,' ',p.apellido_paterno,' ',p.apellido_materno) AS nombre_completo,
    u.email,
    u.nombre_usuario
FROM persona p
JOIN usuario u ON p.id = u.id;

SELECT * FROM vista_usuarios;

-- Práctica
-- Ejercicio 1: Mostrar los estudiantes que no completaron un curso (cancelado o inscrito).
-- Nombre completo
-- Email
-- Fecha formato(DD/MM/AAAA)
-- Estado inscripcion

-- Ejercicio 2: Crear una vista vista_entregas_destacadas que incluya:
--     Nombre completo del estudiante
--     Título de la tarea
--     Puntaje
--     Comentario
--     Fecha de entrega

-- Solo se incluirán entregas que tengan puntaje mayor a 85 o un comentario no nulo.
-- Ordenar por fecha de entrega descendente.

-- Ejercicio 3:Crear la vista vista_promedio_curso que muestre:
--     Curso
--     Promedio de calificaciones
--     Número total de calificaciones

-- Solo mostrar cursos con promedio mayor a 85 y al menos 3 calificaciones.




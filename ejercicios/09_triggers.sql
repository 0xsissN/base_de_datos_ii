-- ESTRUCTURA BASE

CREATE OR REPLACE FUNCTION nombre_funcion()
RETURNS trigger AS $$
BEGIN
  -- lógica
  RETURN NEW; -- o OLD 
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER nombre_trigger
AFTER INSERT ON tabla
FOR EACH ROW
EXECUTE FUNCTION nombre_funcion();

-- SELECT * from entrega
-- SELECT 
--     p.id AS persona_id,
--     p.nombre,
--     p.apellido_paterno,
--     p.apellido_materno,
--     c.titulo AS curso,
--     t.id AS tarea_id,
--     t.titulo AS tarea
-- FROM inscripcion i
-- JOIN usuario u ON u.id = i.usuario_id
-- JOIN persona p ON p.id = u.id
-- JOIN curso c ON c.id = i.curso_id
-- JOIN modulo m ON m.curso_id = c.id
-- JOIN tarea t ON t.modulo_id = m.id
-- WHERE c.id = 1
--   AND NOT EXISTS (
--       SELECT 1
--       FROM entrega e
--       WHERE e.tarea_id = t.id
--         AND e.usuario_id = i.usuario_id
--   )
-- ORDER BY p.id, t.id;


-- Ejemplo: Registrar auditoría cuando se crea una entrega
-- Paso 1: Crear tabla de auditoría

-- Paso 2: Crear función

-- Ejercicio 1. Crea un trigger que registre en una tabla de log cada vez que se inserta un nuevo comentario en la tabla comentario. 
-- Debe registrar el ID del comentario, el ID del curso, el usuario que comentó y la fecha/hora.

-- Ejercicio 2.Desarrolla un trigger que impida actualizar la calificación de una entrega si ya ha sido calificada previamente.
-- Si alguien intenta hacerlo, debe lanzar una excepción.


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

CREATE TABLE log_entrega(
    id serial PRIMARY KEY,
    usuario_id int,
    tarea_id int,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    accion VARCHAR(20)    
)

CREATE OR REPLACE FUNCTION registrar_entrega()
RETURNS TRIGGER
LANGUAGE plpgsql
as $$
BEGIN
    INSERT INTO log_entrega(usuario_id,tarea_id,accion)
    VALUES(NEW.usuario_id,NEW.tarea_id,'insert');
    RETURN NEW;
END;
$$

CREATE TRIGGER trigger_log_entrega
AFTER INSERT ON entrega
FOR EACH ROW
EXECUTE FUNCTION registrar_entrega()

-- Paso 2: Crear función

-- Ejercicio 1. Crea un trigger que registre en una tabla de log cada vez que se inserta un nuevo comentario en la tabla comentario. 
-- Debe registrar el ID del comentario, el ID del curso, el usuario que comentó y la fecha/hora.

CREATE TABLE log_comentario (
    id SERIAL PRIMARY KEY,
    comentario_id INT,
    curso_id INT,
    usuario_id INT,
    fecha_registro TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);

CREATE OR REPLACE FUNCTION registrar_log_comentario()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO log_comentario(comentario_id, curso_id, usuario_id)
    VALUES (NEW.id, NEW.curso_id, NEW.usuario_id);
    RETURN NEW;
END;
$$;

CREATE TRIGGER trigger_log_comentario
AFTER INSERT ON comentario
FOR EACH ROW
EXECUTE FUNCTION registrar_log_comentario();

-- Ejercicio 2.Desarrolla un trigger que impida actualizar la calificación de una entrega si ya ha sido calificada previamente.
-- Si alguien intenta hacerlo, debe lanzar una excepción.

CREATE OR REPLACE FUNCTION prevenir_actualizacion_calificacion()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    
    IF OLD.calificacion IS NOT NULL THEN
        RAISE EXCEPTION 'No se permite modificar una calificación ya registrada para esta entrega.';
    END IF;

    RETURN NEW;
END;
$$;

CREATE TRIGGER trigger_prevenir_actualizacion_calificacion
BEFORE UPDATE ON calificacion
FOR EACH ROW
EXECUTE FUNCTION prevenir_actualizacion_calificacion();



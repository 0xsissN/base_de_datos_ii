-- 1. Crea un procedimiento almacenado que permita cambiar el estado de un curso a “activo” o “inactivo” según su identificador.

SELECT setval('persona_id_seq', COALESCE((SELECT MAX(id) FROM persona), 1), true);

CREATE OR REPLACE PROCEDURE cambiar_estado_curso(
    p_id INT,
    p_nuevo_estado VARCHAR
)
LANGUAGE plpgsql
as $$
BEGIN
    UPDATE CURSO
    SET estado=p_nuevo_estado
    where id=p_curso_id;
END;
$$;

-- 2. Crea un procedimiento almacenado que permita registrar a un nuevo usuario en el sistema. 
-- Debe insertar los datos en las tablas persona, usuario y usuario_rol, asignándole un rol específico.


CREATE OR REPLACE PROCEDURE crear_usuario(
    p_nombre VARCHAR,
    p_ci VARCHAR,
    p_paterno VARCHAR,
    p_materno VARCHAR,
    p_fecha_nac DATE,
    p_email VARCHAR,
    p_nombre_usu VARCHAR,
    p_contrasena VARCHAR,
    p_rol_id INT
)
LANGUAGE plpgsql
as $$ 
DECLARE
    aux_id_persona int;
BEGIN
    INSERT INTO persona(nombre,ci,apellido_paterno,apellido_materno,fecha_nacimiento)
    VALUES (p_nombre, p_ci, p_paterno,p_materno , p_fecha_nac)
    RETURNING id INTO aux_id_persona;

    INSERT INTO usuario(id,email,nombre_usuario,contrasena)
    VALUES (aux_id_persona,p_email,p_nombre_usu,p_contrasena);

    INSERT INTO usuario_rol(usuario_id,rol_id)
    VALUES(aux_id_persona,p_rol_id);
END;
$$

call registrar_usuario('ernesto','torres','rodriguez',
'ddd','2020-10-10','etorres@gmail.com','etorres','12346',3)

-- 3. Crea un procedimiento almacenado que permita crear una nueva categoría, 
-- verificando previamente que no exista una con el mismo nombre (sin distinguir mayúsculas o minúsculas).

SELECT setval('categoria_id_seq', COALESCE((SELECT MAX(id) FROM categoria), 1), true);

CREATE OR REPLACE PROCEDURE crear_categoria(
    p_nombre VARCHAR
)
LANGUAGE plpgsql
as $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM categoria where nombre ILIKE p_nombre
    ) THEN
        RAISE NOTICE 'Categoría Registrada';
    ELSE
        INSERT INTO categoria(nombre) VALUES(p_nombre);
    end if;
end;
$$


-- 4. Crea un procedimiento llamado inscribir_usuario_en_curso que permita registrar la inscripción de un usuario a un curso.
-- Antes de insertar, debe verificar que ese usuario no esté ya inscrito en dicho curso.


CREATE OR REPLACE PROCEDURE inscribir_usuario_en_curso(
    p_usuario_id INT,
    p_curso_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM inscripcion
        WHERE usuario_id=p_usuario_id AND curso_id=p_curso_id
    ) THEN 
        RAISE NOTICE 'Es usuario ya esta registrado al curso';
    ELSE
        INSERT INTO inscripcion(usuario_id,curso_id) 
        VALUES(p_usuario_id,p_curso_id);
    END IF;
END;
$$

-- 5. Crea un procedimiento llamado registrar_comentario que permita insertar un comentario de un usuario en un curso.
-- Antes de registrar el comentario, se debe validar que el usuario esté inscrito en ese curso.

CREATE PROCEDURE registrar_comentario(
    p_usuario_id INT,
    p_curso_id INT,
    p_comentario TEXT 
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF EXISTS

-- 6. Crea un procedimiento almacenado que asocie una categoría a un curso determinado, 
-- evitando la duplicación si ya existe esa asignación.

CREATE OR REPLACE PROCEDURE asignar_categoria_a_curso(
    p_curso_id INT,
    p_categoria_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM curso_categoria 
        WHERE curso_id = p_curso_id AND categoria_id = p_categoria_id
    ) THEN
        RAISE NOTICE 'Categoría ya asignada al curso.';
    ELSE
        INSERT INTO curso_categoria(curso_id, categoria_id)
        VALUES (p_curso_id, p_categoria_id);
    END IF;
END;
$$;

-- 7. Crea un procedimiento almacenado que permita agregar un módulo a un curso, 
-- verificando que no se supere un límite de 10 módulos por curso.

CREATE OR REPLACE PROCEDURE agregar_modulo_a_curso(
    p_curso_id INT,
    p_titulo VARCHAR,
    p_descripcion VARCHAR,
    p_orden INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_total INT;
BEGIN
    SELECT COUNT(*) INTO v_total FROM modulo WHERE curso_id = p_curso_id;

    IF v_total >= 10 THEN
        RAISE NOTICE 'Este curso ya tiene 10 módulos.';
    ELSE
        INSERT INTO modulo(curso_id, titulo, descripcion, orden)
        VALUES (p_curso_id, p_titulo, p_descripcion, p_orden);
    END IF;
END;
$$;

-- 8. Crea un procedimiento llamado emitir_certificado que registre un nuevo certificado para un usuario en un curso.
-- Debe validar previamente que el usuario tenga una inscripción con estado 'completado' en ese curso.

Nota: Si no se encuentra una inscripción con estado 'completado' y sin certificado, 
actualiza manualmente una inscripción a 'completado' para poder ejecutar el ejercicio.

CREATE OR REPLACE PROCEDURE emitir_certificado(
    p_usuario_id INT,
    p_curso_id INT,
    p_descripcion VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM inscripcion
        WHERE usuario_id = p_usuario_id AND curso_id = p_curso_id AND estado = 'completado'
    ) THEN
        INSERT INTO certificado(usuario_id, curso_id, descripcion)
        VALUES (p_usuario_id, p_curso_id, p_descripcion);
    ELSE
        RAISE NOTICE 'El curso no ha sido completado por el usuario.';
    END IF;
END;
$$;

-- 9. Crea un procedimiento llamado eliminar_entrega que reciba el ID de una entrega. Si tiene una calificación asociada, 
-- primero debe eliminarla y luego borrar la entrega.

Parámetro: p_entrega_id

CREATE OR REPLACE PROCEDURE eliminar_entrega(p_entrega_id INT)
LANGUAGE plpgsql
AS $$
BEGIN

    DELETE FROM calificacion WHERE entrega_id = p_entrega_id;

    DELETE FROM entrega WHERE id = p_entrega_id;
END;
$$;

-- 10. Eliminar usuario si no tiene entregas en un curso específico

-- Crea un procedimiento llamado eliminar_usuario_en_curso que reciba el ID de un usuario y de un curso. Solo debe eliminar al usuario si:

--     No tiene entregas en ese curso.
--     No está inscrito en ese curso con estado distinto de 'cancelado'.

-- Parámetros esperados:

--     p_usuario_id INT
--     p_curso_id INT

CREATE OR REPLACE PROCEDURE eliminar_usuario_en_curso(
    p_usuario_id INT,
    p_curso_id INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_tiene_entregas BOOLEAN;
    v_inscripcion_activa BOOLEAN;
BEGIN
    
    SELECT EXISTS (
        SELECT 1
        FROM entrega e
        JOIN tarea t ON t.id = e.tarea_id
        JOIN modulo m ON m.id = t.modulo_id
        WHERE e.usuario_id = p_usuario_id AND m.curso_id = p_curso_id
    ) INTO v_tiene_entregas;

  
    SELECT EXISTS (
        SELECT 1
        FROM inscripcion
        WHERE usuario_id = p_usuario_id AND curso_id = p_curso_id AND estado <> 'cancelado'
    ) INTO v_inscripcion_activa;

    IF v_tiene_entregas THEN
        RAISE NOTICE 'No se puede eliminar: el usuario tiene entregas en este curso.';

    ELSIF v_inscripcion_activa THEN
        RAISE NOTICE 'No se puede eliminar: el usuario tiene una inscripción activa en este curso.';

    ELSE
       
        DELETE FROM inscripcion WHERE usuario_id = p_usuario_id AND curso_id = p_curso_id;

        DELETE FROM usuario_rol WHERE usuario_id = p_usuario_id;

        DELETE FROM usuario WHERE id = p_usuario_id;

        DELETE FROM persona WHERE id = p_usuario_id;

        RAISE NOTICE 'Usuario eliminado correctamente.';
    END IF;
END;
$$;

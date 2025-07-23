-- 1. Crea un procedimiento almacenado que permita cambiar el estado de un curso a “activo” o “inactivo” según su identificador.

-- 2. Crea un procedimiento almacenado que permita registrar a un nuevo usuario en el sistema. 
-- Debe insertar los datos en las tablas persona, usuario y usuario_rol, asignándole un rol específico.

-- 3. Crea un procedimiento almacenado que permita crear una nueva categoría, 
-- verificando previamente que no exista una con el mismo nombre (sin distinguir mayúsculas o minúsculas).

-- 4. Crea un procedimiento llamado inscribir_usuario_en_curso que permita registrar la inscripción de un usuario a un curso.
-- Antes de insertar, debe verificar que ese usuario no esté ya inscrito en dicho curso.

-- 5. Crea un procedimiento llamado registrar_comentario que permita insertar un comentario de un usuario en un curso.
-- Antes de registrar el comentario, se debe validar que el usuario esté inscrito en ese curso.

-- 6. Crea un procedimiento almacenado que asocie una categoría a un curso determinado, 
-- evitando la duplicación si ya existe esa asignación.

-- 7. Crea un procedimiento almacenado que permita agregar un módulo a un curso, 
-- verificando que no se supere un límite de 10 módulos por curso.

-- 8. Crea un procedimiento llamado emitir_certificado que registre un nuevo certificado para un usuario en un curso.
-- Debe validar previamente que el usuario tenga una inscripción con estado 'completado' en ese curso.
    -- Nota: Si no se encuentra una inscripción con estado 'completado' y sin certificado, 
    -- actualiza manualmente una inscripción a 'completado' para poder ejecutar el ejercicio.

-- 9. Crea un procedimiento llamado eliminar_entrega que reciba el ID de una entrega. Si tiene una calificación asociada, 
-- primero debe eliminarla y luego borrar la entrega.

-- 10. Eliminar usuario si no tiene entregas en un curso específico
-- Crea un procedimiento llamado eliminar_usuario_en_curso que reciba el ID de un usuario y de un curso. Solo debe eliminar al usuario si:
--     No tiene entregas en ese curso.
--     No está inscrito en ese curso con estado distinto de 'cancelado'.

-- Parámetros esperados:
--     p_usuario_id INT
--     p_curso_id INT


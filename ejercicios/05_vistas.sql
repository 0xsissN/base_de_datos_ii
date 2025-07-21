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

-- Práctica
-- Ejercicio 1: Mostrar los estudiantes que no completaron un curso (cancelado o inscrito).
-- Nombre completo
-- Email
-- Fecha formato(DD/MM/AAAA)
-- Estado inscripcion

-- Ejercicio 2: Crear una vista vista_entregas_destacadas
-- Solo se incluirán entregas que tengan puntaje mayor a 85 o un comentario no nulo.
-- Ordenar por fecha de entrega descendente que incluya:

--     Nombre completo del estudiante
--     Título de la tarea
--     Puntaje
--     Comentario
--     Fecha de entrega

-- Ejercicio 3:Crear la vista vista_promedio_curso donce solo se seleccionara
-- los cursos donde la descripción contenga la palara "dato" y que muestre:
--     Curso (Título)
--     Descripción
--     Docente
--     Promedio de calificaciones
--     Número total de calificaciones

-- Ejercicio 4: Crear una vista vista_inscritos_estado que muestre los estudiantes inscritos en un curso
-- y contar el número de cursos por estado de inscripción. Tomar en cuenta que los estudiantes solo se pueden 
-- listar una vez.
-- Ejemplo:
-- Estudiante  | Inscrito | Cancelado | Completado
-- Juan Pérez  | 5        | 0         | 3







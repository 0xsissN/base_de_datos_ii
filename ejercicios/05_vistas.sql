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






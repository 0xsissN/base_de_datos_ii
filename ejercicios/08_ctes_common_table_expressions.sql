
Ejercicio 1: Entregas destacadas con CTE
Mostrar los estudiantes que hayan realizado alguna entrega con puntaje menor a 51.
Incluir su nombre, apellido y el puntaje obtenido. Ordenar por puntaje.

WITH entregas_destacadas AS (
  SELECT e.usuario_id, e.puntaje
  FROM entrega e
  WHERE e.puntaje <51
)
SELECT p.nombre, p.apellido_paterno, ed.puntaje
FROM entregas_destacadas ed
JOIN usuario u ON u.id = ed.usuario_id
JOIN persona p ON p.id = u.id
ORDER BY ed.puntaje DESC
LIMIT 10;

Ejercicio 2: Promedio general de puntajes por curso
Listar los 10 cursos con mejor desempeño general según el promedio de puntajes obtenidos en todas sus tareas entregadas.
Mostrar:
Nombre del curso
Cantidad total de entregas
Promedio de puntajes (ordenado de mayor a menor)

WITH curso_puntajes AS (
  SELECT c.id AS curso_id, c.titulo,count(e.id), AVG(e.puntaje) AS promedio
  FROM curso c
  JOIN modulo m ON m.curso_id = c.id
  JOIN tarea t ON t.modulo_id = m.id
  JOIN entrega e ON e.tarea_id = t.id
  GROUP BY c.id
)
SELECT * FROM curso_puntajes
ORDER BY promedio desc
LIMIT 10

Ejercicio 3: Cursos con bajo porcentaje de finalización
Mostrar los cursos en los que más del 50% de las inscripciones no están en estado 'completado'. Incluir:

Título del curso
Total de inscriptos
Cantidad de inscripciones no completadas

WITH inscripciones_por_curso AS (
  SELECT curso_id,
         COUNT(*) AS total,
         SUM(CASE WHEN estado <> 'completado' THEN 1 ELSE 0 END) AS no_completados
  FROM inscripcion
  GROUP BY curso_id
)
SELECT c.titulo, ipc.total, ipc.no_completados
FROM inscripciones_por_curso ipc
JOIN curso c ON c.id = ipc.curso_id
WHERE ipc.no_completados::DECIMAL / ipc.total > 0.5;

Ejercicio 4: Usuarios sin entregas
Listar a los usuarios que están inscritos en cursos con tareas asignadas, pero que no han realizado ninguna entrega. Mostrar:
Nombre y apellido del usuario

WITH usuarios_con_tareas AS (
  SELECT DISTINCT i.usuario_id, t.id AS tarea_id
  FROM inscripcion i
  JOIN curso c ON c.id = i.curso_id
  JOIN modulo m ON m.curso_id = c.id
  JOIN tarea t ON t.modulo_id = m.id
),
usuarios_sin_entregas AS (
  SELECT ut.usuario_id
  FROM usuarios_con_tareas ut
  LEFT JOIN entrega e ON e.usuario_id = ut.usuario_id AND e.tarea_id = ut.tarea_id
  WHERE e.id IS NULL
)
SELECT DISTINCT p.nombre, p.apellido_paterno
FROM usuarios_sin_entregas ue
JOIN usuario u ON u.id = ue.usuario_id
JOIN persona p ON p.id = u.id;

Ejercicio 5: Usuarios con porcentaje de tareas calificadas
Consigna:
Listar los usuarios que hayan realizado al menos 8 entregas, mostrando el porcentaje de esas entregas que han sido calificadas. 

Mostrar:
Nombre y apellido del usuario
Total de entregas realizadas
Total de entregas calificadas
Porcentaje de entregas calificadas (ordenado de mayor a menor)

WITH total_entregas AS (
  SELECT usuario_id, COUNT(*) AS total
  FROM entrega
  GROUP BY usuario_id
),
calificadas AS (
  SELECT e.usuario_id, COUNT(c.id) AS calificadas
  FROM entrega e
  JOIN calificacion c ON c.entrega_id = e.id
  GROUP BY e.usuario_id
)
SELECT p.nombre, p.apellido_paterno,
       t.total, c.calificadas,
       ROUND(c.calificadas::DECIMAL / t.total * 100, 2) AS porcentaje
FROM total_entregas t
JOIN calificadas c ON t.usuario_id = c.usuario_id
JOIN usuario u ON u.id = t.usuario_id
JOIN persona p ON p.id = u.id
WHERE t.total >= 8
ORDER BY porcentaje DESC;

Ejercicio 6: Cursos con mejor rendimiento que el promedio general
Mostrar los cursos cuyo promedio de puntajes en todas las entregas supera el promedio general del sistema. 
Incluir:
Título del curso
Promedio de puntajes del curso

WITH promedio_global AS (
  SELECT AVG(puntaje) AS promedio FROM entrega
),
promedio_por_curso AS (
  SELECT c.id AS curso_id, AVG(e.puntaje) AS promedio
  FROM curso c
  JOIN modulo m ON m.curso_id = c.id
  JOIN tarea t ON t.modulo_id = m.id
  JOIN entrega e ON e.tarea_id = t.id
  GROUP BY c.id
)
SELECT c.titulo, ppc.promedio
FROM promedio_por_curso ppc, promedio_global pg
JOIN curso c ON c.id = ppc.curso_id
WHERE ppc.promedio > pg.promedio;

Ejercicio 7: Última tarea entregada por estudiante y curso
Por cada usuario en cada curso en el que haya participado, mostrar la información de la última tarea entregada, incluyendo:

Nombre del estudiante
Título del curso
Título de la tarea
Fecha de entrega
Puntaje obtenido

WITH entregas_usuario_curso AS (
  SELECT e.usuario_id, c.id AS curso_id, e.tarea_id, e.fecha_entrega, e.puntaje
  FROM entrega e
  JOIN tarea t ON t.id = e.tarea_id
  JOIN modulo m ON m.id = t.modulo_id
  JOIN curso c ON c.id = m.curso_id
),
ultima_entrega AS (
  SELECT usuario_id, curso_id, MAX(fecha_entrega) AS fecha_ultima
  FROM entregas_usuario_curso
  GROUP BY usuario_id, curso_id
)
SELECT p.nombre, p.apellido_paterno, c.titulo, t.titulo AS tarea, euc.fecha_entrega, euc.puntaje
FROM ultima_entrega ue
JOIN entregas_usuario_curso euc 
  ON ue.usuario_id = euc.usuario_id 
 AND ue.curso_id = euc.curso_id 
 AND ue.fecha_ultima = euc.fecha_entrega
JOIN tarea t ON t.id = euc.tarea_id
JOIN curso c ON c.id = euc.curso_id
JOIN usuario u ON u.id = euc.usuario_id
JOIN persona p ON p.id = u.id;




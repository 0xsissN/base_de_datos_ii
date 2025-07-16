--RESOLUCIÓN

2.	Mostrar los animales adoptados que tienen al menos una vacuna registrada y también han tenido seguimiento, incluyendo:
•	Nombre del animal
•	Especie
•	Nombre del adoptante
•	Vacuna aplicada
•	Persona que realizó el último seguimiento

SELECT 
  a.nombre AS nombre_animal,
  a.especie,
  ad.nombre AS nombre_adoptante,
  v.nombre AS vacuna,
  s.realizado_por
FROM animal a
INNER JOIN adopcion d ON a.id = d.id_animal
INNER JOIN adoptante ad ON ad.id = d.id_adoptante
INNER JOIN animal_vacuna av ON a.id = av.id_animal
INNER JOIN vacuna v ON av.id_vacuna = v.id
INNER JOIN seguimiento s ON a.id = s.id_animal;


3.	Listar los refugios donde hay animales enfermos que ya fueron vacunados y todavía están en el refugio. Mostrar: (tomar en cuenta el estado del animal)
•	Refugio
•	Nombre del Animal
•	Enfermedad
•	Vacuna aplicada

SELECT 
  r.nombre AS refugio,
  a.nombre AS nombre_animal,
  e.nombre AS enfermedad,
  v.nombre AS vacuna
FROM refugio r
INNER JOIN animal a ON r.id = a.id_refugio
INNER JOIN animal_enfermedad ae ON a.id = ae.id_animal
INNER JOIN enfermedad e ON ae.id_enfermedad = e.id
INNER JOIN animal_vacuna av ON a.id = av.id_animal
INNER JOIN vacuna v ON av.id_vacuna = v.id
WHERE a.estado = 'en refugio';

4.	Cuente la cantidad de animales adoptados por cada adoptante, asegurando que los animales tengan al menos una vacuna registrada y un seguimiento realizado.
•	Nombre del adoptante
•	Cantidad de animales adoptados con vacunas y seguimiento

SELECT 
  ad.nombre,
  COUNT(a.id) AS cantidad_animales
FROM adoptante ad
INNER JOIN adopcion d ON ad.id = d.id_adoptante
INNER JOIN animal a ON a.id = d.id_animal
INNER JOIN animal_vacuna av ON a.id = av.id_animal
INNER JOIN seguimiento s ON a.id = s.id_animal
GROUP BY ad.nombre;

5.	Listar todos los seguimientos realizados a animales en tratamiento que también tengan vacunas aplicadas y enfermedades registradas. Mostrar:
•	Nombre del Animal
•	Fecha del seguimiento
•	Persona que realizó
•	Vacuna
•	Enfermedad

SELECT 
  a.nombre AS nombre_animal,
  s.fecha,
  s.realizado_por,
  v.nombre AS vacuna,
  e.nombre AS enfermedad
FROM animal a
INNER JOIN seguimiento s ON a.id = s.id_animal
INNER JOIN animal_vacuna av ON a.id = av.id_animal
INNER JOIN vacuna v ON av.id_vacuna = v.id
INNER JOIN animal_enfermedad ae ON a.id = ae.id_animal
INNER JOIN enfermedad e ON ae.id_enfermedad = e.id
WHERE a.estado = 'en tratamiento';

6.	Mostrar el número total de vacunas aplicadas animales agrupado por:
•	Especie
•	Estado del animal
•	Refugio
Nota: Incluyendo únicamente aquellas combinaciones que tengan 2 o más vacunas registradas
SELECT 
  a.especie,
  a.estado,
  r.nombre AS refugio,
  COUNT(av.id) AS total_vacunas
FROM animal a
INNER JOIN refugio r ON a.id_refugio = r.id
INNER JOIN animal_vacuna av ON a.id = av.id_animal
GROUP BY a.especie, a.estado, r.nombre
HAVING COUNT(av.id) >= 2;

7 - Listar los animales que hayan recibido una vacuna dentro de un rango de fechas específico, considerando la fecha de aplicación como el criterio para el rango.
 •	Nombre de animal
 •  Vacuna
 •	fecha aplicación
SELECT 
  a.nombre AS nombre_animal,
  v.nombre AS vacuna,
  av.fecha_aplicacion
FROM animal a
INNER JOIN animal_vacuna av ON a.id = av.id_animal
INNER JOIN vacuna v ON av.id_vacuna = v.id
WHERE 
  av.fecha_aplicacion BETWEEN '2023-01-01' AND '2025-12-31';

9.	Mostrar todos los animales reportados por algún problema, que además tengan registros de enfermedades y vacunas. Mostrar:
•	Nombre del animal
•	Tipo de reporte
•	Enfermedad
•	Vacuna aplicada

SELECT 
  a.nombre AS nombre_animal,
  r.tipo AS tipo_reporte,
  e.nombre AS enfermedad,
  v.nombre AS vacuna
FROM animal a
INNER JOIN reporte r ON a.id = r.id_animal
INNER JOIN animal_enfermedad ae ON a.id = ae.id_animal
INNER JOIN enfermedad e ON ae.id_enfermedad = e.id
INNER JOIN animal_vacuna av ON a.id = av.id_animal
INNER JOIN vacuna v ON av.id_vacuna = v.id;

10.	Mostrar los nombres de los adoptantes, los nombres de los animales que adoptaron y el refugio de origen, únicamente en los casos en que el animal adoptado tenga antecedentes médicos completos, es decir:
•	Al menos una enfermedad registrada
•	Al menos una vacuna aplicada
•	Al menos un seguimiento realizado

SELECT distinct
  ad.nombre AS nombre_adoptante,
  a.nombre AS nombre_animal,
  r.nombre AS refugio
FROM adoptante ad
INNER JOIN adopcion d ON ad.id = d.id_adoptante
INNER JOIN animal a ON d.id_animal = a.id
INNER JOIN refugio r ON a.id_refugio = r.id
INNER JOIN animal_enfermedad ae ON a.id = ae.id_animal
INNER JOIN animal_vacuna av ON a.id = av.id_animal
INNER JOIN seguimiento s ON a.id = s.id_animal;



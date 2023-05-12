/*
Ejercicios para Consultas en SQL CON LA DB ESCUELAS (tarea MySQL 2)
SINTAXIS BÁSICA: SELECT…FROM + USO DE WHERE, AND, OR, BETWEEN
Base de datos: escuela

1) Seleccionar todos los datos de la tabla alumnos:  */ 
-- SELECT * FROM alumnos;
# 2) Seleccionar solamente el legajo y el nombre de los alumnos:
-- SELECT legajo, nombre FROM alumnos; 

# 3) Mostrar todos los datos de aquellos alumnos aprobados (con notas mayores o iguales a 7)
-- SELECT * FROM alumnos WHERE nota >= 7;

# 4) Mostrar el id y el nombre de aquellas escuelas cuya capacidad sea inferior a 200 (no mostrar la columna capacidad).
-- SELECT id, nombre FROM escuelas WHERE capacidad < 200;

# 5) Mostrar el nombre y la nota de aquellos alumnos cuya nota se encuentre entre 8 y 10
-- SELECT nombre, nota FROM alumnos WHERE nota BETWEEN 8 AND 10;

# 6) Repetir el ejercicio anterior, utilizando BETWEEN
-- SELECT nombre, nota FROM alumnos WHERE nota BETWEEN 8 AND 10;

# 7) Mostrar el nombre, la localidad y la provincia de aquellas escuelas situadas en Buenos Aires o Jujuy
# SINTAXIS BÁSICA: SELECT…FROM + USO DE LIKE, NOT LIKE Y %
-- SELECT nombre, localidad, provincia FROM escuelas WHERE provincia LIKE 'Buenos Aires' OR provincia LIKE 'Jujuy';

# 8) Mostrar todos los datos de los alumnos llamados Pietra González
-- SELECT * FROM alumnos WHERE nombre LIKE 'Pietra González';

# 9) Repetir el ejercicio anterior, pero con aquellos que no se llamen Pietra González
-- SELECT * FROM alumnos WHERE nombre NOT LIKE 'Pietra González';

# 10) Mostrar todos los datos de los alumnos cuyo nombre comience con R
-- SELECT * FROM alumnos WHERE nombre LIKE 'R%';

# 11) Mostrar todos los datos de los alumnos cuyo nombre termine con Z
-- SELECT * FROM alumnos WHERE nombre LIKE '%Z';

# 12) Mostrar todos los datos de los alumnos cuyo nombre contenga una M
-- SELECT * FROM alumnos WHERE nombre LIKE '%M%'; 

# USOS DE JOIN Y ALIAS PARA TABLAS Y CAMPOS
# 13) Mostrar el legajo, el nombre del alumno y el nombre de la escuela de todos los alumnos
-- SELECT a.legajo, a.nombre, e.nombre FROM alumnos a INNER JOIN escuelas e ON a.id_escuela = e.id;

# 14) Modificar el ejercicio anterior utilizando alias de tablas y alias de columnas de modo tal que los datos se muestren de esta manera:
-- SELECT a.legajo AS "N° de legajo", a.nombre AS "Nombre del alumno", e.nombre AS "Institución a la pertenece" FROM alumnos a INNER JOIN escuelas e ON a.id_escuela = e.id;
-- NEXT WEEK

# 15) Mostrar todos los alumnos, tengan o no escuela asignada.
-- SELECT a.legajo AS "N° de legajo", a.nombre AS "Nombre del alumno", e.nombre AS "Institución a la pertenece" FROM alumnos a LEFT JOIN escuelas e ON a.id_escuela = e.id;

# 16) Mostrar todas las escuelas con el nombre de cada alumno (aunque no tengan escuela asignada).
-- SELECT a.legajo AS "N° de legajo", a.nombre AS "Nombre del alumno", e.nombre AS "Institución a la pertenece" FROM alumnos a RIGHT JOIN escuelas e ON a.id_escuela = e.id;
# USO DE IS NULL / IS NOT NULL

# 17) Mostrar todos los datos de los alumnos que tengan notas.
-- SELECT * FROM alumnos WHERE nota IS NOT NULL;

# 18) Mostrar todos los datos de los alumnos que no tengan notas.
-- SELECT * FROM alumnos WHERE nota IS NULL;
# ALTER TABLE

# 19) Realizar lo siguiente:
  # a) Agregar a través de Alter Table una en la tabla escuelas columna llamada “Partido”, a la derecha de Localidad con una cadena vacía como valor por defecto (armar la sentencia a través de Alter Table y ejecutar desde la consulta).
  -- ALTER TABLE escuelas ADD partido VARCHAR(255) AFTER localidad;

  # b) Ejecutar una consulta donde se vean todos los campos para confirmar que se ha agregado el campo “partido”.
  -- SELECT * FROM escuelas;

  # c) Eliminar esa columna utilizando Alter Table, no es necesario ejecutarlo desde la consulta.
  -- ALTER TABLE escuelas DROP partido;

# LIMIT Y ORDER BY

# 22) Obtener un ranking de las primeras 3 escuelas de mayor capacidad.
-- SELECT * FROM escuelas ORDER BY capacidad DESC LIMIT 3;
# FUNCIONES DE AGREGACIÓN Y AGRUPAMIENTO / USO DE IN

# 23) Contar la cantidad de alumnos de la tabla homónima. Llamar a la columna “Cantidad de alumnos”.
-- SELECT COUNT(*) AS "Cantidad de alumnos" FROM alumnos;

# 24) Repetir la consulta anterior consultando solamente cuya nota sea menor a 7.
-- SELECT COUNT(*) AS "Cantidad de alumnos" FROM alumnos WHERE nota < 7;

# 25) Obtener la capacidad total de las escuelas de la provincia de Buenos Aires
-- SELECT SUM(capacidad) AS "Capacidad total" FROM escuelas WHERE provincia = 'Buenos Aires';

# 26) Repetir el ejercicio anterior pero solamente con las escuelas de Córdoba y Jujuy
-- SELECT SUM(capacidad) AS "Capacidad total" FROM escuelas WHERE provincia IN ('Córdoba', 'Jujuy');

# 27) Obtener el promedio de notas de los alumnos aprobados con más de 7
-- SELECT AVG(nota) AS "Promedio de notas" FROM alumnos WHERE nota >= 7;

# 28) Obtener la capacidad máxima y la capacidad mínima de alumnos
-- SELECT MAX(capacidad) AS "Capacidad máxima", MIN(capacidad) AS "Capacidad mínima" FROM escuelas;

# 29) Obtener el total de capacidad de las escuelas por provincia
-- SELECT provincia, SUM(capacidad) AS "Capacidad total" FROM escuelas GROUP BY provincia;

# 30) Obtener la cantidad de alumnos por grado
-- SELECT grado, COUNT(*) AS "Cantidad de alumnos" FROM alumnos GROUP BY grado;

# DIFERENCIAS ENTRE HAVING Y WHERE

# 31) Mostrar las escuelas y la nota máxima para cada una siempre y cuando sean mayores o iguales a 7.
-- SELECT id_escuela, MAX(nota) AS "Nota máxima" FROM alumnos WHERE nota >= 7 GROUP BY id_escuela;

# SUBCONSULTAS

# 32) Mostrar la información de las escuelas cuyos alumnos tengan una nota igual a 10, utilizando una subconsulta.
-- SELECT * FROM escuelas WHERE id IN (SELECT id_escuela FROM alumnos WHERE nota = 10);

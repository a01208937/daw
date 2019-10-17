-- Importe total
SELECT SUM(Costo)
FROM Materiales M, Entregan E
WHERE M.Clave = E.Clave

-- Suma de las cantidades de entregas durante el 97
SELECT SUM(Cantidad)
FROM Entregan
WHERE Fecha BETWEEN '1997-01-01' AND '1998-01-01'

-- Para cada proveedor, obtener la razón social del proveedor, número de entregas e importe total de las entregas realizadas.
SELECT P.RazonSocial, SUM(E.Cantidad) AS Cantidad, SUM(E.Cantidad*(M.Costo)) As Importe
FROM Proveedores P, Entregan E, Materiales M
WHERE M.Clave = E.Clave AND P.RFC = E.RFC
GROUP BY P.RazonSocial

/* Por cada material obtener la clave y descripción del material, la cantidad total entregada, 
la mínima cantidad entregada, la máxima cantidad entregada, el importe total de las entregas 
de aquellos materiales en los que la cantidad promedio entregada sea mayor a 400.*/
SELECT M.Clave, M.Descripcion, SUM(E.Cantidad) Cantidad, MIN(E.Cantidad) MINIMO, MAX(E.Cantidad) MAXIMO, 
	SUM(E.Cantidad*M.Costo) Importe
FROM Materiales M, Entregan E
WHERE M.Clave = E.Clave
GROUP BY M.Clave, M.Descripcion
HAVING AVG(E.Cantidad) > 400;

/*Para cada proveedor, indicar su razón social y mostrar la cantidad 
promedio de cada material entregado, detallando la clave y descripción 
del material, excluyendo aquellos proveedores para los que la cantidad 
promedio sea menor a 500.*/
SELECT P.RazonSocial, M.Clave, M.Descripcion, AVG(E.Cantidad) CANTIDAD
FROM Proveedores P, Entregan E, Materiales M
WHERE P.RFC = E.RFC AND M.Clave = E.Clave
GROUP BY P.RazonSocial, M.Clave, M.Descripcion
HAVING AVG(E.Cantidad) > 500

/*Mostrar en una solo consulta los mismos datos que 
en la consulta anterior pero para dos grupos de proveedores: 
aquellos para los que la cantidad promedio entregada es menor 
a 370 y aquellos para los que la cantidad promedio entregada 
sea mayor a 450.*/
SELECT P.RazonSocial, M.Clave, M.Descripcion, AVG(E.Cantidad) CANTIDAD
FROM Proveedores P, Entregan E, Materiales M
WHERE P.RFC = E.RFC AND M.Clave = E.Clave
GROUP BY P.RazonSocial, M.Clave, M.Descripcion
HAVING AVG(E.Cantidad) < 370
UNION
SELECT P.RazonSocial, M.Clave, M.Descripcion, AVG(E.Cantidad) CANTIDAD
FROM Proveedores P, Entregan E, Materiales M
WHERE P.RFC = E.RFC AND M.Clave = E.Clave
GROUP BY P.RazonSocial, M.Clave, M.Descripcion
HAVING AVG(E.Cantidad) > 450

--inserta cinco nuevos materiales.
INSERT INTO Materiales VALUES (1700,'Uranio', 25.00)
INSERT INTO Materiales VALUES (1701,'Uranio', 25.00)
INSERT INTO Materiales VALUES (1702,'Mercurio', 27.00)
INSERT INTO Materiales VALUES (1703,'Plutonio', 18.00)
INSERT INTO Materiales VALUES (1704,'Radio', 19.00)

--  Clave y descripción de los materiales que nunca han sido entregados.
SELECT Clave, Descripcion
FROM Materiales
WHERE Clave NOT IN (SELECT Clave FROM Entregan)

/* Razón social de los proveedores que han realizado entregas tanto al proyecto 
'Vamos México' como al proyecto 'Querétaro Limpio'. */
SELECT DISTINCT RazonSocial
FROM Proveedores P, Entregan E, Proyectos Pr
WHERE P.RFC = E.RFC AND Pr.Numero = E.Numero AND Pr.Denominacion = 'Queretaro Limpio'
INTERSECT
SELECT DISTINCT RazonSocial
FROM Proveedores P, Entregan E, Proyectos Pr
WHERE P.RFC = E.RFC AND Pr.Numero = E.Numero AND Pr.Denominacion = 'Vamos Mexico'

/* Descripción de los materiales que nunca han sido entregados al proyecto 'CIT Yucatán'. */
SELECT Descripcion
FROM Materiales
WHERE Clave NOT IN (
	SELECT Clave
	FROM Entregan E, Proyectos P
	WHERE P.Denominacion = 'CIT Yucatán' AND P.Numero = E.Numero
	)

/* Razón social y promedio de cantidad entregada 
de los proveedores cuyo promedio de cantidad 
entregada es mayor al promedio de la cantidad entregada 
por el proveedor con el RFC 'VAGO780901'.*/
SELECT P.RazonSocial
FROM Proveedores P, Entregan E
WHERE P.RFC = E.RFC
GROUP BY P.RazonSocial
HAVING AVG(E.Cantidad) > (
	SELECT AVG(E.Cantidad) 
	FROM Proveedores AS P, Entregan AS E
	WHERE P.RFC = E.RFC AND P.RFC = 'VAGO780901'
)

/*RFC, razón social de los proveedores que participaron en el proyecto 
'Infonavit Durango' y cuyas cantidades totales entregadas en el 2000 fueron 
mayores a las cantidades totales entregadas en el 2001.*/
SET DATEFORMAT dmy
SELECT Prov.RFC, Prov.RazonSocial
FROM Entregan E, Proyectos P,Proveedores Prov
WHERE P.Numero = E.Numero AND Prov.RFC = E.RFC AND Prov.RazonSocial='Infonavit Durango'
GROUP BY Prov.RFC, Prov.RazonSocial
  HAVING (SELECT SUM(E.Cantidad)
  FROM Entregan AS E, Proyectos AS P, Proveedores AS Prov
  WHERE P.Numero = E.Numero AND Prov.RFC = E.RFC AND (E.Fecha BETWEEN '01/01/2000' AND '31/12/2000')
)
  > (SELECT SUM(E.Cantidad)
  FROM Entregan AS E, Proyectos AS P, Proveedores AS Prov
  WHERE P.Numero = E.Numero AND Prov.RFC = E.RFC AND (E.Fecha BETWEEN '01/01/2001' AND '31/12/2001')
)
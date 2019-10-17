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
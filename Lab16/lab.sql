SELECT * FROM Materiales;

SELECT * FROM materiales WHERE clave=1000;

SELECT clave,rfc,fecha FROM entregan;

SELECT * FROM entregan,proyectos 
WHERE entregan.numero < = proyectos.numero

(SELECT * FROM entregan WHERE clave=1400) 
UNION 
(SELECT * FROM entregan WHERE clave=1300)

SELECT * FROM materiales,entregan
WHERE materiales.clave = entregan.clave

SELECT * FROM entregan WHERE clave=1450 AND clave=1300

(SELECT clave FROM entregan WHERE numero=5001)
INTERSECT
(SELECT clave FROM entregan WHERE numero=5018)

(SELECT * FROM entregan)
MINUS
(SELECT * FROM entregan WHERE clave=1000)

(SELECT * FROM entregan)
EXCEPT
(SELECT * FROM entregan WHERE clave=1000)

SELECT * FROM entregan,materiales

SELECT * FROM Entregan
SELECT * FROM materiales

SET DATEFORMAT dmy

SELECT Descripcion
FROM Materiales m, Entregan e
WHERE m.Clave = e.Clave AND e.Fecha BETWEEN '01-01-2000' AND '31-12-2000'

SELECT * FROM materiales WHERE Descripcion LIKE 'Si%'

SELECT * FROM materiales WHERE Descripcion LIKE 'Si'

SELECT DISTINCT Descripcion
FROM Materiales m, Entregan e
WHERE m.Clave = e.Clave AND e.Fecha BETWEEN '01-01-2000' AND '31-12-2000'

SELECT DISTINCT e.Numero, p.Denominacion, e.Fecha
FROM Entregan e, Proyectos p
WHERE e.Numero=  p.Numero
ORDER BY e.Fecha DESC

-- declares y SETs
DECLARE @foo varchar(40);
DECLARE @bar varchar(40);
SET @foo = '¿Que resultado';
SET @bar = ' ¿¿¿??? '
SET @foo += ' obtienes?';
PRINT @foo + @bar;

SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%';
SELECT RFC FROM Entregan WHERE RFC LIKE '[^A]%';
SELECT Numero FROM Entregan WHERE Numero LIKE '___6';

SELECT Clave,RFC,Numero,Fecha,Cantidad
FROM Entregan
WHERE Fecha BETWEEN '01-01-2000' AND '01-02-2000';

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] BETWEEN 5000 AND 5010 AND
Exists ( SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%' AND [Entregan].[RFC] = [Proveedores].[RFC] );

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan] e
WHERE [Numero] BETWEEN 5000 AND 5010 AND  e.RFC
IN (SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%' );

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] BETWEEN 5000 AND 5010 AND  RFC
NOT IN ( SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial NOT LIKE 'La%' AND [Entregan].[RFC] = [Proveedores].[RFC] );

SELECT Descripcion
FROM Materiales
WHERE clave = ANY (SELECT clave FROM Entregan WHERE Cantidad > 10);

SELECT TOP 2 * FROM Proyectos

SELECT TOP Numero FROM Proyectos


ALTER TABLE materiales ADD PorcentajeImpuesto NUMERIC(6,2);

UPDATE materiales SET PorcentajeImpuesto = 2*clave/1000;

SELECT E.Clave, E.Cantidad*(M.Costo*(PorcentajeImpuesto/100)+1) AS "Total"
FROM Materiales M, Entregan E
WHERE M.Clave=E.Clave

CREATE VIEW totalEntregado(Clave,Total) AS
SELECT E.Clave, E.Cantidad*(M.Costo*(PorcentajeImpuesto/100)+1)
FROM Materiales M, Entregan E
WHERE M.Clave=E.Clave;

SELECT * FROM  totalEntregado

CREATE VIEW materialesMexico(Clave,Descripcion) AS
SELECT E.Clave, M.Descripcion
FROM Materiales AS M, Entregan AS E, Proyectos AS P
WHERE M.Clave=E.Clave AND P.Denominacion='Mexico sin ti no estamos completos'

SELECT * FROM materialesMexico

CREATE VIEW materialesAcme(Clave,Descripcion) AS
SELECT E.Clave, M.Descripcion
FROM Materiales AS M, Entregan AS E, Proveedores AS P
WHERE M.Clave=E.Clave AND P.RFC=E.RFC AND P.RazonSocial='Acme tools'


SELECT * FROM materialesAcme


SET DATEFORMAT dmy

CREATE VIEW menor2000(RFC) AS
SELECT E.RFC
FROM Entregan AS E
WHERE E.Cantidad>=300 AND (Fecha BETWEEN '01-JAN-2000' AND '31-DEC-2000')


SELECT * FROM menor2000


CREATE VIEW total2000(Clave, total) AS
SELECT E.Clave, SUM(Cantidad) AS 'Total'
FROM Entregan AS E
WHERE (Fecha BETWEEN '01-JAN-2000' AND '31-DEC-2000')
GROUP BY E.Clave

SELECT * FROM total2000


CREATE VIEW top2001(Clave,Cantidad) AS
SELECT TOP 1 E.Clave, SUM(Cantidad) AS 'Total'
FROM Entregan AS E
WHERE (Fecha BETWEEN '01-JAN-2001' AND '31-DEC-2001')
GROUP BY E.Clave
ORDER BY Total DESC;

SELECT * FROM top2001;

CREATE VIEW patronUB(descripcion) AS
SELECT descripcion
FROM Materiales AS M
WHERE descripcion LIKE '%ub%';

SELECT * FROM patronUB;

CREATE VIEW denominacionySuma(denominacion ,sumaTotal) AS
SELECT P.Denominacion, SUM(E.Cantidad*(M.Costo*(PorcentajeImpuesto/100)+1)) as "Total"
FROM Entregan AS E, Proyectos AS P, Materiales AS M
WHERE P.Numero=E.Numero AND M.Clave=E.Clave
GROUP BY P.Denominacion;

SELECT * FROM denominacionySuma;

CREATE VIEW televisaCoahuila(denominacion , RFC, RazonSocial) AS
     (  SELECT DISTINCT P.Denominacion, PR.RFC, PR.RazonSocial
     FROM Entregan AS E, Proyectos AS P, Proveedores AS PR
     WHERE P.Numero=E.Numero AND PR.RFC=E.RFC AND P.Denominacion LIKE 'Tel%' AND PR.RFC NOT IN 
     (SELECT PR.RFC FROM Entregan AS E, Proyectos AS P, Proveedores as PR
     WHERE P.Numero=E.Numero AND PR.RFC=E.RFC AND P.Denominacion LIKE 'Edu%' ))

SELECT * FROM televisaCoahuila;

SELECT DISTINCT P.Denominacion, PR.RFC, PR.RazonSocial
     FROM Entregan AS E, Proyectos AS P, Proveedores as PR
     WHERE P.Numero=E.Numero AND PR.RFC=E.RFC AND P.Denominacion LIKE 'Tel%' AND PR.RFC NOT IN 
     (SELECT PR.RFC FROM Entregan AS E, Proyectos AS P, Proveedores AS PR
     WHERE P.Numero=E.Numero AND PR.RFC=E.RFC AND P.Denominacion LIKE 'Edu%' )

CREATE VIEW costoMatTelevisaCoahuila(costo ,descripcion) AS
     SELECT M.Costo, M.Descripcion
     FROM Entregan AS E, Proyectos AS P, Materiales AS M, Proveedores AS PR
     WHERE P.Numero=E.Numero AND PR.RFC=E.RFC AND M.Clave=E.Clave AND M.Clave=E.Clave AND P.Denominacion LIKE 'Tel%' AND PR.RFC IN(
       SELECT PR.RFC
       FROM Entregan AS E, Proyectos AS P, Proveedores as PR
       WHERE P.Numero=E.Numero AND PR.RFC=E.RFC AND P.Denominacion LIKE 'Edu%'
       )

SELECT * FROM costoMatTelevisaCoahuila

CREATE VIEW totalmateriales(nombre,proyecto, cantidadEntrega,costoTotal) AS
SELECT M.Descripcion, P.Denominacion, SUM(E.Cantidad) as 'cantidadEntrega', SUM(E.Cantidad*(M.Costo*(PorcentajeImpuesto/100)+1)) as "costoTotal"
FROM Entregan AS E, Materiales AS M,  Proyectos AS P
WHERE M.Clave=E.Clave AND P.Numero=E.Numero
GROUP BY M.Descripcion, P.Denominacion


SELECT * FROM totalmateriales;
SELECT * FROM Materiales;

SELECT * FROM materiales WHERE clave=1000;

select clave,rfc,fecha from entregan;

select * from entregan,proyectos 
where entregan.numero < = proyectos.numero

(select * from entregan where clave=1400) 
union 
(select * from entregan where clave=1300)

select * from materiales,entregan
where materiales.clave = entregan.clave

select * from entregan where clave=1450 AND clave=1300

(select clave from entregan where numero=5001)
intersect
(select clave from entregan where numero=5018)

(select * from entregan)
minus
(select * from entregan where clave=1000)

(select * from entregan)
EXCEPT
(select * from entregan where clave=1000)

select * from entregan,materiales

select * from Entregan
select * from materiales

set dateformat dmy

select Descripcion
from Materiales m, Entregan e
where m.Clave = e.Clave and e.Fecha between '01-01-2000' and '31-12-2000'

SELECT * FROM materiales where Descripcion LIKE 'Si%'

SELECT * FROM materiales where Descripcion LIKE 'Si'

select distinct Descripcion
from Materiales m, Entregan e
where m.Clave = e.Clave and e.Fecha between '01-01-2000' and '31-12-2000'

select distinct e.Numero, p.Denominacion, e.Fecha
from Entregan e, Proyectos p
where e.Numero=  p.Numero
order by e.Fecha desc

-- declares y sets
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
WHERE Fecha Between '01-01-2000' and '01-02-2000';

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] Between 5000 and 5010 AND
Exists ( SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%' and [Entregan].[RFC] = [Proveedores].[RFC] );

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan] e
WHERE [Numero] Between 5000 and 5010 AND  e.RFC
IN (SELECT [RFC]
FROM [Proveedores]
WHERE RazonSocial LIKE 'La%' );

SELECT RFC,Cantidad, Fecha,Numero
FROM [Entregan]
WHERE [Numero] Between 5000 AND 5010 AND  RFC
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

SELECT E.Clave, E.Cantidad*(M.Costo*(PorcentajeImpuesto/100)+1) as "Total"
FROM Materiales M, Entregan E
WHERE M.Clave=E.Clave

CREATE VIEW totalEntregado(Clave,Total) AS
SELECT E.Clave, E.Cantidad*(M.Costo*(PorcentajeImpuesto/100)+1)
FROM Materiales M, Entregan E
WHERE M.Clave=E.Clave;

select * from  totalEntregado

CREATE VIEW materialesMexico(Clave,Descripcion) AS
SELECT E.Clave, M.Descripcion
FROM Materiales as M, Entregan as E, Proyectos as P
WHERE M.Clave=E.Clave AND P.Denominacion='Mexico sin ti no estamos completos'

select * from materialesMexico

CREATE VIEW materialesAcme(Clave,Descripcion) AS
SELECT E.Clave, M.Descripcion
FROM Materiales as M, Entregan as E, Proveedores as P
WHERE M.Clave=E.Clave AND P.RFC=E.RFC AND P.RazonSocial='Acme tools'


select * from materialesAcme


set dateformat dmy

CREATE VIEW menor2000(RFC) AS
SELECT E.RFC
FROM Entregan as E
WHERE E.Cantidad>=300 AND (Fecha Between '01-JAN-2000' AND '31-DEC-2000')


select * from menor2000


CREATE VIEW total2000(Clave, total) AS
SELECT E.Clave, SUM(Cantidad) as 'Total'
FROM Entregan as E
WHERE (Fecha Between '01-JAN-2000' AND '31-DEC-2000')
GROUP BY E.Clave

select * from total2000


CREATE VIEW top2001(Clave,Cantidad) AS
SELECT TOP 1 E.Clave, SUM(Cantidad) as 'Total'
FROM Entregan as E
WHERE (Fecha Between '01-JAN-2001' AND '31-DEC-2001')
GROUP BY E.Clave
ORDER BY Total DESC;

select * from top2001;

CREATE VIEW patronUB(descripcion) AS
SELECT descripcion
FROM Materiales AS M
WHERE descripcion LIKE '%ub%';

select * from patronUB;

CREATE VIEW denominacionySuma(denominacion ,sumaTotal) AS
SELECT P.Denominacion, SUM(E.Cantidad*(M.Costo*(PorcentajeImpuesto/100)+1)) as "Total"
FROM Entregan AS E, Proyectos AS P, Materiales AS M
WHERE P.Numero=E.Numero AND M.Clave=E.Clave
GROUP BY P.Denominacion;

select * from denominacionySuma;

CREATE VIEW televisaCoahuila(denominacion , RFC, RazonSocial) AS
     (  SELECT DISTINCT P.Denominacion, PR.RFC, PR.RazonSocial
     FROM Entregan AS E, Proyectos AS P, Proveedores as PR
     WHERE P.Numero=E.Numero AND PR.RFC=E.RFC AND P.Denominacion LIKE 'Tel%' AND PR.RFC NOT IN (SELECT PR.RFC FROM Entregan AS E, Proyectos AS P, Proveedores as PR
     WHERE P.Numero=E.Numero AND PR.RFC=E.RFC AND P.Denominacion LIKE 'Edu%' ))

select * from televisaCoahuila;

SELECT DISTINCT P.Denominacion, PR.RFC, PR.RazonSocial
     FROM Entregan AS E, Proyectos AS P, Proveedores as PR
     WHERE P.Numero=E.Numero AND PR.RFC=E.RFC AND P.Denominacion LIKE 'Tel%' AND PR.RFC NOT IN (SELECT PR.RFC FROM Entregan AS E, Proyectos AS P, Proveedores as PR
     WHERE P.Numero=E.Numero AND PR.RFC=E.RFC AND P.Denominacion LIKE 'Edu%' )

CREATE VIEW costoMatTelevisaCoahuila(costo ,descripcion) AS
     SELECT M.Costo, M.Descripcion
     FROM Entregan AS E, Proyectos AS P, Materiales AS M, Proveedores AS PR
     WHERE P.Numero=E.Numero AND PR.RFC=E.RFC AND M.Clave=E.Clave AND M.Clave=E.Clave AND P.Denominacion LIKE 'Tel%' AND PR.RFC IN(
       SELECT PR.RFC
       FROM Entregan AS E, Proyectos AS P, Proveedores as PR
       WHERE P.Numero=E.Numero AND PR.RFC=E.RFC AND P.Denominacion LIKE 'Edu%'
       )

select * from costoMatTelevisaCoahuila

CREATE VIEW totalmateriales(nombre,proyecto, cantidadEntrega,costoTotal) AS
SELECT M.Descripcion, P.Denominacion, SUM(E.Cantidad) as 'cantidadEntrega', SUM(E.Cantidad*(M.Costo*(PorcentajeImpuesto/100)+1)) as "costoTotal"
FROM Entregan AS E, Materiales AS M,  Proyectos AS P
WHERE M.Clave=E.Clave AND P.Numero=E.Numero
GROUP BY M.Descripcion, P.Denominacion


select * from totalmateriales;
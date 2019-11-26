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

--set dateformat dmy

select Descripcion
from Materiales m, Entregan e
where m.Clave = e.Clave and e.Fecha between '01-01-2000' and '31-12-2000'
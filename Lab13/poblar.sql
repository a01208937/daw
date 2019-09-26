BULK INSERT a1208937.a1208937.[Materiales]
   FROM 'e:\wwwroot\a1208937\materiales.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '0x0a'
      )

BULK INSERT a1208937.a1208937.[Proyectos]
   FROM 'e:\wwwroot\a1208937\proyectos.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '0x0a'
      )

BULK INSERT a1208937.a1208937.[Proveedores]
   FROM 'e:\wwwroot\a1208937\proveedores.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '0x0a'
      )

SET DATEFORMAT dmy -- especificar formato de la fecha

BULK INSERT a1208937.a1208937.[Entregan]
   FROM 'e:\wwwroot\a1208937\entregan.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '0x0a'
      )
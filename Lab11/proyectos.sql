BULK INSERT a1208937.a1208937.[Proyectos]
   FROM 'e:\wwwroot\a1208937\proyectos.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '0x0a'
      )
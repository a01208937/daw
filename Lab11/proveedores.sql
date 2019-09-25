BULK INSERT a1208937.a1208937.[Proveedores]
   FROM 'e:\wwwroot\a1208937\proveedores.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '0x0a'
      )
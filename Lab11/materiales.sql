BULK INSERT a1208937.a1208937.[Materiales]
   FROM 'e:\wwwroot\a1208937\materiales.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '0x0a'
      )
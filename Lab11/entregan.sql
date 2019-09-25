BULK INSERT a1208937.a1208937.[Entregan]
   FROM 'e:\wwwroot\a1208937\entregan.csv'
   WITH
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '0x0a'
      )
	  SET DATEFORMAT dmy
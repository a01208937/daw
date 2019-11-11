-- formato tradicional (en postgresql las funciones son transacciones)
BEGIN;
SELECT FROM capturarMovimiento(1, 1, 300);
UPDATE clientesbanco SET saldo = saldo + 300 WHERE id = 1;
COMMIT;
select * FROM clientesbanco;

BEGIN;
SELECT FROM capturarMovimiento(2, 1, 700);
UPDATE clientesbanco SET saldo = saldo + 700 WHERE id = 2;
COMMIT;
select * FROM clientesbanco;
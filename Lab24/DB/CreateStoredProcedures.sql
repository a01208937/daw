CREATE OR REPLACE FUNCTION agregarCliente(nom VARCHAR(30))
RETURNS VOID
AS $$
BEGIN
	INSERT INTO ClientesBanco(Nombre) VALUES (nom);
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION agregarTipoMovimiento(
dn VARCHAR(30)
)
RETURNS VOID
AS $$
BEGIN
	INSERT INTO tiposmovimiento(descripcion) VALUES (dn);
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION capturarMovimiento(
idC INT,
cvMov INT,
mo INT
)
RETURNS VOID
AS $$
BEGIN
	INSERT INTO movimientos(id_cliente, clavemovimiento, monto) VALUES (idC, cvMov, mo);
END;
$$ LANGUAGE 'plpgsql';

-- FUNCIÓN PARA PROCEDIMIENTO DEL RETIRO
CREATE OR REPLACE FUNCTION retirar(
idCl INT,
mon INT
)
RETURNS VOID
AS $$
BEGIN
    PERFORM capturarMovimiento(idCl, 2, mon);
    UPDATE clientesbanco SET saldo = saldo - mon WHERE id = idCl;
END;
$$ LANGUAGE 'plpgsql';
DELIMITER //
CREATE TRIGGER ActualizarStockEnVenta
AFTER INSERT ON InvoiceLine
FOR EACH ROW
BEGIN
    UPDATE Track
    SET UnitPrice = UnitPrice - 1
    WHERE TrackId = NEW.TrackId;
END;
DELIMITER //

DELIMITER //
CREATE TRIGGER AuditarCambioCliente
AFTER UPDATE ON Customer
FOR EACH ROW
BEGIN
    INSERT INTO AuditoriaCliente (ClienteId, FechaCambio, Cambio)
    VALUES (OLD.CustomerId, NOW(), CONCAT('Cambio de ', OLD.FirstName, ' a ', NEW.FirstName));
END;
DELIMITER //

DELIMITER //
CREATE TRIGGER RegistrarCambioPrecio
BEFORE UPDATE ON Track
FOR EACH ROW
BEGIN
    IF OLD.UnitPrice <> NEW.UnitPrice THEN
        INSERT INTO HistorialPrecio (TrackId, FechaCambio, PrecioAnterior, PrecioNuevo)
        VALUES (OLD.TrackId, NOW(), OLD.UnitPrice, NEW.UnitPrice);
    END IF;
END;
DELIMITER //

DELIMITER //
CREATE TRIGGER NotificarEliminacionVenta
AFTER DELETE ON Invoice
FOR EACH ROW
BEGIN
    INSERT INTO Notificaciones (Mensaje, Fecha)
    VALUES (CONCAT('Se eliminó la venta ', OLD.InvoiceId), NOW());
END;
DELIMITER // 

DELIMITER //
CREATE TRIGGER BloquearCompraConDeuda
BEFORE INSERT ON Invoice
FOR EACH ROW
BEGIN
    DECLARE deuda DECIMAL(10, 2);
    SELECT SUM(Total - TotalPagado) INTO deuda
    FROM Cuenta
    WHERE CustomerId = NEW.CustomerId;

    IF deuda > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El cliente tiene deuda pendiente';
    END IF;
END;
DELIMITER //







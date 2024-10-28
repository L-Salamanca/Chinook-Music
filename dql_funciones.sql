
DELIMITER //
CREATE FUNCTION TotalDeVentasCliente(ClienteID INT, Anio INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10, 2);
    SELECT SUM(Total) INTO total
    FROM Invoice
    WHERE CustomerId = ClienteID AND YEAR(InvoiceDate) = Anio;
    RETURN total;
END;
DELIMITER //


DELIMITER //
CREATE FUNCTION PrecioPromedioPorCompra(CompraID INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE precio_promedio DECIMAL(10, 2);
    SELECT AVG(UnitPrice) INTO precio_promedio
    FROM InvoiceLine
    WHERE InvoiceId = CompraID;
    RETURN precio_promedio;
END;
DELIMITER //

DELIMITER //
CREATE FUNCTION DuracionTotalAlbum(AlbumID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE duracion_total INT;
    SELECT SUM(Milliseconds) INTO duracion_total
    FROM Track
    WHERE AlbumId = AlbumID;
    RETURN duracion_total;
END;
DELIMITER //


DELIMITER //
CREATE FUNCTION CalcularDescuentoCliente(ClienteID INT)
RETURNS DECIMAL(5, 2)
DETERMINISTIC
BEGIN
    DECLARE descuento DECIMAL(5, 2);
    DECLARE total_gasto DECIMAL(10, 2);

    SELECT SUM(Total) INTO total_gasto FROM Invoice WHERE CustomerId = ClienteID;

    IF total_gasto > 1000 THEN
        SET descuento = 0.10;
    ELSEIF total_gasto > 500 THEN
        SET descuento = 0.05;
    ELSE
        SET descuento = 0;
    END IF;

    RETURN descuento;
END;
DELIMITER //


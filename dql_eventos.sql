DELIMITER //
CREATE EVENT InformeSemanalVentas
ON SCHEDULE EVERY 1 WEEK
DO
BEGIN
    INSERT INTO InformeVentas (Fecha, TotalVentas)
    SELECT NOW(), SUM(Total) FROM Invoice WHERE YEARWEEK(InvoiceDate) = YEARWEEK(NOW());
END;
DELIMITER // 

DELIMITER //
CREATE EVENT ActualizarEstadosCuentaMensualpp
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    UPDATE Cuenta SET Estado = 'Pendiente' WHERE FechaPago IS NULL;
END;
DELIMITER //

DELIMITER //
CREATE EVENT AlertaAlbumNoVendidoAnual
ON SCHEDULE EVERY 1 YEAR
DO
BEGIN
    INSERT INTO Alertas (Mensaje, Fecha)
    SELECT CONCAT('El álbum ', Title, ' no se ha vendido en el último año.'), NOW()
    FROM Album
    WHERE AlbumId NOT IN (SELECT DISTINCT AlbumId FROM Track JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId WHERE InvoiceDate >= DATE_SUB(NOW(), INTERVAL 1 YEAR));
END;
DELIMITER //

DELIMITER //
CREATE EVENT LimpiarRegistrosAntiguosAuditoria
ON SCHEDULE EVERY 3 MONTH
DO
BEGIN
    DELETE FROM AuditoriaCliente WHERE FechaCambio < DATE_SUB(NOW(), INTERVAL 1 YEAR);
END;
DELIMITER //

DELIMITER //
CREATE EVENT ActualizarGenerosMasVendidosMensual
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
    DELETE FROM GenerosMasVendidos;
    INSERT INTO GenerosMasVendidos (Genero, TotalVentas)
    SELECT Genre.Name, COUNT(*)
    FROM InvoiceLine
    JOIN Track ON InvoiceLine.TrackId = Track.TrackId
    JOIN Genre ON Track.GenreId = Genre.GenreId
    GROUP BY Genre.Name
    ORDER BY TotalVentas DESC;
END;
DELIMITER //


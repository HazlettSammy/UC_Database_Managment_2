-- Create the Script 
USE Northwind;
GO

CREATE PROCEDURE spCheckShipper
    @OrderID INT
AS
BEGIN
    DECLARE @ShipperName NVARCHAR(40);
    DECLARE @Message NVARCHAR(100);

    SELECT @ShipperName = s.CompanyName
    FROM Orders o
    INNER JOIN Shippers s ON o.ShipVia = s.ShipperID
    WHERE o.OrderID = @OrderID;

    IF @ShipperName IS NULL
    BEGIN
        PRINT 'Invalid OrderID. No such order found.';
        RETURN;
    END

    IF @ShipperName = 'Speedy Express'
        SET @Message = 'Your package will arrive in 1 - 2 business days.';
    ELSE IF @ShipperName = 'United Package'
        SET @Message = 'Your package will arrive in 3 - 5 business days.';
    ELSE IF @ShipperName = 'Federal Shipping'
        SET @Message = 'Your package will arrive in 7 - 10 business days.';
    ELSE
        SET @Message = 'Shipping information is not available.';

    PRINT 'Shipper: ' + @ShipperName;
    PRINT @Message;
END;
GO

-- 2 Different Outcomes for the procedure 
-- Test case 1: OrderID for Speedy Express
EXEC spCheckShipper @OrderID = 10248;

-- Test case 2: OrderID for Federal Shipping
EXEC spCheckShipper @OrderID = 10250;

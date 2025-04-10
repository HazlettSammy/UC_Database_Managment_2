CREATE PROCEDURE spAddOrderCheckShipper_Hazlett
    @CustomerID NCHAR(5),
    @EmployeeID INT,
    @OrderDate DATETIME,
    @RequiredDate DATETIME,
    @ShippedDate DATETIME = NULL,
    @ShipVia INT,
    @Freight MONEY,
    @ShipName NVARCHAR(40),
    @ShipAddress NVARCHAR(60),
    @ShipCity NVARCHAR(15),
    @ShipRegion NVARCHAR(15) = NULL,
    @ShipPostalCode NVARCHAR(10),
    @ShipCountry NVARCHAR(15)
AS
BEGIN
    DECLARE @ShipperName NVARCHAR(40);
    
    -- Get the shipper name based on ShipVia
    SELECT @ShipperName = CompanyName FROM Shippers WHERE ShipperID = @ShipVia;
    
    BEGIN TRANSACTION;
    
    IF @ShipperName = 'Speedy Express' AND @ShipRegion IS NULL
    BEGIN
        ROLLBACK TRANSACTION;
        PRINT 'Transaction rolled back: ShipRegion cannot be NULL for Speedy Express. Choose another shipper.';
        RETURN;
    END
    
    -- Insert the order
    INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, RequiredDate, ShippedDate, ShipVia, Freight, 
                        ShipName, ShipAddress, ShipCity, ShipRegion, ShipPostalCode, ShipCountry)
    VALUES (@CustomerID, @EmployeeID, @OrderDate, @RequiredDate, @ShippedDate, @ShipVia, @Freight, 
            @ShipName, @ShipAddress, @ShipCity, @ShipRegion, @ShipPostalCode, @ShipCountry);
    
    COMMIT TRANSACTION;
    PRINT 'Transaction committed: Order has been added successfully.';
END;

--create the procedure 
USE Northwind;
GO

CREATE PROCEDURE spAddTerritory
    @TerritoryID NVARCHAR(20),
    @TerritoryDescription NCHAR(50),
    @RegionID INT
AS
BEGIN
    BEGIN TRY
        INSERT INTO Territories (TerritoryID, TerritoryDescription, RegionID)
        VALUES (@TerritoryID, @TerritoryDescription, @RegionID);

        PRINT 'Territory added successfully.';
    END TRY
    BEGIN CATCH
        PRINT 'An error occurred while trying to insert the new territory.';
        PRINT 'Error Message: ' + ERROR_MESSAGE();
    END CATCH
END;
GO

-- Successful Insertion Test
EXEC spAddTerritory 
    @TerritoryID = '99999', 
    @TerritoryDescription = 'New Test Territory', 
    @RegionID = 1;

	-- Error Test: Try to Duplicate TerritoryID (This will cause a primary key violation)
EXEC spAddTerritory 
    @TerritoryID = '99999', 
    @TerritoryDescription = 'Duplicate Test Territory', 
    @RegionID = 1;

-- created spAddCustomer stored procedure
USE Northwind;
GO

CREATE PROCEDURE spAddCustomer
    @CustomerID NCHAR(5),
    @CompanyName NVARCHAR(40),
    @ContactName NVARCHAR(30),
    @ContactTitle NVARCHAR(30),
    @Address NVARCHAR(60),
    @City NVARCHAR(15),
    @Region NVARCHAR(15),
    @PostalCode NVARCHAR(10),
    @Country NVARCHAR(15),
    @Phone NVARCHAR(24),
    @Fax NVARCHAR(24)
AS
BEGIN
    INSERT INTO Customers (
        CustomerID, CompanyName, ContactName, ContactTitle,
        Address, City, Region, PostalCode, Country, Phone, Fax
    )
    VALUES (
        @CustomerID, @CompanyName, @ContactName, @ContactTitle,
        @Address, @City, @Region, @PostalCode, @Country, @Phone, @Fax
    );
END;
GO

-- Tested the Stored Procedure
EXEC spAddCustomer
    @CustomerID = 'ZTEST',
    @CompanyName = 'Zenith Testing Co.',
    @ContactName = 'John Doe',
    @ContactTitle = 'Sales Manager',
    @Address = '123 Test Lane',
    @City = 'Testville',
    @Region = 'TX',
    @PostalCode = '12345',
    @Country = 'USA',
    @Phone = '(123) 456-7890',
    @Fax = '(123) 456-7891';

	-- Verified that the program worked 
	SELECT * FROM Customers WHERE CustomerID = 'ZTEST';

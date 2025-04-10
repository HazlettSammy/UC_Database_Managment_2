--Create Triggers: OrderAlert

CREATE TRIGGER trOrderAlert
ON Orders
AFTER INSERT
AS
BEGIN
    PRINT 'A new order has been created.';
END;


--Test the trigger

INSERT INTO Orders (CustomerID, EmployeeID, OrderDate, RequiredDate, ShipVia)  
VALUES ('ALFKI', 5, GETDATE(), DATEADD(DAY, 7, GETDATE()), 3);

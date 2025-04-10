-- Hazlett, Samuel
-- 2025-04-08


-- Create a SQL Server login named SkyAirSA with password 'Sky@ir22'
-- Set the default database to SkyAirRental
CREATE LOGIN SkyAirSA
WITH PASSWORD = 'Sky@ir22',
     DEFAULT_DATABASE = SkyAirRental;
GO

-- Update the login to change the password to 'Sky@ir23'
ALTER LOGIN SkyAirSA
WITH PASSWORD = 'Sky@ir23';
GO

-- Create a database user in SkyAirRental for the login SkyAirSA
USE SkyAirRental;
GO
CREATE USER SkyAirUser FOR LOGIN SkyAirSA;
GO

-- Create a sample table to grant/revoke access on
CREATE TABLE TestFlights (
    FlightID INT PRIMARY KEY,
    Destination NVARCHAR(100),
    DepartureTime DATETIME
);
GO

-- Grant SELECT permission to SkyAirUser on TestFlights table
GRANT SELECT ON TestFlights TO SkyAirUser;
GO

-- Revokes SELECT permission from SkyAirUser on TestFlights table
REVOKE SELECT ON TestFlights FROM SkyAirUser;
GO

-- Drop the login SkyAirSA
USE master;
GO
DROP LOGIN SkyAirSA;
GO

-- Drop the user SkyAirUser from SkyAirRental
USE SkyAirRental;
GO
DROP USER SkyAirUser;
GO

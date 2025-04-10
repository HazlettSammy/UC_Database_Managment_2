-- Admin Login
CREATE LOGIN lockheed_Admin WITH PASSWORD = 'SecureAdminPass123!';

-- Read-Only Login
CREATE LOGIN lockheed_ReadOnly WITH PASSWORD = 'ReadOnlyPass123!';

-- Limited Access Login
CREATE LOGIN lockheed_Limited WITH PASSWORD = 'LimitedPass123!';

-- Map to database users
USE lockheed;
GO


-- Admin user
CREATE USER Lockheed_Admin_User FOR LOGIN Lockheed_Admin;
ALTER ROLE db_owner ADD MEMBER Lockheed_Admin_User;

-- Read-Only user
CREATE USER Lockheed_ReadOnly_User FOR LOGIN Lockheed_ReadOnly;

-- Limited Access user
CREATE USER Lockheed_Limited_User FOR LOGIN Lockheed_Limited;


-- Grant SELECT only to ReadOnly
GRANT SELECT ON SCHEMA :: dbo TO Lockheed_ReadOnly_User;

-- Limited Access Example: Can SELECT on Customers and INSERT into Orders only
GRANT SELECT ON dbo.Customers TO Lockheed_Limited_User;
GRANT INSERT ON dbo.Orders TO Lockheed_Limited_User;

-- Revoke other permissions for Limited (if any were defaulted)
DENY DELETE ON dbo.Customers TO Lockheed_Limited_User;
DENY UPDATE ON dbo.Orders TO Lockheed_Limited_User;

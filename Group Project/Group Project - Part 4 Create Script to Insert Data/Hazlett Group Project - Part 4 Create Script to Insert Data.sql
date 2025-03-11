-- Author: Samuel Hazlett
-- Date: 2025-02-25
-- Description: This script creates tables, inserts sample data, and displays record counts.

-- Ensure the correct database is used
USE test;
GO

-- Create StudentsCopy table
IF OBJECT_ID('StudentsCopy', 'U') IS NOT NULL
    DROP TABLE StudentsCopy;
GO

CREATE TABLE StudentsCopy (
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    Firstname NVARCHAR(50),
    Lastname NVARCHAR(50),
    Gender NVARCHAR(10)
);
GO

-- Insert sample data into StudentsCopy
INSERT INTO StudentsCopy (Firstname, Lastname, Gender) VALUES
('John', 'Doe', 'Male'),
('Jane', 'Smith', 'Female'),
('Alex', 'Johnson', 'Non-binary'),
('Michael', 'Brown', 'Male'),
('Emily', 'Davis', 'Female'),
('David', 'Wilson', 'Male'),
('Emma', 'Anderson', 'Female'),
('Chris', 'Taylor', 'Non-binary'),
('Sarah', 'Moore', 'Female'),
('Daniel', 'White', 'Male');
GO

-- Create another table if necessary
-- Example: Organizations
IF OBJECT_ID('Organizations', 'U') IS NOT NULL
    DROP TABLE Organizations;
GO

CREATE TABLE Organizations (
    OrgID INT PRIMARY KEY IDENTITY(1,1),
    OrgName NVARCHAR(100)
);
GO

-- Insert sample data into Organizations
INSERT INTO Organizations (OrgName) VALUES
('Tech Corp'),
('Health Plus'),
('EduFuture'),
('Green Energy'),
('AutoWorld');
GO

-- Display record counts for verification
SELECT 'StudentsCopy' AS TableName, COUNT(*) AS RecordCount FROM StudentsCopy
UNION ALL
SELECT 'Organizations', COUNT(*) FROM Organizations;
GO

-- Name: Samuel Hazlett 
-- Date: 2/11/2025  
-- Assignment: Week 4 Assignment - Create Database and Tables  

-- Create the database
CREATE DATABASE OrderSystem_Hazlett;
GO

-- Use the created database
USE OrderSystem_Hazlett;
GO

-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerLast VARCHAR(50) NOT NULL,
    CustomerFirst VARCHAR(50) NOT NULL,
    CustomerDOB DATE NOT NULL
);

-- Create PaymentType table
CREATE TABLE PaymentType (
    PaymentTypeID INT IDENTITY(1,1) PRIMARY KEY,
    PaymentType VARCHAR(50) NOT NULL UNIQUE
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
    OrderPayType INT NOT NULL,
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (OrderPayType) REFERENCES PaymentType(PaymentTypeID)
);

-- Create Menu table
CREATE TABLE Menu (
    MenuID INT IDENTITY(1,1) PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    ItemDescription TEXT,
    ItemPrice DECIMAL(10,2) NOT NULL CHECK (ItemPrice > 0)
);

-- Create OrderDetails table
CREATE TABLE OrderDetails (
    OrderID INT NOT NULL,
    MenuID INT NOT NULL,
    Quantity INT NOT NULL CHECK (Quantity > 0),
    PRIMARY KEY (OrderID, MenuID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (MenuID) REFERENCES Menu(MenuID)
);

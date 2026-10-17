CREATE DATABASE IF NOT EXISTS SalaseIndustries;
USE SalaseIndustries;

CREATE TABLE Customers (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    City VARCHAR(50),
    State VARCHAR(50),
    JoinDate DATE
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    UnitPrice DECIMAL(10,2) CHECK (UnitPrice >= 0),
    StockQuantity INT CHECK (StockQuantity >= 0)
);

CREATE TABLE Sales (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    SaleDate DATE,
    QuantitySold INT CHECK (QuantitySold > 0),
    TotalAmount DECIMAL(10,2) CHECK (TotalAmount >= 0),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE SalesAgents (
    AgentID INT AUTO_INCREMENT PRIMARY KEY,
    AgentName VARCHAR(100) NOT NULL,
    Region VARCHAR(50),
    Phone VARCHAR(15),
    JoiningDate DATE
);

CREATE TABLE Agent_Sales (
    SaleID INT,
    AgentID INT,
    PRIMARY KEY (SaleID, AgentID),
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    FOREIGN KEY (AgentID) REFERENCES SalesAgents(AgentID)
);

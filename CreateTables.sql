CREATE DATABASE RealEstateDB;

USE RealEstateDB;

CREATE TABLE PropertyTypes (
    PropertyTypeID INT IDENTITY(1,1) PRIMARY KEY,
    TypeName NVARCHAR(50) NOT NULL
);

CREATE TABLE Agents (
    AgentID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(50)
);

CREATE TABLE Clients (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(50)
);

CREATE TABLE Properties (
    PropertyID INT IDENTITY(1,1) PRIMARY KEY,
    Address NVARCHAR(100),
    City NVARCHAR(50),
    PropertyTypeID INT NOT NULL,
    Price DECIMAL(18,2),
    AgentID INT NOT NULL,
    IsAvailable BIT DEFAULT 1,
    CONSTRAINT FK_Properties_PropertyTypes FOREIGN KEY (PropertyTypeID) REFERENCES PropertyTypes(PropertyTypeID),
    CONSTRAINT FK_Properties_Agents FOREIGN KEY (AgentID) REFERENCES Agents(AgentID)
);

CREATE TABLE Sales (
    SaleID INT IDENTITY(1,1) PRIMARY KEY,
    PropertyID INT NOT NULL,
    ClientID INT NOT NULL,
    AgentID INT NOT NULL,
    SaleDate DATE NOT NULL,
    SalePrice DECIMAL(18,2),
    Commission AS SalePrice * 0.03 PERSISTED,
    CONSTRAINT FK_Sales_Properties FOREIGN KEY (PropertyID) REFERENCES Properties(PropertyID),
    CONSTRAINT FK_Sales_Clients FOREIGN KEY (ClientID) REFERENCES Clients(ClientID),
    CONSTRAINT FK_Sales_Agents FOREIGN KEY (AgentID) REFERENCES Agents(AgentID)
);

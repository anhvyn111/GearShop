CREATE DATABASE GearShop
GO
USE GearShop
GO

CREATE TABLE Menu(
	MenuID INT IDENTITY(1,1) PRIMARY KEY,
	MenuName NVARCHAR(200),
	MetaTitle VARCHAR(200),
	Display BIT
)
DROP TABLE ProductCategory
CREATE TABLE ProductCategory(
	CategoryID INT IDENTITY(1,1) PRIMARY KEY,
	CategoryName NVARCHAR(200),
	MetaTitle VARCHAR(200),
	MenuID INT,
	ModifiedDate DATETIME,
	ModifiedBy VARCHAR(100),
	FOREIGN KEY (MenuID) REFERENCES Menu(MenuID)
)
ALTER TABLE ProductCategory
ADD Status BIT
GO 
CREATE TABLE Product(
	ProductID INT IDENTITY(1,1) PRIMARY KEY,
	ProductName NVARCHAR(MAX),
	MetaTitle VARCHAR(MAX),
	Price BIGINT,
	PromotionPrice BIGINT,
	CategoryID INT FOREIGN KEY REFERENCES ProductCategory(CategoryID),
	Description NTEXT,
	Detail NTEXT,
	Quanlity INT,
	ModifiedDate DATETIME,
	ModifiedBy INT,
	ProductTag NVARCHAR(MAX)
)
CREATE TABLE Tag(
	TagID VARCHAR(200),
	TagName NVARCHAR(200)
)
DROP TABLE Tag
CREATE TABLE ProductTag(
	ProductID INT FOREIGN KEY REFERENCES Product(ProductID),
	TagID VARCHAR(200),
	CONSTRAINT PK_ProductTag PRIMARY KEY(ProductId, TagID)
)
CREATE TABLE Admin(
	Username VARCHAR(100) PRIMARY KEY,
	FullName NVARCHAR(200),
	Password VARCHAR(100)
)

CREATE TABLE Customer(
	CustomerID INT IDENTITY(1,1),
	Email VARCHAR(100),
	FullName NVARCHAR(255),
	Birth DATETIME,
	Gender BIT,
	PhoneNumber CHAR(11),
	Password VARCHAR(200),
	Status INT,
	CONSTRAINT PK_User PRIMARY KEY(CustomerID, Email)
)

CREATE TABLE ProductOrder(
	OrderID INT IDENTITY(1,1) PRIMARY KEY,
	OrderedBy INT,
	OrderdDate DATETIME,
	PhoneNumer CHAR(11),
	Address NVARCHAR(MAX)
)
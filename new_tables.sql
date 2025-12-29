-- Customers
CREATE TABLE dbo.Customers (
    CustomerID      nvarchar(50)  NOT NULL,
    CustomerName    nvarchar(100) NOT NULL,
    Segment         nvarchar(50)  NULL,
    Country         nvarchar(50)  NULL,
    City            nvarchar(100) NULL,
    State           nvarchar(100) NULL,
    Postal_Code     nvarchar(20)  NULL,
    Region          nvarchar(50)  NULL
);

-- Products
CREATE TABLE dbo.Products (
    ProductID    nvarchar(50)   NOT NULL,
    Category     nvarchar(50)   NULL,
    SubCategory  nvarchar(50)   NULL,
    ProductName  nvarchar(200)  NULL
);

-- Orders
CREATE TABLE dbo.Orders (
    OrderID      nvarchar(50)  NOT NULL,
    OrderDate    date          NOT NULL,
    ShipDate     date          NULL,
    ShipMode     nvarchar(50)  NULL,
    CustomerID   nvarchar(50)  NOT NULL,
    ProductID    nvarchar(50)  NOT NULL,
    Sales        decimal(10,2) NULL,
    Quantity     int           NULL,
    Discount     decimal(10,4) NULL,
    Profit       decimal(10,2) NULL
);
GO

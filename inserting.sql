-- Customers
INSERT INTO dbo.Customers (CustomerID, CustomerName, Segment, Country, City, State, Postal_Code, Region)
SELECT DISTINCT
    s.Customer_ID,
    s.Customer_Name,
    s.Segment,
    s.Country,
    s.City,
    s.State,
    CAST(s.Postal_Code AS nvarchar(20)),
    s.Region
FROM dbo.SuperstoreRaw s;
GO

-- Products
INSERT INTO dbo.Products (ProductID, Category, SubCategory, ProductName)
SELECT DISTINCT
    s.Product_ID,
    s.Category,
    s.Sub_Category,
    s.Product_Name
FROM dbo.SuperstoreRaw s;
GO

-- Orders
INSERT INTO dbo.Orders
    (OrderID, OrderDate, ShipDate, ShipMode, CustomerID, ProductID,
     Sales, Quantity, Discount, Profit)
SELECT
    s.Order_ID,
    CAST(s.Order_Date AS date),
    CAST(s.Ship_Date  AS date),
    s.Ship_Mode,
    s.Customer_ID,
    s.Product_ID,
    CAST(s.Sales    AS decimal(10,2)),
    CAST(s.Quantity AS int),
    CAST(s.Discount AS decimal(10,4)),
    CAST(s.Profit   AS decimal(10,2))
FROM dbo.SuperstoreRaw s;
GO

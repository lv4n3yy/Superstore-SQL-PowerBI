USE ECommerceAnalytics;
GO

IF OBJECT_ID('dbo.vw_FactSales', 'V') IS NOT NULL
    DROP VIEW dbo.vw_FactSales;
GO

CREATE VIEW dbo.vw_FactSales AS
SELECT
    o.OrderID,
    o.OrderDate,
    o.ShipDate,
    cal.DateKey              AS OrderDateKey,
    o.CustomerID,
    o.ProductID,


    p.Category,
    p.SubCategory,
    p.ProductName,


    cust.Segment,
    cust.Country,
    cust.City,
    cust.State,
    cust.Region,

   
    o.Sales,
    o.Quantity,
    o.Discount,        
    o.Profit,

 
    o.Sales * (1 - o.Discount / 100.0) AS NetSales,

    -- Маржа
    CASE 
        WHEN o.Sales <> 0 
            THEN o.Profit / o.Sales 
        ELSE NULL 
    END AS ProfitMargin,

    cal.[Year],
    cal.[Quarter],
    cal.[Month],
    cal.MonthName
FROM dbo.Orders      AS o
JOIN dbo.Products    AS p    ON o.ProductID  = p.ProductID
JOIN dbo.Customers   AS cust ON o.CustomerID = cust.CustomerID
JOIN dbo.Calendar    AS cal  ON o.OrderDate  = cal.FullDate;
GO

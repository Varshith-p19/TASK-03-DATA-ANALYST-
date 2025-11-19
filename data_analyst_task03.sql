/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [OrderID]
      ,[CustomerID]
      ,[ProductID]
      ,[OrderDate]
      ,[Quantity]
      ,[Price]
  FROM [DA].[dbo].[ecommerces]


  CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    UnitPrice INT
);

INSERT INTO Products VALUES
(501,'Wireless Mouse','Electronics',750),
(502,'Bluetooth Keyboard','Electronics',1200),
(503,'Earbuds','Accessories',900),
(504,'Laptop Stand','Office',1500),
(505,'USB Cable','Accessories',250),
(506,'Power Bank','Electronics',1400),
(507,'Notebook','Stationery',80);

SELECT * FROM Products


/*Sample SQL Questions + Solutions => SELECT + WHERE + ORDER BY */

SELECT OrderID, CustomerID, Quantity
FROM ecommerces
WHERE Quantity > 3
ORDER BY Quantity



/*2️ GROUP BY + SUM + AVG*/
SELECT 
    ProductID,
    SUM(CAST(Quantity AS INT)) AS TotalQuantity,
    SUM(CAST(Quantity AS INT) * CAST(Price AS INT)) AS TotalRevenue,
    AVG(CAST(Price AS INT)) AS AvgPrice
FROM ecommerces
GROUP BY ProductID;





/*INNER JOIN*/
SELECT
    O.OrderID,
    O.CustomerID,
    O.ProductID,
    CAST(O.Quantity AS INT) AS Quantity,
    CAST(O.Price AS INT) AS Price,
    (CAST(O.Quantity AS INT) * CAST(O.Price AS INT)) AS TotalAmount
FROM ecommerces O
INNER JOIN Products P
    ON O.ProductID = P.ProductID;


/* LEFT JOIN => Show all orders, even if a ProductID is not found in Products.*/
SELECT 
    O.OrderID,
    O.CustomerID,
    O.ProductID,
    P.ProductName,
    P.Category,
    CAST(O.Quantity AS INT) AS Quantity,
    CAST(O.Price AS INT) AS Price,
    (CAST(O.Quantity AS INT) * CAST(O.Price AS INT)) AS TotalAmount
FROM ecommerces O
LEFT JOIN Products P
    ON O.ProductID = P.ProductID;

/* RIGHT JOIN => Show all products, even if they were never ordered.*/
SELECT 
    O.OrderID,
    O.CustomerID,
    P.ProductID,
    P.ProductName,
    P.Category,
    CAST(O.Quantity AS INT) AS Quantity,
    CAST(O.Price AS INT) AS Price,
    (CAST(O.Quantity AS INT) * CAST(O.Price AS INT)) AS TotalAmount
FROM ecommerces O
RIGHT JOIN Products P
    ON O.ProductID = P.ProductID;

/* SUB QUERY */
SELECT 
    OrderID,
    CustomerID,
    ProductID,
    (SELECT Category 
     FROM Products 
     WHERE Products.ProductID = ecommerces.ProductID) AS Category
FROM ecommerces;


CREATE VIEW vw_ProductSalesSummary AS
SELECT
    O.ProductID,
    P.ProductName,
    P.Category,
    SUM(CAST(O.Quantity AS INT)) AS TotalQuantitySold,
    SUM(CAST(O.Quantity AS INT) * CAST(O.Price AS INT)) AS TotalRevenue
FROM ecommerces O
INNER JOIN Products P ON O.ProductID = P.ProductID
GROUP BY O.ProductID, P.ProductName, P.Category;

SELECT * FROM vw_ProductSalesSummary;

/* Create views for analysis */

CREATE VIEW vw_OrderAnalysis AS
SELECT
    O.OrderID,
    O.OrderDate,
    O.CustomerID,
    O.ProductID,
    P.ProductName,
    P.Category,
    CAST(O.Quantity AS INT) AS Quantity,
    CAST(O.Price AS INT) AS Price,
    (CAST(O.Quantity AS INT) * CAST(O.Price AS INT)) AS TotalAmount
FROM ecommerces O
INNER JOIN Products P ON O.ProductID = P.ProductID;


SELECT * FROM vw_OrderAnalysis;
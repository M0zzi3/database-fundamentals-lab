-- .Exercise 1
SELECT COUNT(*)
           AS NbrOfOrdersOnTime
    FROM Orders
    WHERE DATEDIFF(DAY, RequiredDate, ShippedDate) <= 0;
SELECT COUNT(*)
           AS NbrOfOrdersLate
    FROM Orders
    WHERE DATEDIFF(DAY, RequiredDate, ShippedDate) > 0;

-- .Exercise 2
SELECT YEAR(RequiredDate)                            AS Year,
       CustomerID
        ,
       AVG(DATEDIFF(DAY, RequiredDate, ShippedDate)) AS DIFF
    FROM Orders
    GROUP BY YEAR(RequiredDate), CustomerID
    HAVING AVG(DATEDIFF(DAY, RequiredDate, ShippedDate)) < 0
    ORDER BY CustomerID, YEAR(RequiredDate), DIFF

-- .Exercise 3
SELECT ProductName
    FROM Products
    WHERE CurrentUnitPrice > (SELECT AVG(CurrentUnitPrice)
                                  FROM Products)
    ORDER BY ProductName

-- .Exercise 4
SELECT ProductName,
       CurrentUnitPrice,
       CurrentUnitPrice - (SELECT AVG(CurrentUnitPrice)
                               FROM Products) AS DIfference
    FROM Products
    WHERE CurrentUnitPrice - (SELECT AVG(CurrentUnitPrice)
                                  FROM Products) > 50
       OR CurrentUnitPrice - (SELECT AVG(CurrentUnitPrice)
                                  FROM Products) < 0
    ORDER BY DIfference DESC

-- .Exercise 5
SELECT CustomerID,
       OrderID,
       DATEDIFF(DAY, ShippedDate, RequiredDate) * -1 AS DIFF
    FROM Orders
    WHERE DATEDIFF(DAY, ShippedDate, RequiredDate) IN (SELECT TOP 3 DATEDIFF(DAY, ShippedDate, RequiredDate) AS DIFF
                                                           FROM Orders
                                                           WHERE ShippedDate IS NOT NULL
                                                           GROUP BY DATEDIFF(DAY, ShippedDate, RequiredDate)
                                                           ORDER BY DIFF)
    ORDER BY DIFF

-- .Exercise 6
SELECT OrderID,
       MAX(Turnover) - MIN(Turnover) AS [diff],
       MIN(Turnover)                 AS [min-turnover],
       MAX(Turnover)                 AS [max-turnover]
    FROM (SELECT OrderID,
                 ProductID,
                 (UnitPrice * (1 - Discount) * Quantity) AS Turnover
              FROM [Order Details]
              WHERE (UnitPrice * (1 - Discount) * Quantity) > 2000) AS OIPIT
    GROUP BY OrderID
    HAVING COUNT(ProductID) > 1
       AND MAX(Turnover) - MIN(Turnover) > 100
    ORDER BY OrderID

-- .Exercise 7
SELECT ProductName
    FROM Products
    WHERE CurrentUnitPrice >= (SELECT AVG(CurrentUnitPrice) FROM Products) * 0.9
      AND CurrentUnitPrice <= (SELECT AVG(CurrentUnitPrice) FROM Products) * 1.1

-- .Exercise 8
SELECT City,
       COUNT(CustomerID) AS Customers
    FROM Customers
    GROUP BY City
    HAVING COUNT(CustomerID) = (SELECT MIN(Customers)
                                    FROM (SELECT COUNT(CustomerID) AS Customers
                                              FROM Customers
                                              GROUP BY City) AS CC)

-- ..Exercise 9
SELECT CompanyName,
       City
    FROM Customers
    WHERE City IN (SELECT City
                       FROM Customers
                       GROUP BY City
                       HAVING COUNT(CustomerID) = (SELECT MIN(Customers)
                                                       FROM (SELECT COUNT(CustomerID) AS Customers
                                                                 FROM Customers
                                                                 GROUP BY City) AS CC))

-- .Exercise 10
SELECT OrderID,
       EmployeeID,
       DATEDIFF(DAY, OrderDate, ShippedDate)                       AS [Order-Shipped],
       (DATEDIFF(DAY, OrderDate, ShippedDate)) - (SELECT AVG(
                                                                 DATEDIFF(DAY, OrderDate, ShippedDate))
                                                      FROM Orders) AS [DIFF-AVG]
    FROM Orders
    WHERE DATEDIFF(DAY, OrderDate, ShippedDate) > 30
    ORDER BY EmployeeID

-- .Exercise 11
SELECT OrderID,
       EmployeeID,
       DATEDIFF(DAY, OrderDate, ShippedDate)                       AS [Order-Shipped],
       (DATEDIFF(DAY, OrderDate, ShippedDate)) - (SELECT AVG(DATEDIFF(DAY, OrderDate, ShippedDate))
                                                      FROM Orders) AS [DIFF-AVG]
    FROM Orders
    WHERE DATEDIFF(DAY, OrderDate, ShippedDate) > 30
      AND DATEDIFF(DAY, OrderDate, ShippedDate) =
          (SELECT MAX(DATEDIFF(DAY, OrderDate, ShippedDate)) FROM Orders)

-- .Exercise 12
SELECT ProductID
    FROM [Order Details]
    WHERE Discount < (SELECT AVG(Discount)
                          FROM [Order Details])
      AND (1 - Discount) * UnitPrice > (SELECT AVG(UnitPrice * (1 - Discount))
                                            FROM [Order Details])
    GROUP BY ProductID
    ORDER BY ProductID





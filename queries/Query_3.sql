SELECT CategoryID
    FROM Categories
    WHERE CategoryName = 'beverages';

SELECT *
    FROM Products
    WHERE CategoryID = 1;

SELECT *
    FROM Products
    WHERE CategoryID IN (SELECT CategoryID
                             FROM Categories
                             WHERE CategoryName = 'beverages'
                                OR CategoryName = 'Produce');

SELECT CompanyName
    FROM Customers
    WHERE CustomerID IN
          (SELECT CustomerID
               FROM Orders
               WHERE OrderID IN
                     (SELECT OrderID
                          FROM [Order Details]
                          WHERE ProductID =
                                (SELECT ProductID
                                     FROM products
                                     WHERE ProductName = 'Ikura')));

SELECT CompanyName, COUNT(*)
    FROM Customers C,
         Orders O
    GROUP BY CompanyName;

SELECT CompanyName,
       (SELECT COUNT(*)
            FROM Orders O
            WHERE O.CustomerID = C.CustomerID) AS Total
    FROM Customers C;


SELECT DISTINCT CompanyName,
                (SELECT SUM(UnitPrice * Quantity)
                     FROM [ORDER DETAILS]
                     WHERE OrderID IN
                           (SELECT OrderID
                                FROM Orders o
                                WHERE o.CustomerID = c.CustomerID))
                    AS turnover
    FROM Customers c
    ORDER BY turnover DESC;



SELECT CompanyName, ContactName
    FROM Suppliers AS s
    WHERE CompanyName IN
          (SELECT s.CompanyName
               FROM Customers AS c
               WHERE s.Country = c.Country);


SELECT CompanyName, ContactName
    FROM Suppliers AS s
    WHERE EXISTS
              (SELECT *
                   FROM Customers AS c
                   WHERE s.Country = c.Country);


INSERT INTO newTable (column_name_1, column_name_2, ...)
SELECT column_name_1,
       column_name_2, ...
    FROM TABLE
    WHERE CONDITION;
INSERT INTO tmpCustomersB (CompanyName, ContactName, ContactTitle)
SELECT CompanyName, ContactName, ContactTitle
    FROM Customers
    WHERE country LIKE 'B%;
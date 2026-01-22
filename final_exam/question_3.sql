USE Northwind2019;
SELECT CompanyName
    FROM Customers
    WHERE CustomerID IN (SELECT CustomerID
                             FROM Orders
                             WHERE (OrderID IN (SELECT OrderID
                                                    FROM [Order Details]
                                                    WHERE ProductID IN (SELECT ProductID
                                                                            FROM Products
                                                                            WHERE CategoryID IN
                                                                                  (SELECT CategoryID
                                                                                       FROM Categories
                                                                                       WHERE (CategoryName = 'Beverages')
                                                                                          OR (CategoryName = 'Confections')))))
                               AND (
                                 OrderID IN (SELECT OrderID
                                                 FROM Orders
                                                 WHERE ShippedDate IS NOT NULL
                                                 GROUP BY OrderID)
                                 )
                             GROUP BY CustomerID);
USE Northwind2019;
SELECT E.LastName, ET.[Number of Orders]
    FROM Employees AS E
             JOIN (SELECT EmployeeID AS EmpID, COUNT(OrderID) AS [Number of Orders]
                       FROM Orders
                       GROUP BY EmployeeID
                       HAVING COUNT(OrderID) LIKE (SELECT TOP (1) COUNT(OrderID) AS CO
                                                       FROM Orders
                                                       GROUP BY EmployeeID
                                                       ORDER BY CO DESC)) ET ON E.EmployeeID = ET.EmpID

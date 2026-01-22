SELECT * FROM Customers;



SELECT C.CompanyName,
       ROUND(SUM(OD.UnitPrice * (1 - OD.Discount) * OD.Quantity), 0) AS TotalAmount
    FROM Orders O
             JOIN
         Customers C ON C.CustomerID = O.CustomerID
             JOIN
         [Order Details] OD ON O.OrderID = OD.OrderID
    GROUP BY C.CompanyName
    ORDER BY CompanyName;

SELECT OD.OrderID
    FROM [Order Details] OD
             JOIN
         Products P ON OD.ProductID = P.ProductID
    WHERE P.ProductName = 'Chang' -- Filter orders that contain 'Chang'
    GROUP BY OD.OrderID
    HAVING COUNT(CASE WHEN P.ProductName = 'Tofu' THEN 1 END) = 0 -- Exclude orders that also contain 'Tofu'
    ORDER BY OD.OrderID;

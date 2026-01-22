SELECT P.CategoryID,
       P.ProductName,
       C.CategoryID,
       C.CategoryName
    FROM Products P,
         Categories C
    WHERE P.CategoryID = C.CategoryID;

SELECT P.CategoryID,
       P.ProductName,
       C.CategoryID,
       C.CategoryName
    FROM Products p
             INNER JOIN Categories c
                        ON (P.CategoryID = C.CategoryID);



SELECT * FROM Categories

SELECT * FROM Products ORDER BY CategoryID

SELECT CategoryName, ProductName
    FROM Products P
             RIGHT OUTER JOIN Categories C ON (C.CategoryID = P.CategoryID)


SELECT C.CompanyName Customer, S.CompanyName Shipper
    FROM Customers C
             INNER JOIN Orders O
             INNER JOIN Shippers S ON O.ShipVia = S.ShipperID
                        ON C.CustomerID = O.CustomerID;


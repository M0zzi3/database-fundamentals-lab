SELECT CustomerID, EmployeeID, COUNT(*) Amount, SUM(Freight) TotalFreight
    FROM Orders
    GROUP BY CustomerID, EmployeeID
    ORDER BY CustomerID;

SELECT SupplierID, AVG(CurrentUnitPrice) AS AvgOfCurrentUnitPrice
    FROM Products
    WHERE UnitsOnOrder <> 0
    GROUP BY SupplierID
    HAVING AVG(CurrentUnitPrice) > 20
    ORDER BY AVG(CurrentUnitPrice);

SELECT lastname, title, city
    FROM Employees
    WHERE (City = 'London' OR City = 'Redmond')
      AND Title = 'sales representative';

SELECT lastname, title, city
    FROM Employees
    WHERE City = 'London'
       OR City = 'Redmond'
        AND Title = 'sales representative';

SELECT Title, COUNT(*) Nbr
    FROM Employees
    WHERE DATEPART(YY, BirthDate) < 1992
    GROUP BY title
    HAVING COUNT(*) > 1;
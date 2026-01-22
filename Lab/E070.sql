-- 1. Which products are supplied by the supplier 'Pavlova, ltd.' (Tables to use: Products and Suppliers)
SELECT *
    FROM Products
    WHERE SupplierID LIKE (SELECT SupplierID
                               FROM S
                                   uppliers
                               WHERE CompanyName LIKE 'Pavlova%');
-- 2. How much 'Tofu' was sold (quantities)? You find this info in the Order Details Table.
SELECT SUM(Quantity)
    FROM [Order Details]
    WHERE ProductID = (SELECT ProductID
                           FROM Products
                           WHERE ProductName = 'Tofu');
-- 3. How many orders were taken by the employee Robert King in May 2017? (Tables to use: Orders and
-- Employees)
SELECT COUNT(OrderID) AS nbr_of_orders_of_King
    FROM Orders
    WHERE OrderDate >= '2017-05-01'
      AND OrderDate < '2017-06-01'
      AND EmployeeID = (SELECT EmployeeID
                            FROM Employees
                            WHERE FirstName = 'Robert'
                              AND LastName = 'King');
-- 4. Which products of category 'Confections' are currently on order? You should test on the column
-- UnitsOnOrder (Tables to use: Products and Categories)
SELECT ProductID, ProductName, UnitsOnOrder
    FROM Products
    WHERE CategoryID = (SELECT CategoryID
                            FROM Categories
                            WHERE CategoryName = 'Confections')
      AND UnitsOnOrder NOT LIKE '0'
-- 5. Show the names of all products having the same unit price as 'Chang'. (Tables to use: ONLY Products)
SELECT ProductName
    FROM Products
    WHERE CurrentUnitPrice = (SELECT CurrentUnitPrice
                                  FROM Products
                                  WHERE ProductName = 'Chang')
      AND ProductName != 'Chang'
-- 6. Show a list of the products costing more than 'Tofu'. (Tables to use: ONLY Products)
SELECT ProductName
    FROM Products
    WHERE CurrentUnitPrice > (SELECT CurrentUnitPrice
                                  FROM Products
                                  WHERE ProductName = 'Tofu')
-- 7. Display a list of all customers who have placed more than 15 orders. (Tables to use: No hint)
SELECT CompanyName
    FROM Customers
    WHERE CustomerID IN (SELECT CustomerID
                             FROM Orders
                             GROUP BY CustomerID
                             HAVING COUNT(OrderID) > 15)
-- 8. Who was hired most recently (multiple people possible)? (Tables to use: No hint)
SELECT LastName
    FROM Employees
    WHERE HireDate IN (SELECT TOP (1) HireDate
                           FROM Employees
                           ORDER BY HireDate DESC)
-- 9. Which products have so far (never) been sold? So they do not appear in Order Detail. (Tables to use: No hint)
SELECT *
    FROM Products
    WHERE ProductID NOT IN (SELECT ProductID
                                FROM [Order Details]
                                GROUP BY ProductID)
-- 10. What is, in terms of money, the largest order lines ever placed (largest order = Discounted Price x Quantity) ? (Tables to use: No hint)
SELECT OrderID,
       ProductID,
       UnitPrice * (1 - Discount) * Quantity AS LargestTurnover
    FROM [Order Details]
    WHERE (UnitPrice * (1 - Discount) * Quantity) LIKE (SELECT MAX(UnitPrice * (1 - Discount) * Quantity)
                                                            FROM [Order Details])
-- 11. From which city do most customers come from? Make a subquery for this city. And then show this
-- city with the names of the customers. (Do not use the name of the city in your querry!) (Tables to use:
-- No hint)
SELECT City, CompanyName
    FROM Customers
    WHERE City = (SELECT TOP (1) City
                      FROM Customers
                      GROUP BY City
                      ORDER BY COUNT(CompanyName) DESC)
-- 12. Display the product with the highest unit price. (Tables to use: No hint)
SELECT ProductName
    FROM Products
    WHERE CurrentUnitPrice LIKE (SELECT MAX(CurrentUnitPrice)
                                     FROM Products)
-- 13. Show the products that appear more than 50 times on an order line. Show the names of these
-- products. (Tables to use: No hint)
SELECT ProductName
    FROM Products
    WHERE ProductID IN (SELECT ProductID
                            FROM [Order Details]
                            GROUP BY ProductID
                            HAVING COUNT(OrderID) > 50)
-- 14. Which customers do not have outstanding orders; show their names. (Tables to use: No hint)
SELECT CompanyName
    FROM Customers
    WHERE CustomerID NOT IN (SELECT CustomerID
                                 FROM Orders)
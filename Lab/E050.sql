-- 1. Show the oldest recruitment date per job. And sort by earliest hire date.
SELECT Title,
       MIN(HireDate)
    FROM Employees
    GROUP BY Title
    ORDER BY MIN(HireDate);
-- 2. What is the average unit price and average quantity for each of the products sold (look for details in
-- Order Details).
SELECT ProductID,
       AVG(UnitPrice) AS AvgUnitPrice,
       AVG(Quantity)  AS AvgQty
    FROM [Order Details]
    GROUP BY ProductID;
-- 3. How many suppliers are there for Japan and USA. Show the country with the largest number of
-- suppliers first.
SELECT Country,
       COUNT(SupplierID) AS NbrSuppliers
    FROM Suppliers
    WHERE Country LIKE 'USA'
       OR Country LIKE 'Japan'
    GROUP BY Country
    ORDER BY COUNT(SupplierID) DESC;
-- 4. Count the number of employees per city, but only show the cities with more than 1 employee.
SELECT City,
       COUNT(EmployeeID) AS NbrEmployees
    FROM Employees
    GROUP BY City
    HAVING COUNT(EmployeeID) > 1;
-- 5. What is the maximum and minimum unit price per CategoryId. Use appropriate column names. (in
-- Products table)
SELECT CategoryID,
       MAX(CurrentUnitPrice) AS MaxPrice,
       MIN(CurrentUnitPrice) AS MinPrice
    FROM Products
    GROUP BY CategoryID;
-- 6. Show the average number of units in stock per CategoryId for the products more expensive than 10, -.
-- Show only the categories for which the average number is greater than 40.
SELECT CategoryID,
       AVG(UnitsInStock) AS AvgUnitsInStock
    FROM Products
    GROUP BY CategoryID
    HAVING AVG(UnitsInStock) > 40;
-- 7. Show an overview of the customers (id is sufficient) ordered according to the number of orders
-- placed. If this number is less than 10, customers should not appear in the list.
SELECT CustomerID,
       COUNT(OrderID) AS nbr_of_orders
    FROM Orders
    GROUP BY CustomerID
    HAVING COUNT(OrderID) >= 10
    ORDER BY COUNT(OrderID) DESC;
-- 8. On closer inspection, a list of the 3 customers with the highest turnover would be better. Adjust
-- previous query and just include the 3 best customers.
SELECT TOP (3) CustomerID,
               COUNT(OrderID) AS nbr_of_orders
    FROM Orders
    GROUP BY CustomerID
    HAVING COUNT(OrderID) >= 10
    ORDER BY COUNT(OrderID) DESC;
-- 9. For the annual planning, the Purchasing department wants an overview of the top days in 2016 with a
-- total sales volume of more than 1 order per day.
SELECT OrderDate,
       COUNT(OrderID) AS nbr_of_Orders
    FROM Orders
    WHERE YEAR(OrderDate) LIKE 2016
    GROUP BY OrderDate
    HAVING COUNT(OrderID) > 1;
-- 10. The report above is not satisfactory. It would be more interesting to trace the top month. Adjust the
-- query to show only the best month with the number of orders. Make sure the month is written full!
-- Do this for 2018
SELECT TOP (1) DATENAME(MONTH, OrderDate) AS Top_month,
               COUNT(OrderID)             AS NbrOfOrders
    FROM Orders
    WHERE YEAR(OrderDate) = 2018
    GROUP BY MONTH(OrderDate), DATENAME(MONTH, OrderDate)
    HAVING COUNT(OrderID) > 1
    ORDER BY NbrOfOrders DESC;








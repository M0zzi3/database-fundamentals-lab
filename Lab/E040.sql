-- 1. How many customers are there? Give a suitable name to the column.
SELECT COUNT(CustomerID)
           AS Customers
    FROM Customers;
-- 2. And how many customers are living in Germany?
SELECT COUNT(CustomerID)
           AS Customers
    FROM Customers
    WHERE Country
              LIKE 'Germany';
-- 3. How many products were ordered (unitsOnOrder) with the suppliers (look in PRODUCTS Table)?
SELECT SUM(UnitsOnOrder)
    FROM Products;
-- 4. What is the average unit cost of the products that are currently not on order with the suppliers?
-- These can be identified by having a UnitsOnOrder equal to 0.
SELECT AVG(CurrentUnitCost)
           AS [Average Unit Cost]
    FROM Products
    WHERE UnitsOnOrder = 0;
-- 5. Show the maximum discount granted ever for a product (that has been) ordered by a customer (info
-- in [Order Details]).
SELECT MAX(Discount)
    FROM [Order Details];
-- 6. Show the total value of all the orders of the customers, discount included.
-- Round in a second step this number to an integer.
SELECT ROUND(SUM(UnitPrice * (1 - Discount) * Quantity), 2)
    FROM [Order Details];
-- 7. Show a list of OrderId, UnitPrice, Quantity and Total based on the Order details table. Total is a
-- column that is calculated on the basis of UnitPrice and Quantity. We want to see as title ‘Turnover’
-- at the top of the calculated column.
SELECT OrderID,
       CAST(ROUND(UnitPrice, 2)
           AS DECIMAL(10, 2)) AS UnitPrice,
       Quantity,
       CAST(ROUND(UnitPrice * Quantity, 2)
           AS DECIMAL(10, 2))
                              AS TurnOover
    FROM [Order Details]
-- 8. Display a list of the names of the employees with the age (approximately) at which they were
-- recruited with an appropriate column title.
SELECT LastName,
       FirstName,
       YEAR(HireDate) - YEAR(BirthDate)
           AS AgeHired
    FROM Employees
-- 9. Display a list of the product names, unit price, new price based on the Products table. The new price is
-- obtained by a 2% increase on the unit price.
SELECT ProductName,
       CurrentUnitPrice,
       CurrentUnitPrice * 1.02
           AS UnitPriceIncrease
    FROM Products
-- 10. Show the same list again but with the new price (increase of 2%) rounded to 0 decimal places.
SELECT ProductName,
       CurrentUnitPrice,
       CAST(ROUND(CurrentUnitPrice * 1.02, 0)
           AS DECIMAL(10, 0))
           AS UnitPriceIncrease
    FROM Products
-- 11. Based on exercise 10, show the names of the products of which the new price will exceed 50.
SELECT ProductName,
       CAST(ROUND(CurrentUnitPrice * 1.02, 0)
           AS DECIMAL(10, 0))
           AS NewUnitPrice
    FROM Products
    WHERE ROUND(CurrentUnitPrice * 1.02, 0) > 50
-- 12.Of how many employees do we know the region?
SELECT COUNT(EmployeeID)
           AS [Nbr of regions]
    FROM Employees
    WHERE Region IS NOT NULL
-- 13. Show for each employee his new identification code consisting of the first 2 letters of his family
-- name and the first letter of his first name, all in capital letters. Use an appropriate column title.
SELECT UPPER(SUBSTRING(LastName, 1, 2)) + SUBSTRING(FirstName, 1, 1)
           AS empCode
    FROM Employees

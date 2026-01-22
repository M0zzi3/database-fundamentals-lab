-- 1. Show all the data from the Product table.
SELECT *
    FROM Products;
-- 2. Show all the data from the Customers table.
SELECT *
    FROM Customers
-- 3. Show company name, contact name and country from the Customers table.
SELECT CompanyName
     , ContactName
     , Country
    FROM Customers
-- 4. Show all Shippers (courier companies) sorted by name.
SELECT *
    FROM Shippers
    ORDER BY CompanyName;
-- 5. Show company name, country and city from the Customers table. Sort by country and then by city.
SELECT CompanyName
     , Country
     , City
    FROM Customers
    ORDER BY Country
           , City
-- 6. Show all data of the first 3 records of Categories. -- why should we consider this to be a "bad"question?
SELECT TOP (3) *
    FROM Categories;
-- 7. Show all countries from the Suppliers table. Each country must only occur once.
SELECT Country
    FROM Suppliers
    GROUP BY Country;
-- 8. Display all countries and contact titles from the Suppliers table. Each combination must be unique.
SELECT Country
     , ContactTitle
    FROM Suppliers
    GROUP BY Country
           , ContactTitle;
-- 9. Show all dates on which at least one order was registered. Each date must be unique.
SELECT OrderDate
    FROM Orders
    GROUP BY OrderDate;
-- 10. Sort the table Employees descending on country and ascending on city. Then, from the first record, show name and first name
SELECT TOP (1) LastName, FirstName
    FROM Employees
    ORDER BY Country DESC;
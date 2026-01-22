-- 0. At what (different) unitprices has Chai been sold?
SELECT UnitPrice
    FROM [Order Details]
    WHERE ProductID LIKE (SELECT ProductID
                              FROM Products
                              WHERE ProductName LIKE 'Chai')
    GROUP BY UnitPrice;
-- 1. Show the LastName and FirstName of the 'Mr.' employees. Try to find out what the column title name
-- is, that contains these ‘Mr.’ entries.
SELECT LastName
     , FirstName
    FROM Employees
    WHERE TitleOfCourtesy LIKE 'Mr.';
-- 2. Show all the details of the orders placed after 10 July 2016.
-- => 1212 rows
SELECT *
    FROM Orders
    WHERE OrderDate > '2016-07-10';
-- 3. Same as question 2., but now ordered by ID of the customer.
SELECT *
    FROM Orders
    WHERE OrderDate > '2016-07-10'
    ORDER BY CustomerID;
-- 4. Which customers are located in Paris? Make an alphabetical list of the company names of these customers.
SELECT CompanyName
    FROM Customers
    WHERE City LIKE 'Paris'
    ORDER BY CompanyName;
-- 5. Which employees started working after 1 January 2014? Make a list of those employees with the
-- surname, job title and date of employment.
SELECT Lastname
     , Title
     , hireDate
    FROM Employees
    WHERE HireDate > '2014-01-01'
-- 6. A customer asks information about an order of 4 October 2016. The financial service wants to see all
-- the details of that order. Because an order consists of a record in the Order Table (Orders) and the
-- associated order lines (details) from the table
SELECT *
    FROM [Order Details]
    WHERE OrderID LIKE (SELECT OrderID
                            FROM Orders
                            WHERE OrderDate = '2016-10-04');
-- 8. For which employees (surname and first name) is the region unknown?
SELECT LastName, FirstName, Region
    FROM Employees
    WHERE Region IS NULL;
-- 9. Show address details of all customers whose zip code starts with a W
SELECT ContactName, Address, PostalCode, Country
    FROM Customers
    WHERE PostalCode LIKE 'W%';
-- 10. Show address details for all customers whose second character of the zip code is A or X, sort by
-- country and then by postcode but when sorting refer to the place in the SELECT list.
SELECT CompanyName, Address, PostalCode, Country
    FROM Customers
    WHERE PostalCode LIKE '_A%'
       OR PostalCode LIKE '_X%'
    ORDER BY Country, PostalCode;
-- 11. Show name of the suppliers whose fax is not known. Sort by company name Z->A.
SELECT CompanyName
    FROM Suppliers
    WHERE Fax IS NULL
    ORDER BY CompanyName DESC;
-- 12. The same as the previous question, but where the fax is known.
SELECT CompanyName
    FROM Suppliers
    WHERE Fax IS NOT NULL
    ORDER BY CompanyName DESC;



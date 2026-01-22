-- 1. Show all the data, as depicted below, of the 'Sales' customers (ie. ContactTitle starts with ‘Sales …’)
-- located in Germany and France.
SELECT CustomerID,
       CompanyName,
       ContactName,
       ContactTitle,
       Address
    FROM Customers
    WHERE (Country LIKE 'France'
        OR Country LIKE 'Germany')
      AND ContactTitle LIKE 'Sales%';
-- 2. Show all customer data except the data from previous exercise.
SELECT City,
       Region,
       PostalCode,
       Phone,
       Fax
    FROM Customers
    WHERE (Country LIKE 'France'
        OR Country LIKE 'Germany')
      AND ContactTitle LIKE 'Sales%';
-- 3. Show the data of the female 'Sales representatives' (employees) and of the male 'Sales managers'.
SELECT LastName,
       Title,
       TitleOfCourtesy
    FROM Employees
    WHERE (TitleOfCourtesy LIKE 'Mr.' AND Title LIKE 'Sales Manager')
       OR ((TitleOfCourtesy LIKE 'Mrs.' OR TitleOfCourtesy LIKE 'Ms.')
        AND Title LIKE 'Sales Representative');
-- 4. Show all customers (company name and contact name) where the contact name starts or ends with
-- an A (a).
SELECT CompanyName,
       ContactName
    FROM Customers
    WHERE ContactName LIKE 'A%'
       OR ContactName LIKE '%A';
-- 5. Show all customers where fax or telephone is not entered. =>22 rows
SELECT * FROM Customers WHERE Fax IS NULL;
-- 6. Show all of the following products: CHAI, KONBU, TOFU sorted descending by name for the below
-- table.
SELECT *
    FROM Products
    WHERE ProductName LIKE 'CHAI'
       OR ProductName LIKE 'KONBU'
       OR ProductName LIKE 'TOFU'
    ORDER BY ProductName DESC;
-- 7. Show all orders for which the shippeddate is between 8 September and 9 October 2016. => 22 rows
SELECT *
    FROM Orders
    WHERE ShippedDate >= '2016-09-08'
      AND ShippedDate <= '2016-10-09';
-- 8. Show products that are sold per 10 or 32 units but for which the stock quantity > 10. (first have a look
-- at the format of the QuantityPerUnit).
SELECT ProductName,
       QuantityPerUnit,
       UnitsInStock
    FROM Products
    WHERE (QuantityPerUnit LIKE '10 %'
        OR QuantityPerUnit LIKE '32 %')
      AND UnitsInStock > 10;
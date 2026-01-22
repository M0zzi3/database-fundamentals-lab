-- 1. Copy the complete table Products to tmpProducts according to the above method.
SELECT *
    INTO tmpProducts
    FROM Products;
-- 2. Make a copy of Orders, and call it Orders2.
SELECT *
    INTO Orders2
    FROM Orders;
-- 3. There is no longer any cooperation with Belgium. Remove all records from Orders2 shipped to
-- Belgium.
DELETE
    FROM Orders2
    WHERE ShipCountry = 'Belgium';
-- 4. Create a new food products table "Foodstuffs" that contains the names and current unit price of all
-- products from the category 'seafood' (= categoryid 8) and 'beverages' (= categoryid 1).
SELECT ProductName, CurrentUnitPrice
    INTO Foodstuffs
    FROM Products
    WHERE CategoryID = '8'
       OR CategoryID = '1';
-- 5. Add all products (names and unit price) from category 'Condiments' (= categoryid 2) to the table
-- Foodstuffs.
INSERT INTO Foodstuffs (ProductName, CurrentUnitPrice)
SELECT ProductName, CurrentUnitPrice
    FROM Products
    WHERE CategoryID = '2';
-- 6. All orders (Orders2) of August 2017 (orderDate) get a shipped date of 10 days later (36 rows are being
-- updated).
UPDATE Orders2
SET ShippedDate = DATEADD(DAY, 10, OrderDate)
    WHERE OrderDate >= '2017-08-01'
      AND OrderDate < '2017-09-01';
-- 7. Make a copy of employees into tmpEmployees.
SELECT *
    INTO tmpEmployees
    FROM employees;
ALTER TABLE tmpEmployees
    ADD salary INT;
-- 8. In tmpEmployees, fill the column salary for everyone with the same standard value: 60.000.
UPDATE tmpEmployees
SET salary = 60000
-- 9. In tmpEmployees, all Sales Managers receive 20% on top of the standard salary (1-person, 72,000).
UPDATE tmpEmployees
SET salary = salary * 1.2
    WHERE Title = 'Sales Manager'
-- 10. In tmpEmployees, given that Anne Dodsworth is still under internship contract, only 10% of her
-- salary will be paid.
UPDATE tmpEmployees
SET salary = salary * 0.1
    WHERE FirstName = 'Anne'
      AND LastName = 'Dodsworth'
-- 11. For Foodstuffs, add the following product: meatballs at a price of 12.
INSERT INTO Foodstuffs (ProductName, CurrentUnitPrice)
    VALUES ('Meatballs', 12)
-- 12. For orders2, add a new order from the customer ANATR handled by seller no. 3 with order date
-- 30/10/2018 and delivery date 30/11/2018
INSERT INTO Orders2 (CustomerID, EmployeeID, OrderDate, RequiredDate)
    VALUES ('ANATR', 3, '2018-10-30', '2018-11-30');
-- 13. The current unit price in tmpProducts increases by 10%.
UPDATE tmpProducts
SET CurrentUnitPrice = CurrentUnitPrice *1.1
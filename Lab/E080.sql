-- 1. Show for each order the name of the employee who is responsible for the order.
-- Show the name and firstname of each employee who is responsible for each order.
SELECT e.FirstName, e.LastName, o.OrderID
    FROM Orders o
             INNER JOIN Employees e ON (o.EmployeeID = e.EmployeeID)
    ORDER BY e.FirstName

-- 2. Show per employee how many orders he/she is responsible for.
SELECT e.FirstName, e.LastName, COUNT(o.OrderID)
    FROM Orders o
             INNER JOIN Employees e ON (o.EmployeeID = e.EmployeeID)
    GROUP BY e.FirstName, e.LastName
    ORDER BY e.LastName

-- 3. For each product (product name), show the name of the category to which the product belongs. Also
-- show the supplier's name for each product.
SELECT p.ProductName, c.CategoryName, s.CompanyName
    FROM Products p
             INNER JOIN Categories c ON (p.CategoryID = c.CategoryID)
             INNER JOIN Suppliers s ON (p.SupplierID = s.SupplierID)
    ORDER BY p.ProductName

-- 4. Show by order: company name of the customer + first name and name of the employee who placed
-- the order.
SELECT CompanyName, FirstName, LastName
    FROM Orders
             INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
             INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID
    ORDER BY CompanyName

-- 5. Display the names of all customers, with the IDs of their orders (delivered and outstanding). All
-- customers are shown, even if they do not have orders. Sort by orderid. What do you notice?
SELECT CompanyName, OrderID
    FROM Customers
             LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
    ORDER BY OrderID

-- 6. Show for all customers how many orders (delivered and outstanding) they have and sort the result by
-- "number of orders" from small to large.
SELECT CompanyName, COUNT(OrderID)
    FROM Customers
             LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
    GROUP BY CompanyName
    ORDER BY COUNT(OrderID)

-- 7. Show the names of all employees and also the names of the territories in which they are active. The
-- tables involved are: Employees, EmployeeTerritories, Territories.
SELECT e.FirstName, e.LastName, t.TerritoryDescription
    FROM EmployeeTerritories et
             INNER JOIN Employees e ON et.EmployeeID = e.EmployeeID
             INNER JOIN Territories t ON et.TerritoryID = t.TerritoryID

-- 8. Show per employee how many territories he/she has.
SELECT e.FirstName, e.LastName, COUNT(t.TerritoryDescription)
    FROM EmployeeTerritories et
             INNER JOIN Employees e ON et.EmployeeID = e.EmployeeID
             INNER JOIN Territories t ON et.TerritoryID = t.TerritoryID
    GROUP BY e.FirstName, e.LastName

-- 9. Display the names of all territories, with the first name and the name of the responsible employee.
-- Show also those territories that have no responsible employee.
SELECT t.TerritoryDescription, e.FirstName, e.LastName
    FROM Territories t
             LEFT JOIN EmployeeTerritories et ON t.TerritoryID = et.TerritoryID
             LEFT JOIN Employees e ON et.EmployeeID = e.EmployeeID
    ORDER BY t.TerritoryDescription

SELECT e.LastName, e.FirstName, sum(c.CustomerID)
    FROM Orders o
             JOIN Employees e ON e.EmployeeID = o.EmployeeID
             JOIN Customers c ON c.CustomerID = o.CustomerID
    GROUP BY e.LastName, e.FirstName
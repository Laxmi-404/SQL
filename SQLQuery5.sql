--Set Operator
SELECT 
--CustomerId,
--All queries combined using a UNION, INTERSECT or EXCEPT operator must have an equal number of expressions in their target lists.
--customerId is int and FirstName is varchar(50)
FirstName AS FN,
LastName
FROM Sales.Customers

UNION

SELECT
FirstName,
LastName AS LN
--IGNORED:LN
FROM Sales.Employees

--UNION
--COMBINE THE DATA FROM EMPLOYEES AND CUSTOMERS INTO ONE TABLE
SELECT 
FirstName,
LastName
FROM Sales.Customers
UNION
SELECT
FirstName,	
LastName
FROM Sales.Employees;

--UNION ALL
--COMBINE THE DATA FROM EMPLOYEES AND CUSTOMERS INTO ONE TABLE INCLUDING DUPLICATES
SELECT 
	FirstName,LastName
FROM Sales.Employees
UNION ALL
SELECT 
	FirstName,LastName
FROM Sales.Customers

--EXCEPT
--FIND THE EMPLOYEES WHO ARE NOT CUSTOMERS AT THE SAME TIME
SELECT 
	FirstName,LastName
FROM Sales.Employees
EXCEPT
SELECT 
	FirstName,LastName
FROM Sales.Customers

 --intersect(inner join ki tarah)
--Find the employees who are also customers
SELECT 
FirstName,LastName
FROM Sales.Employees 
INTERSECT
SELECT
FirstName,LastName
FROM Sales.Customers

--Orders are stored in separate tabls order and OrdersArchive
--Combine all orders into on ereport without duplicates
SELECT 
'Orders' AS SourceTable,
       [OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.Orders
UNION
SELECT 
'OrdersArchive' AS SourceTable,
       [OrderID]
      ,[ProductID]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[OrderDate]
      ,[ShipDate]
      ,[OrderStatus]
      ,[ShipAddress]
      ,[BillAddress]
      ,[Quantity]
      ,[Sales]
      ,[CreationTime]
FROM Sales.OrdersArchive

order by ORDERID;
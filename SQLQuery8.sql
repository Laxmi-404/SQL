--CASE STATEMENTS
USE SALESDB
/*
Generate a report showing the total sales for each category:
High if sales are higher than sales,
medium if sales are between 20 and 50,
Low if sales are lower than 20
SORT THE RESULTS FROM LOWEST TO HIGHEST
*/
SELECT
Category,
SUM(Sales) AS TotalSales
FROM(
	SELECT
	OrderId,
	Sales,
	CASE
		When Sales>50 Then 'High'
		When Sales>20 then 'Medium'
		ELSE 'Low'
		--ELSE 1
	END Category
	FROM Sales.Orders)t
GROUP BY Category
ORDER BY TotalSales DESC;

/*
t is just an alias name for the subquery.
It's required in SQL Server when using subqueries in FROM.
You can rename it to something more descriptive if you prefer.
*/
--RETRIEVE EMPLOYEE DETAILS WITH GENDER DISPLAYED AS FULL TEXT
SELECT
EmployeeId,
FirstName,
LastName,
Gender,
CASE 
WHEN GENDER='F' THEN 'Female'
WHEN GENDER='M' THEN 'Male'
Else 'NOT AVAILABLE'
END GENDERFULLTEXT
FROM Sales.Employees

--RETRIEVE CUSTOMER DETAILS WITH ABBREVIATED COUNTRY CODE
SELECT
CustomerId,FirstName,LastName,
Country,
/*
CASE
WHEN COUNTRY='GERMANY' THEN 'DE'
WHEN COUNTRY='USA' THEN 'US'
ELSE 'N/A'
END Countryabbreviation
*/
CASE COUNTRY
WHEN 'GERMANY' THEN 'DE'
WHEN 'USA' THEN 'US'
ELSE 'N/A'
END Countryabbreviation
FROM Sales.Customers

SELECT DISTINCT Country
FROM Sales.Customers

--FIND THE AVERAGE SCORES OF CUSTOMERS AND TREATS NULLS AS 0 AND GIVE CUSTOMERID AND LAST NAME
SELECT
CUSTOMERID,
LASTNAME,
SCORE ,
CASE 
WHEN Score IS NULL THEN 0
ELSE Score
END Scoreclean,
AVG(CASE 
WHEN Score IS NULL THEN 0
ELSE Score
END) OVER() AvgCustomerClean,
AVG(Score) OVER () AvgCustomer
FROM Sales.Customers

--COUNT HOW MANY TIMES EACH CUSTOMER HAS MADE AN ORDER WITH SALES GREATER THAN 30
SELECT
--orderid
CustomerId,
--Sales,
Sum(CASE 
WHEN Sales>30 THEN 1
ELSE 0 
END)
 TotalOrdersHighSales,
COUNT(*) TotalOrders
FROM Sales.Orders
GROUP BY CustomerId;
--ORDER BY CustomerId

--Column 'Sales.Orders.OrderID' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.
USE MYDATABASE
--AGGREGATE FUNCTIONS
--FIND THE TOTAL NUMBER OF ORDERS
--FIND THE AVERAGE SALES OF ALL ORDERS
--Find the highest score among customers
--Find the LOWest score among customers
SELECT
Customer_id,
COUNT(*) AS TOTAL_NO_OF_ORDERS,
SUM(Sales) AS total_Sales,
AVG(SALES) AS avg_Sales,
MAX(SALES)AS HIGHEST_SALES,
MIN(Sales) AS lowest_sales
FROM Orders
GROUP BY Customer_id
--This will throw an error if your SQL mode or server is strict, because:You can't mix aggregates (COUNT(*)) with raw * without GROUP BY

--ANALYZE THE SCORES IN CUSTOMERS TABLE
SELECT
MAX(SCORE) HIGHEST_SCORE,
MIN(SCORE)LOWEST_SCORE,
COUNT(*) TOTAL_NO_OFT_TIMES_PLAYED,
SUM(Score) TOTAL_SCORE
FROM Customers

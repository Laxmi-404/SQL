--STRING FUNCTIONS
/*
--Concatenate first name and country into one column
SELECT 
first_name,
country,CONCAT(first_name,'-',country) AS name_country
FROM Customers;

SELECT 
CONCAT(first_name,'-',country) AS name_country
FROM Customers;

--UPPER AND LOWER
--Convert the first name to lowercase
SELECT
LOWER(first_name) AS lower_name
FROM Customers;

--Convert the first name to uppercase
SELECT 
UPPER(first_name) AS upper_name
FROM Customers;

--TRIM
--Find the customers whose first_name contains leading or trailing spaces(detect spaces)
SELECT 
first_name,LEN(first_name) len_name,
LEN(TRIM(first_name)) len_trim_name,
LEN(first_name)-LEN(TRIM(first_name)) flag
FROM Customers
WHERE LEN(first_name)!=LEN(TRIM(first_name))
--WHERE first_name!=TRIM(first_name);

--REPLACE
--REMOVE DASHES FROM PHONE NUMBER
SELECT 
'123-456-7890' AS phone,
--REPLACE('123-456-7890','-','' ) AS clean_phone
REPLACE('123-456-7890','-','/' ) AS clean_phone

--Replace File Existence from txt to csv
SELECT
'report.txt'AS old_file_name,
REPLACE('report.txt','.txt','.csv') AS new_filename;

--LEN
--Calculate the length of each customer's first name
SELECT
first_name,
LEN(first_name) AS len_name
FROM Customers

--Retrieve the first two characters of each first name
SELECT
	first_name,
	LEFT(TRIM(first_name),2) AS first_2_char
FROM Customers

--Retrieve the LAST two characters of each first name
SELECT 
	first_name,
	RIGHT(TRIM(first_name),2) AS last_2_char
FROM  Customers;

--Retrieve a list of customers first name after removing the first character
SELECT
	first_name,
	substring(TRIM(first_name),2,LEN(FIRST_NAME)) AS sub_name
FROM Customers

--NUMBER FUNCTIONS
--ROUND
SELECT 3.516,ROUND(3.516,2)AS ROUND_2,
ROUND(3.516,1) AS ROUND_1,
ROUND(3.516,0) AS ROUND_0

--ABS
SELECT -10,ABS(-10),ABS(10)

--DATE AND TIME FUNCTIONS
SELECT 
OrderId,
OrderDate,
ShipDate,
CreationTime
From Sales.Orders

SELECT 
OrderId,CreationTime,
'2025-08-20' HardCoded,
GETDATE() Today
FROM Sales.Orders

--DATEPART FUNCTIONS,DATETRUNC() AND DATENAME()
SELECT YEAR(CreationTime) YEAR,
MONTH(CreationTime) MONTH,
DAY(CreationTime) DAY,
DATEPART(month,CreationTime)Month_dp,
DATEPART(year,CreationTime)Year_dp,
DATEPART(DAY,CreationTime) Day_dp,
DATEPART(week,CreationTime)Week_dp,
DATEPART(quarter,CreationTime)quarter_dp,
DATEPART(HOUR,CreationTime) Hour_dp,
--DATENAME EXAMPLES
DATENAME(month,CreationTime)Month_dn,
DATENAME(weekday,CreationTime)weekday_dn,
DATENAME(day,CreationTime) Day_dn,
DATENAME(year,CreationTime) Year_dn,
--dataype of day and year in DATENAME is string
OrderId,
CreationTime,
--DATETRUNC FUNCTIONS
DATETRUNC(minute,CreationTime)Minute_dt,
DATETRUNC(day,CreationTime)Day_dt,
DATETRUNC(year,CreationTime)Year_dt 
from Sales.Orders

SELECT
DATETRUNC(month,CreationTime),COUNT(*)
FROM Sales.Orders
GROUP BY DATETRUNC(month,CreationTime)

SELECT DATETRUNC(YEAR,CreationTime),COUNT(*)
From Sales.Orders
GROUP BY DATETRUNC(year,CreationTime)

--EOMONTH()
SELECT OrderId,CreationTime,EOMONTH(CreationTime) EndOfMonth,
CAST(DATETRUNC(MONTH,CREATIONTIME)AS DATE) StartOfMonth 
FROM Sales.Orders
--HOW MANY ORDERS WERE PLACED EACH YEAR?
SELECT 
YEAR(OrderDate),
COUNT(*) NoOfOrders
FROM Sales.Orders
GROUP BY YEAR(OrderDate)
--HOW MANY ORDERS WERE PLACED EACH MONTH?
SELECT
DATENAME(MONTH,ORDERDATE),
COUNT(*) NO_OF_ORDERS,
MONTH(OrderDate)
FROM Sales.Orders
GROUP BY DATENAME(MONTH,ORDERDATE),
MONTH(OrderDate)

--DATA FILTERING
--Show all orders placed during the month of february
SELECT * from Sales.orders
WHERE Month(orderdate)=2
--Where (DATENAME(month,OrderDate)='FEBRUARY')
--SQL Server uses single quotes (') for string literals — not double quotes 
--Double quotes are used for object names (like "ColumnName"), not strings

--You can use double quotes for column names only if:SET QUOTED_IDENTIFIER ON;
--SELECT "Order Date" FROM Sales.Orders
--SQL Server uses square brackets [ ] for column or table names:
--SELECT [Order Date], [Customer Name] FROM Sales.Orders
*/
--Function Comparisons
USE SALESDB
SELECT OrderId,
CreationTime,
FORMAT(CreationTime,'MM-dd-yyyy')USA_STANDARD,
format(CreationTime,'dd-MM-yyyy')Euro_Format,
FORMAT(CreationTime,'dd')dd,
FORMAT(CreationTime,'ddd')ddd,
FORMAT(CreationTime,'dddd')dddd,
FORMAT(CreationTime,'MM') MM,
FORMAT(CREATIONTIME,'MMM')MMM,
FORMAT(CreationTime,'MMMM')MMMM,
FORMAT(123456,'D','fr-FR') 
FROM Sales.Orders

--SHOW THE CREATIONTIME USING THE FOLLOWING FORMAT:DAY WED JAN Q1 2025 12:34:56 PM
SELECT OrderDate,CreationTime,
'Day '+FORMAT(CreationTime,'ddd')+' '+FORMAT(CreationTime,'MMM')+' Q'+DATENAME(quarter,CreationTime)+' '+
FORMAT(CreationTime,'yyyy hh:mm:ss tt') AS CustomFormat
FROM Sales.Orders
--you're concatenating the quarter number (DATEPART) with a string — DATEPART returns an int
--string concatenation (+) in SQL Server expects both sides to be strings.Datepart nahi DATENAME use kiya hai

/*
| Code  | Meaning                | Example (en-US) | Example (fr-FR)                    |
| ----- | ---------------------- | --------------- | ---------------------------------- |
| `'N'` | Number with separators | `1,234.56`      | `1 234,56`                         |
| `'C'` | Currency format        | `$1,234.56`     | `1 234,56 €`                       |
| `'D'` | Decimal integer        | `1234`          | `1234` (used only on **integers**) |
| `'P'` | Percentage             | `12.34%`        | `12,34 %`         

| Style   | Format (USA)                    | Example Output            |
| ------- | ------------------------------- | ------------------------- |
| **100** | mon dd yyyy hh\:mmAM (12hr)     | `Jan  1 2025  1:23PM`     |
| **101** | mm/dd/yyyy                      | `01/01/2025`              |
| **102** | yyyy.mm.dd                      | `2025.01.01`              |
| **103** | dd/mm/yyyy                      | `01/01/2025`              |
| **110** | mm-dd-yyyy                      | `01-01-2025`              |
| **120** | yyyy-mm-dd hh\:mi\:ss (24hr)    | `2025-01-01 13:23:30`     |
| **121** | yyyy-mm-dd hh\:mi\:ss.mmm (ISO) | `2025-01-01 13:23:30.123` |



SELECT FORMAT(OrderDate,'MMM yy'),COUNT(*)
FROM Sales.Orders
GROUP BY FORMAT(OrderDate,'MMM yy')

SELECT 
--CONVERT(INT,'123')AS [String to Int CONVERT],
--CONVERT(Date,'2025-08-20') AS [String to Date Format],
CreationTime,
CONVERT(DATE,CreationTime) AS [DateTime to Date Format],
CONVERT(VARCHAR,CreationTime,101) AS [USA Std.Style:32],
CONVERT(VARCHAR,CreationTime,34)AS [EURO Std. Style:34]
FROM Sales.Orders

--CAST()
SELECT
CAST('123' AS INT) AS [String to INT],
CAST(123 AS VARCHAR)AS [Int to String],
CAST('2025-08-20' AS DATE) AS [String to Date],
CAST('2025-08-20' AS DATETIME2) AS [String to DateTime2],
CreationTime,
CAST(CreationTime AS DATE) AS [DateTime to Date]
FROM Sales.Orders

--DATEADD
SELECT 
OrderId,OrderDate,
DATEADD(year,2,OrderDate) AS TwoYearsLater,
DATEADD(month,3,OrderDate) AS ThreeYearsLater,
DATEADD(day,-10,OrderDate) AS TenDaysBefore
FROM Sales.Orders

--Calculate the age of employees
SELECT
EmployeeId,
BirthDate,
DATEDIFF(year,BirthDate,GETDATE()) Age
FROM  SALES.EMPLOYEES

--FIND THE AVERAGE SHIPPING DURATION IN DAYS FOR EACH MONTH
SELECT 
MONTH(OrderDate) AS OrderDate,
AVG(DATEDIFF(day,OrderDate,ShipDate)) DAY2SHIP
FROM Sales.Orders
GROUP BY Month(OrderDate)

--TIME GAP ANALYSIS
--FIND THE NUMBER OF DAYS BETWEEN EACH ORDER AND PREVIOUS ORDER
SELECT
OrderId,
OrderDate AS CurrentOrderDate,
LAG(OrderDate) OVER(ORDER BY OrderDate) PreviousOrderDate,
DATEDIFF(day,LAG(Orderdate) OVER(Order by OrderDate),OrderDate) NoofDays
FROM Sales.Orders

--ISDATE
SELECT
ISDATE('123') DateCheck1,
ISDATE('2025-08-01') DateCheck2,
ISDATE('20-08-2025') DateCheck3,
ISDATE('2025') DateCheck4,
ISDATE('08') DateCheck5
*/

SELECT
	OrderDate,
	ISDATE(OrderDate),
	CASE WHEN ISDATE(Orderdate)= 1 THEN CAST(OrderDate AS DATE)
		ELSE '9999-01-01'
	END NewOrderDate
FROM (
	SELECT '2025-08-20' AS OrderDate UNION
	SELECT '2025-08-21' UNION 
	SELECT '2025-08-23' UNION
	SELECT '2025-08'
)t
--WHERE ISDATE(OrderDate)=0



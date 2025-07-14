--NULL FUNCTIONS
--ISNULL/COALESCE

--FIND TYHE AVERAGE SCORES OF THE CUSTOMERS
SELECT
CustomerId,
Score,
COALESCE(SCORE,0) SCORE2,
AVG(Score) OVER () AvgScores,
AVG(COALESCE(Score,0)) OVER () AvgScores2
FROM Sales.Customers

/*
Component Breakdown:
AVG(Score): Calculates the average score.

OVER (): The empty OVER() clause means:
"Apply this over all rows in the result set — no partitioning, no ordering."

AS AvgScores: Names the resulting column AvgScores.
*/

/*DISPLAY THE FULL NAME OF THE CUSTOMERS IN A SINGLE FIELD 
BY MERGING THEIR FIRST AND LAST NAMES AND ADD 10 BONUS POINTS TO EACH CUSTOMERS NAME.*/

SELECT CustomerId,FirstName,LastName,
COALESCE(LASTNAME,'') LASTNAME2,
--FIRSTNAME+' '+LASTNAME AS FULLNAME,
FIRSTNAME+' '+ COALESCE(LASTNAME,'') AS FULLNAME,
Score,
--Score+10 AS ScoreWSithBonus
Coalesce(Score,0)+10 AS ScoreWSithBonus 
FROM Sales.Customers

--Sort the customers from lowest to highest scores with nulls appearing last
SELECT
CustomerId,
Score,
COALESCE(Score,99999999)
FROM Sales.Customers
ORDER BY COALESCE(Score,99999999)
/*
Why we use END in a CASE statement
Just like other programming languages use } or endif to 
mark the end of a conditional block, SQL requires the END keyword to tell the engine:
"This is the end of my CASE expression."
*/

SELECT
CustomerId,
Score,
CASE WHEN Score IS NULL THEN 1 ELSE 0 END Flag
FROM Sales.Customers
ORDER BY CASE WHEN Score IS NULL THEN 1 ELSE 0 END,Score

--NULLIF
--FIND THE SALES PRICE FOR EACH ORDER BY DIVIDING THE SALES BY THE QUANTITY
SELECT
OrderId,
Sales,
Quantity,
Sales/NULLIF(Quantity,0) AS Price
FROM Sales.Orders

--Identify the customers who has no scores
SELECT
* 
FROM Sales.Customers
Where score IS NULL

--List all the customers who has cores
SELECT *
FROM Sales.customers
where score IS NOT NULL
             
--LIST ALL THE DETAILS FOR CUSTOMERS WHO HAVE NOT PLACED ANY ORDERS
SELECT
c.*,
o.OrderId
FROM Sales.Customers c
LEFT JOIN Sales.Orders o
ON c.CustomerId=o.CustomerId
WHERE o.CustomerId IS NULL
;


--If WITH is not the first statement in the batch, it must be preceded by a semicolon ;.
--NULL VS EMPTY STRING VS BLANK SPACE
WITH Orders AS (
SELECT 1 Id,'A' AS Category UNION
SELECT 2,NULL UNION
SELECT 3,'' UNION
SELECT 4,'   '
)
SELECT *,DATALENGTH(Category) CATEGORYLEN, TRIM(Category),
DATALENGTH(TRIM(Category) )Policy1 ,
NULLIF(TRIM(CATEGORY),'') POLICY2,
COALESCE(NULLIF(TRIM(CATEGORY),''),'UNKNOWN') POLICY3
FROM Orders

/*
A CTE (Common Table Expression) is a temporary result set defined using the WITH clause.
CTE (WITH Orders AS) creates a temporary result set named Orders.

The CTE contains 4 rows, each with:

An Id (int)

A Category (string)
*/

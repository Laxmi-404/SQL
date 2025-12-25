USE mydatabase
--inline comment
/*This is a comment*/
--Retreives all customer data
SELECT *
FROM customers

Select *
FROM orders
--Retreives all customer name and country and score
Select 
	first_name,country,score
from customers
--Retreives all filtered score data higher than 500
Select * from customers where score>500
Select first_name,country from customers where score>500

--Retrieve customers with score not equal to 0
Select *
From customers 
Where score!=0
--Retrieves customers from Germany
Select * From customers WHere country='Germany'
Select first_name,country From customers WHere country='Germany'
--order by(sorting)
-- Retrieve all customers Sort the results by highest score first.
Select * from customers order by score desc
-- Retrieve all customers Sort the results by lowest score first.
Select *
from customers 
order by score asc

--Nested order by
Select * from customers
order by country asc
--(something wrong seem)
--retrieve all customers and sort the results by country and then by highest score
Select * from customers
order by country asc,score desc
--sequence matters!!
Select * from customers
order by score desc,country asc
--no need of country asc here coz no repetition and priority to score

--group by
--Find total score for each country
--alias name being given
Select 
	country,SUM(score) AS total_score
FROM CUSTOMERS
GROUP BY country

/*Select 
	first_name,country,SUM(score) AS total_score
FROM CUSTOMERS
GROUP BY country error */ 

Select 
	first_name,country,SUM(score) AS total_score
FROM CUSTOMERS
GROUP BY country,first_name

---Fin the total score and total number of customers for each country
Select 
	country,SUM(score) as total_score,COUNT(id) as total_customers
from customers
group by country

--Find the average score for each country considering only customers with score not equal to 0 and returnh only countries with average score greater than 430
Select country ,AVG(SCORE) as avg_score from customers where score!=0
group by country
having AVG(score)>430

--distinct-no duplicates
--Return unique list of all  countries
SELECT DISTINCT
	country
FROM customers

--TOP
--Retrieve only 3 customers
SELECT TOP 3
* FROM CUSTOMERS

--Retrieve only 3 customers with highest scores
Select TOP 3 
* from customers 
order by score desc

--Retrieve the lowest 2 customers based on score
Select TOP 2
* FROM customers
order by score asc

Select * from orders
--GET THE TWO MOST RECENT ORDERS
Select TOP 2 *
from orders
order by order_date desc

--multi queries
--Static fixed values
Select 123 as static_no;
Select 'hello' as static_string

SELECT
id,first_name,
'NEW CUSTOMER' AS customer_type
FROM customers











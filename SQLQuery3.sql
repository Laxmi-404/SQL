USE MyDatabase
--FILTERING THE DATA
--RETRIEVE all customers from germany
SELECT * 
FROM customers
WHERE country='Germany';

--RETRIEVE all customers not  from germany
SELECT * 
FROM customers
WHERE country!='Germany';

--RETRIEVE all customers with score greater than 500
Select * from customers where score>500

--RETRIEVE all customers with score 500 or greater than 500
Select * from customers where score>=500
--RETRIEVE all customers with score less than 500
Select * from customers where score<500

--RETRIEVE all customers with score 500 or less than 500
Select * from customers where score<=500

--Retrieve all customers with score greater than 500 and are from USA
Select *
FROM customers
WHERE country='USA' AND score>500

--RetrieveE all customers with score greater than 500 or are from USA
Select * from customers where country='USA' or score>500

--Retrieve all customers with score not less than 500
Select *
FROM customers
where NOT score<500
--where  score>=500

--Retrieve all customers with score that falls  in the range between 100 and 500
SELECT *
FROM customers
--WHERE score BETWEEN 100 AND 500
WHERE score>=100 AND score<=500
--Retrieve all customers either from USA OR GERMANY
Select * FROM customers
--where country='USA' OR country='Germany';
where country IN ('Germany','USA')

--Retrieve all customers whose first name starts with'M'
Select *
FROM customers
WHERE first_name LIKE 'M%';

--Retrieve all customers whose first name ends with 'n'
Select *
FROM customers
where first_name LIKE '%n'

--Retrieve all customers whose first name contains 'r'
Select * from Customers
WHERE first_name LIKE '%r%'

--Retrieve all customers whose first name has r in 3rd position
Select *
from customers where first_name LIKE '__r%'






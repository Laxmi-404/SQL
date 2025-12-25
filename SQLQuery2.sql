USE MyDatabase
--DDL COMMANDS
--Create  a new table called persons with column id,person_name,birth_Date,phone
DROP TABLE persons;
CREATE TABLE persons(
id INT NOT NULL,
person_name VARCHAR(50) NOT NULL,
birth_date DATE,
phone VARCHAR(15) NOT NULL,
CONSTRAINT pk_persons PRIMARY KEY(id)
) ;
SELECT * FROM persons

--Add a new column called email to the persons table
ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL

SELECT * FROM persons


--Remove the column phone from the persons table
ALTER TABLE persons 
DROP COLUMN phone

ALTER TABLE persons 
DROP COLUMN email

ALTER TABLE persons 
ADD phone varchar(15)


SELECT * FROM persons


--Delete the table persons from database
--DROP TABLE persons;


--DML COMMANDS
--INSERT
INSERT INTO customers(id,first_name,country,score)
VALUES(6,'Anna','USA',NULL)
,(7,'Sam','NULL',100)
Select * from customers
Select * from persons

--INSERT INTO customers VALUES(6,'Anna','USA',NULL) ,('NULL','Sam','NULL',100)
--Msg 245, Level 16, State 1, Line 36
--Conversion failed when converting the varchar value 'NULL' to data type int.

--INSERT INTO customers VALUES('Anna',7,'USA',NULL)


--INSERT INTO customers(id,first_name) VALUES(9,'Sahra')
--had put 9 before,not get deleted and it doesnot change without update and delete


--copied data from one table to other
INSERT INTO persons(id,person_name,birth_date,phone) SELECT id,first_name,NULL,'UNKNOWN' from customers
select * from persons

--UPDATE
--Change the score if customer 6 to 0
 UPDATE customers
 SET score=0 where id=6
 Select * from customers

 /*
 Select * from customers where id=6
 */

 --Update all customers with a NULL score by setting their score to 0

  --Select * from customers where score IS NULL

 UPDATE customers 
 SET score=0
 WHERE score IS NULL

 Select * from customers

 --Delete the customers with id greater than 5
 Select * from customers where id>5
 DELETE FROM customers
 where id>5

 Select * from customers

 --Delete all data from table persons table
 DELETE FROM persons;
 --TRUNCATE
 TRUNCATE TABLE persons
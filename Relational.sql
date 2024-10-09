CREATE TABLE wine(

NumW INT PRIMARY KEY, 
Category VARCHAR(50),
YEAR VARCHAR(50),
Degree Numeric 

)


INSERT INTO wine
VALUES
(1, 'Red', '2019', 13.5),
(2, 'White', '2020', 12.0),
(3, 'Rose', '2018', 11.5),
(4, 'Red', '2021', 14.0),
(5, 'Sparkling', '2017', 10.5),
(6, 'White', '2019', 12.5),
(7, 'Red', '2022', 13.0),
(8, 'Rose', '2020', 11.0),
(9, 'Red', '2018', 12.0),
(10, 'Sparkling', '2019', 10.0),
(11, 'White', '2021', 11.5),
(12, 'Red', '2022', 15.0)

CREATE TABLE producer(

NumP INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
region VARCHAR(50)



)


INSERT INTO producer
VALUES
(1, 'John', 'Smith', 'Sousse'),
(2, 'Emma', 'Johnson', 'Tunis'),
(3, 'Michael', 'Williams', 'Sfax'),
(4, 'Emily', 'Brown', 'Sousse'),
(5, 'James', 'Jones', 'Sousse'),
(6, 'Sarah', 'Davis', 'Tunis'),
(7, 'David', 'Miller', 'Sfax'),
(8, 'Olivia', 'Wilson', 'Monastir'),
(9, 'Daniel', 'Moore', 'Sousse'),
(10, 'Sophia', 'Taylor', 'Tunis'),
(11, 'Matthew', 'Anderson', 'Sfax'),
(12, 'Amelia', 'Thomas', 'Sousse')

SELECT * FROM producer


--4. Retrieve a list of all producers.

SELECT * FROM producer

--5. Retrieve a sorted list of producers by name.

SELECT first_name,last_name
FROM producer
ORDER BY first_name,last_name ASC

--6. Retrieve a list of producers from Sousse.

SELECT * 
FROM producer
WHERE region = 'Sousse'


--7. Calculate the total quantity of wine produced with the wine number 12.

--There's no quantity records

--8.Calculate the quantity of wine produced for each category.

----There's no quantity records

--9. Find producers in the Sousse region who have harvested at least one 
--wine in quantities greater than 300 liters. Display their names and first names, sorted alphabetically.
----There's no quantity records

--10. List the wine numbers with a degree greater than 12, produced by producer number 24.

SELECT * FROM wine

WHERE degree > 12 
 -- The data is not complete to execute the queries 

 --11. Find the producer who has produced the highest quantity of wine.

 ----There's no quantity records

 
 SELECT * FROM producer


--12. Find the average degree of wine produced.

SELECT ROUND(AVG(degree),2) AS average_degree

FROM WINE


--13. Find the oldest wine in the database.

SELECT MIN(year) AS oldest_wine

FROM wine


--14. Retrieve a list of producers along with the total quantity of wine they have produced.

----There's no quantity records
--15.Retrieve a list of wines along with their producer details.
--NO Foreign keys 



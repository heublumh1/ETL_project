--created tables for ETL project
CREATE TABLE athlete(
	name TEXT,
	sex TEXT,
	age INT,
	height INT,
	weight INT,
	country TEXT,
	national_olympic_committee TEXT,
	year INT,
	season TEXT,
	host_city TEXT,
	sport TEXT,
	event TEXT,
	medal TEXT
);

CREATE TABLE country(
	country TEXT,
	population bigint,
	cost_of_living bigint
);


--1. In descending order, list the frequency count of names
SELECT name, Count(*) AS frequency
FROM athlete
GROUP BY name
ORDER BY frequency DESC;

--2. list the names that got a medal "Gold"
SELECT name, medal
FROM athlete
WHERE medal LIKE 'Gold';

--3. list the countries that got a medal "Gold"
SELECT country, medal
FROM athlete
WHERE medal LIKE 'Gold';

--4. In descending order list the count of medals "Gold", "Silver", "Bronze", or no medal(null)
SELECT medal, Count(*) AS frequency
FROM athlete
GROUP BY medal
Order BY frequency DESC;

--5. In descending order, list the frequency count of the sex of olympic athletes 
SELECT sex, Count(*) AS frequency
FROM athlete
GROUP BY sex
ORDER BY frequency DESC;

--6. Join the two tables to see comparisons between a country population and if it won a medal
SELECT * FROM athlete
INNER JOIN country
ON athlete.country=country.country;

--7. Find the medals 'Roger Federer' the tennis player won
SELECT name, medal
FROM athlete
WHERE name LIKE 'Roger Federer%';

--8. Find the medals 'Michael Phelps' the swimmmer won
SELECT name, country, year, sport, event, medal
FROM athlete
WHERE name LIKE 'Michael Fred Phelps%';

--9. Find the number of 'Gold' medals the United States has won
SELECT country, year, season, sport, medal
FROM athlete
WHERE country LIKE 'United States'
AND medal LIKE 'Gold';

--10. Find the total number of medals the United States has won
SELECT country, medal
FROM athlete
WHERE country LIKE 'United States'
AND medal NOT LIKE 'None'; 

--11. In descending order, list the frequency count of the ages of olympic athletes
SELECT age, COUNT(*) AS frequency
FROM athlete
GROUP BY age
ORDER BY frequency DESC;

--12. Find the number of females in the olympics before the year 1900 (should be zero females)
SELECT sex, year
FROM athlete
WHERE sex LIKE 'F' 
AND year<1900;

--13. Find the number of males in the olympics before the year 1900 (should be 380 males)
SELECT sex, year
FROM athlete
WHERE sex LIKE 'M'
AND year<1900;





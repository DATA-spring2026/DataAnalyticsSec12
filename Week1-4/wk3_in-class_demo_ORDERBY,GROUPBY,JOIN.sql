USE world;

-- using LIKE with % (wildcard: could be zero to many characters) and _ (wildcard: must be exactly one character)
SELECT Name from country
WHERE Name LIKE "%land_";


-- using ORDER BY, can specify ascending (ASC, default) or descending (DESC)
SELECT Name, Continent, GNP FROM country
ORDER BY Continent ASC, GNP ASC;

SELECT Name, Population FROM country
ORDER BY Population DESC;

SELECT Name, Population, Continent, LifeExpectancy FROM country
WHERE LifeExpectancy IS NOT null
ORDER BY LifeExpectancy ASC;

-- ORDER BY can be applied on multiple columns, where ORDER BY specifies which column is sorted first, then next, etc.
SELECT Name, Population, Continent, LifeExpectancy FROM country
ORDER BY Continent, LifeExpectancy DESC;


-- aggregation functions include SUM, AVG, MAX, MIN as common examples
-- if just aggregating on one column with no other data, there will be one value returned for that calculation
SELECT AVG(Population) AS "Average Population" FROM country;

-- if combining an aggregation function with other columns, must include GROUP BY to specify how to break down the rows
-- all non-aggregation columns must be listed in GROUP BY
SELECT AVG(Population) AS "Average Population", GovernmentForm, Continent  FROM country
GROUP BY GovernmentForm, Continent;

-- Count of countries by continent
SELECT COUNT(Name) AS "Num of Countries", Continent FROM country
GROUP BY Continent;

-- Average life expectancy by continent
SELECT AVG(LifeExpectancy) AS AvgLife, Continent FROM country
GROUP BY Continent;

-- MAX / MIN - What is the highest and lowest life expectancy per continent?
SELECT MAX(LifeExpectancy) AS MaxLife, MIN(LifeExpectancy) AS MinLife, Continent FROM country
GROUP BY Continent;

-- Two queries to answer "what countries have above average life expect expectancy?"
SELECT AVG(LifeExpectancy) FROM country;

SELECT Name, LifeExpectancy FROM country
WHERE LifeExpectancy >=66.486
ORDER BY LifeExpectancy DESC;

-- using LIMIT with ORDER BY to return a slice of the top results based on the ORDER BY column
SELECT Name, LifeExpectancy FROM country
ORDER BY LifeExpectancy DESC
LIMIT 100;

SELECT Name, LifeExpectancy FROM country
WHERE LifeExpectancy IS NOT null
ORDER BY LifeExpectancy ASC
LIMIT 100;

-- quick example of a join
SELECT country.name AS Country, country.GNP, Language FROM country
JOIN countrylanguage
ON country.Code = countrylanguage.CountryCode;

-- table names are not required if the column name itself is totally unique (e.g. country.Code and Code both work)
-- but fully qualified name is required if same column name appears in multiple tables (e.g. name is a column both on city and country, so need to specify city.name or country.name)
SELECT country.name AS Country, GNP, Language FROM country
JOIN countrylanguage
ON Code = CountryCode;

SELECT Name FROM country -- because name is a column on both country and city, this query will throw an error; needs city.name or country.name
JOIN city
ON country.code = city.CountryCode;

-- example of joining 3 tables
SELECT country.name AS Country, city.name AS City, Language FROM city
JOIN country
ON city.CountryCode = country.Code
JOIN countrylanguage
ON countrylanguage.CountryCode = country.Code
ORDER BY Language, Country;



-- Working with different types of joins

-- before running the below example queries, add record for "Christiania" with no country code
ALTER TABLE city
	MODIFY COLUMN CountryCode CHAR(3),
	MODIFY COLUMN District CHAR(20);
INSERT INTO city
	VALUES (4080, 'Freetown Christiania', NULL, NULL, 850);

-- First join (inner)
SELECT city.Name AS City, city.Population, country.Name AS Country, country.Region FROM country
JOIN city
ON country.Code = city.CountryCode;

-- left outer join
SELECT city.Name AS City, city.Population, country.Name AS Country, country.Region FROM country
LEFT JOIN city
ON country.Code = city.CountryCode;

-- right outer join
SELECT city.Name AS City, city.Population, country.Name AS Country, country.Region FROM country
RIGHT JOIN city
ON country.Code = city.CountryCode;

-- flip tables to put "country" on the "right"
SELECT city.Name AS City, city.Population, country.Name AS Country, country.Region FROM city
RIGHT JOIN country
ON country.Code = city.CountryCode;

-- MySQL version of a full outer join (combining a left join and a right join)
SELECT city.Name AS City, city.Population, country.Name AS Country, country.Region FROM city
LEFT JOIN country
on city.CountryCode = country.Code
UNION
SELECT city.Name AS City, city.Population, country.Name Country, country.Region FROM city
RIGHT JOIN country
on city.CountryCode = country.Code
;
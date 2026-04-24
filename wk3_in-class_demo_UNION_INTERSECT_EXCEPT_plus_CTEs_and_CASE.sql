USE world;

-- examples for set operations

-- starting query #1, where GNP is greater than 1,000,000
SELECT language FROM countrylanguage
JOIN country ON countrylanguage.CountryCode = country.Code
WHERE GNP > 1000000;

-- starting query #2, where Population is greater than 50,000,000
SELECT language FROM countrylanguage
JOIN country ON countrylanguage.CountryCode = country.Code
WHERE Population > 50000000;

-- UNION combines both results
SELECT language FROM countrylanguage
JOIN country ON countrylanguage.CountryCode = country.Code
WHERE GNP > 1000000
UNION 
SELECT language FROM countrylanguage
JOIN country ON countrylanguage.CountryCode = country.Code
WHERE Population > 50000000;

-- INTERSECT finds the overlap of results
SELECT language FROM countrylanguage
JOIN country ON countrylanguage.CountryCode = country.Code
WHERE GNP > 1000000
INTERSECT 
SELECT language FROM countrylanguage
JOIN country ON countrylanguage.CountryCode = country.Code
WHERE Population > 50000000;

-- EXCEPT, changing second query to "less than", to find results from first set that exclude the second set
SELECT language FROM countrylanguage
JOIN country ON countrylanguage.CountryCode = country.Code
WHERE GNP > 1000000
EXCEPT 
SELECT language FROM countrylanguage
JOIN country ON countrylanguage.CountryCode = country.Code
WHERE Population < 50000000;

-- another series of examples:

-- UNION kind of like "and" for query results
SELECT Name FROM country
WHERE Population <50000000
UNION
SELECT Name FROM country
WHERE LifeExpectancy >= 70;

-- INTERSECT kind of like "or" for query results
SELECT Name FROM country
WHERE Population <50000000
INTERSECT
SELECT Name FROM country
WHERE LifeExpectancy >= 70;

-- EXCEPT is kind of like "not" for query results
SELECT Name FROM country
WHERE Population <50000000
EXCEPT
SELECT Name FROM country
WHERE LifeExpectancy >= 70;


-- -------------------------------------------------------------------------------

-- Working with Common Table Expressions (CTEs)

-- using subquery
SELECT 
    ROUND(AVG(GNP), 0) AS "Avg GNP by Region",
    ROUND(
        (SELECT AVG(country2.GNP) 
         FROM country AS country2
         WHERE country2.Continent = country.Continent),  -- correlated subquery: ties to outer query's Continent
        0
    ) AS "Avg GNP by Continent",
    Region,
    Continent
FROM country
GROUP BY Continent, Region
ORDER BY Continent, Region;

-- instead as a CTE
WITH AvgGNPByContinent AS (
	SELECT
		Continent,
        ROUND(AVG(GNP), 0) AS "Avg GNP by Continent"
	FROM country
    GROUP BY Continent
)
SELECT 
	ROUND(AVG(GNP), 0) AS "Avg GNP by Region",
    AvgGNPByContinent.`Avg GNP by Continent`,
    country.Region,
    country.Continent
FROM country
JOIN AvgGNPByContinent ON country.Continent = AvgGNPByContinent.Continent
GROUP BY country.Continent, country.Region, AvgGNPByContinent.`Avg GNP by Continent`
ORDER BY country.Continent, country.Region;

-- same CTE expression written another way, troubleshooting an error in this query
WITH AvgGNPByContinent AS (
    SELECT 
        Continent,
        ROUND(AVG(GNP), 0) AS peanutbutter   -- running a test by changing the column name
    FROM country
    GROUP BY Continent
)
SELECT
    ROUND(AVG(c.GNP), 0) AS "Avg GNP by Region",
    a.peanutbutter,   -- using the assigned column name
    c.Region,
    c.Continent
FROM country c
JOIN AvgGNPByContinent a ON c.Continent = a.Continent
GROUP BY c.Continent, c.Region, a."Avg GNP by Continent" -- SHOULD BE PEANUTBUTTER HERE TOO!!
ORDER BY c.Continent, c.Region;

-- translating that troubleshooting back to the actual column names we want to apply to the results
WITH AvgGNPByContinent AS (
    SELECT 
        Continent,
        ROUND(AVG(GNP), 0) AS "Avg GNP by Continent" -- back to a non-insane name
    FROM country
    GROUP BY Continent
)
SELECT
    ROUND(AVG(c.GNP), 0) AS "Avg GNP by Region",
    a.`Avg GNP by Continent`,   -- the was the fix I first made
    c.Region,
    c.Continent
FROM country c
JOIN AvgGNPByContinent a ON c.Continent = a.Continent
GROUP BY c.Continent, c.Region, a.`Avg GNP by Continent`  -- but I also need to fix it down here
ORDER BY c.Continent, c.Region;


-- -------------------------------------------------------------------------------

-- working with CASE logic to display specified values based on what's in the data

USE sakila;

SELECT 
	CASE first_name WHEN 'Mike' THEN 'Skip' WHEN 'Jon' THEN 'JJ' END AS Name,
	first_name AS "Given Name"
FROM staff;
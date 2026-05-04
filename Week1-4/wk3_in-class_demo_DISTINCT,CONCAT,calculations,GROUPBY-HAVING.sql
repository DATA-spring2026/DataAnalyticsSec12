USE world;

DESCRIBE countrylanguage;

SELECT Name, Continent, Region FROM country;

SELECT DISTINCT Continent, Region FROM country
ORDER BY Continent, Region;

-- using concatenation

SELECT Name as Country, concat(Region, " (", Continent, ")") AS Regionorders FROM country;

SELECT name as Country, concat(
	"Population: ", 
    Population, 
    "; Life Expectancy:", 
    LifeExpectancy
    ) 
    AS Demographics 
FROM country;

SELECT COUNT(Name) AS "Count of Countries" FROM country;

-- working with numeric values
SELECT Continent, floor(AVG(SurfaceArea)) AS "Avg Country Size" FROM country
GROUP BY Continent;

SELECT Continent, ceil(AVG(SurfaceArea)) AS "Avg Country Size" FROM country
GROUP BY Continent;

SELECT Name AS Country, ROUND((Population / SurfaceArea), 0) AS "Population Density" FROM country;

-- more aggregation functions

SELECT COUNT(Name) AS "Count of Country", Continent FROM country
WHERE Continent LIKE "A%"
GROUP BY Continent
HAVING  `Count of Country` >= 30;

-- scalar function

SELECT Name as Country, CONCAT_WS(', ', Region, Continent) AS Region from country;


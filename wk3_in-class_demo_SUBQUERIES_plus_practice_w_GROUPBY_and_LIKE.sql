USE world;

-- a quick group by example

-- I have GNP by country. What is average GNP by region? How about by continent?

-- Average GNP by Region and Continent
SELECT ROUND(AVG(GNP), 0) AS "Avg GNP", Region, Continent FROM country
GROUP BY Continent, Region
ORDER BY Continent, Region;

-- If we don't use AVG(), here are all the individual records for GNP, by Region and Continent
SELECT GNP AS "GNP", Region, Continent FROM country
ORDER BY Continent, Region;

-- Taking out Region lets us find average GNP just by Continent 
SELECT ROUND(AVG(GNP), 0) AS "Average GNP", Continent FROM country
GROUP BY Continent
ORDER BY Continent
;


-- a little bit of a tangent playing around with LIKE pattern matching and the _ and % wildcards

SELECT Region FROM country
WHERE Region LIKE "east%";

SELECT Region FROM country
WHERE Region LIKE "%east";

SELECT Region FROM country
WHERE Region LIKE "%east%";

SELECT Region FROM country
WHERE Region LIKE "%east_"; -- no results!

SELECT Region FROM country
WHERE Region LIKE "%east%" OR Region LIKE "%west%";

SELECT Region FROM country
WHERE Region LIKE "Middle_east";

SELECT SurfaceArea FROM country
WHERE SurfaceArea LIKE "______"
-- WHERE SurfaceArea BETWEEN 10 AND 100
;

-- EXPERIMENTING WITH SUBQUERIES

-- narrowing down list of results to just regions containing the letters east
SELECT Name as Country, Region FROM country
    WHERE Region LIKE "%east%";

-- the long way of generating the same results, using an IN condition and writing out the desired values
SELECT Region FROM country
WHERE Region IN ("Middle East", "Eastern Africa", "Eastern Europe", "Southeast Asia", "Eastern Asia");

-- uses the list of regions returned in the subquery to narrow down the results returned by the outer queryh
SELECT Name as Country, Region FROM country
WHERE Region IN (
	SELECT Region FROM country
    WHERE Region LIKE "%east%");
    
    
-- attempting to calculate both average GNP by Region and also by Continent -- this doesn't quite
-- work as desired because for Continent, we just get one average across all continents
SELECT 
	ROUND(AVG(GNP), 0) AS "Avg GNP by Region", -- calculates average at Region level
    ROUND(
		-- 1st level subquery, calculate average at continent level
		(SELECT AVG(GNP) FROM country WHERE Continent IN
			-- 2nd level subquery, narrow list of continents
            (SELECT DISTINCT Continent FROM country)
			), 
		0) AS "Avg GNP by Continent", 
    Region, 
    Continent
FROM country
GROUP BY Continent, Region
ORDER BY Continent, Region;


-- as a correlated subquery, this gets us an average calcuation at the Continent level 
-- by matching the Continent returned at the row level in the inner subquery with the
-- Continent for that row in the outer query
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



-- WORKING WITH SET OPERATIONS

USE sakila;

-- UNION stacks records returned by the first query on top of records returned by the second query
SELECT customer.first_name AS FName, customer.last_name, customer.email FROM customer
UNION
SELECT staff.first_name, staff.last_name, staff.email FROM staff;

-- using NULL as a placeholder value where columns don't match
SELECT customer.first_name AS FName, customer.last_name, customer.email, customer.customer_id, NULL AS staff_id FROM customer
UNION
SELECT staff.first_name, staff.last_name, staff.email, NULL, staff.staff_id FROM staff;

-- adding a hard-coded column to label records from the first set as "customer" and from the second set as "staff"
SELECT customer.first_name AS FName, customer.last_name, customer.email, "customer" AS category FROM customer
UNION
SELECT staff.first_name, staff.last_name, staff.email, "staff" FROM staff;

-- records will be returned from the first-listed query first
SELECT staff.first_name, staff.last_name, staff.email, "staff" AS category FROM staff
UNION
SELECT customer.first_name AS FName, customer.last_name, customer.email, "customer" AS category FROM customer;
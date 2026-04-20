SELECT 3 = 2 + 1 AS "math problem";
-- 1 (TRUE)

USE world;

SELECT Name AS Country
, LifeExpectancy AS LifeExpectAbove70
, GNP
FROM country
WHERE LifeExpectancy > 70 OR GNP > 6000;

SELECT * FROM city
WHERE (name = "Kabul" OR name = "Herat") OR CountryCode = "NLD";
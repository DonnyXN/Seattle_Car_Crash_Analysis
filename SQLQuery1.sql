
--Querying Questions to answer:

--- How many collisions occurred between January 1, 2020 and December 31, 2023?

SELECT *
FROM dbo.clean_collisions
WHERE DATE <= '2020/01/01' AND DATE >= '2023/12/31'


--- Which month had the leading number of accidents in 2023.

SELECT
	DATENAME(month, DATE) AS Month,
	COUNT(OBJECTID) AS Accidents
FROM dbo.clean_collisions
WHERE YEAR(DATE) = '2016'
GROUP BY YEAR(DATE),
	DATENAME(month, DATE)
ORDER BY COUNT(OBJECTID) DESC

--- What are the top 10 most common collision types and their respective counts?

SELECT
	TOP 10
	COLLISIONTYPE,
	COUNT(COLLISIONTYPE) AS collisions
FROM dbo.clean_collisions
GROUP BY COLLISIONTYPE
ORDER BY COUNT(COLLISIONTYPE) DESC

--- Are there any noticeable trends in the number of collisions over the years?

SELECT
	YEAR(DATE) AS Year,
	COUNT(COLLISIONTYPE) AS collisions
FROM dbo.clean_collisions
GROUP BY Year(DATE)
ORDER BY YEAR(DATE)


--- How do weather conditions affect the frequency and severity of collisions?

SELECT
	WEATHER,
	SEVERITYCODE,
	COUNT(SEVERITYCODE)
FROM dbo.clean_collisions col
LEFT JOIN dbo.SDOT_Collisions_Conditions$ con ON col.OBJECTID = con.OBJECTID
WHERE WEATHER IS NOT NULL
GROUP BY WEATHER, SEVERITYCODE
ORDER BY WEATHER

--- Is there a correlations between collisions and factors such as road conditions?

SELECT 
	ROADCOND,
	COUNT(OBJECTID) AS collisions
FROM dbo.SDOT_Collisions_Conditions$
WHERE ROADCOND IS NOT NULL
GROUP BY ROADCOND
ORDER BY collisions DESC

-- Is there a correlations between collisions and factors such as light conditions?

SELECT 
	LIGHTCOND,
	COUNT(OBJECTID) AS collisions
FROM dbo.SDOT_Collisions_Conditions$
WHERE LIGHTCOND IS NOT NULL
GROUP BY LIGHTCOND
ORDER BY collisions DESC

--- How many collisions resulted in injuries (severity code 2) in 2021?

SELECT
	COUNT(SEVERITYCODE) AS INJURIES
FROM dbo.clean_collisions col
LEFT JOIN dbo.SDOT_Persons$ p ON col.OBJECTID = p.OBJECTID
WHERE YEAR(DATE) = '2021' 
	AND SEVERITYCODE = '2'


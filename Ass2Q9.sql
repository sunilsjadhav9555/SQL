
select * from dbo.TravellerDetails;

WITH AllTravellers AS (
    SELECT DISTINCT TravellerName FROM TravellerDetails
),
AllCities AS (
    SELECT DISTINCT CityTravelled FROM TravellerDetails
)
SELECT T.TravellerName, C.CityTravelled
FROM AllTravellers T
CROSS JOIN AllCities C
LEFT JOIN TravellerDetails D 
    ON T.TravellerName = D.TravellerName 
    AND C.CityTravelled = D.CityTravelled
WHERE D.TravellerName IS NULL;
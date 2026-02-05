select * from dbo.BrokenNames;

WITH FirstNames AS (
    SELECT 
        First_Name, 
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS Rn
    FROM BrokenNames
    WHERE First_Name IS NOT NULL
),
LastNames AS (
    SELECT 
        Last_Name, 
        ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS Rn
    FROM BrokenNames
    WHERE Last_Name IS NOT NULL
)
SELECT 
    f.First_Name, 
    l.Last_Name
FROM FirstNames f
JOIN LastNames l 
    ON f.Rn = l.Rn;
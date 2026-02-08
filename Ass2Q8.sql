WITH CTE AS (
    SELECT 
        *, 
        ROW_NUMBER() OVER (
            PARTITION BY [Column1], [Column2], [Column3] 
            ORDER BY (SELECT NULL)
        ) AS RowNum
    FROM 
        TableName
)
DELETE FROM CTE
WHERE RowNum > 1;
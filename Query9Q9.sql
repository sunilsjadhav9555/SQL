
	SELECT 
    CASE WHEN GROUPING(Id) = 1 THEN 'Total' ELSE CAST(Id AS VARCHAR(10)) END AS Id,
    MAX(Name) AS Name,
    SUM(Salary) AS Salary
FROM 
    EmployeeSalary
GROUP BY 
    Id WITH ROLLUP
ORDER BY 
    GROUPING(Id), Id;
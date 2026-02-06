select * from dbo.EmployeeDeptSalInfo;


SELECT DISTINCT Salary
FROM EmployeeDeptSalInfo
ORDER BY Salary DESC
OFFSET 2 ROWS
FETCH NEXT 1 ROWS ONLY;


SELECT TOP 1 Salary
FROM (
    SELECT DISTINCT TOP 3 Salary
    FROM EmployeeDeptSalInfo
    ORDER BY Salary DESC
) AS Top3
ORDER BY Salary ASC;


WITH DeptSalaries AS (
    SELECT 
        Department, 
        Salary, 
        DENSE_RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS Rank
    FROM EmployeeDeptSalInfo
)
SELECT DISTINCT Department, Salary
FROM DeptSalaries
WHERE Rank = 2;



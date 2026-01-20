SELECT 
    d.DeptName, 
    COUNT(e.EmployeeID) AS Number_of_Employees
FROM 
    DepartmentData d
INNER JOIN 
    EmployeeData e ON d.DeptId = e.DeptID
GROUP BY 
    d.DeptName;
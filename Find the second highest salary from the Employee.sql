/*
Find the second highest salary from the Employee
*/

CREATE TABLE Employees(
	EmployeeID INT PRIMARY KEY,
	EmployeeName VARCHAR(50),
	Salary INT 
 );

 INSERT INTO Employees (EmployeeID, EmployeeName, Salary)
VALUES
(1, 'Alice', 80000),
(2, 'Bob', 95000),
(3, 'Charlie', 75000),
(4, 'David', 95000),
(5, 'Eva', 60000),
(6, 'Frank', 85000),
(7, 'Grace', 70000),
(8, 'Henry', 80000),
(9, 'Ivy', 50000),
(10, 'Jack', 90000);

select * from Employees;

select MAX(salary) as maxsal
from employees
where salary <
(select max(salary) from employees);

WITH SalaryRank AS
(
    SELECT *,
           DENSE_RANK() OVER (ORDER BY Salary DESC) AS SalaryRank
    FROM Employees
)
SELECT *
FROM SalaryRank
WHERE SalaryRank = 2;




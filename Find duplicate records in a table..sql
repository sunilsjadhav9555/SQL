/*
Find duplicate records in a table.
*/


CREATE TABLE employees1 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);


INSERT INTO employees1 (id, name, department) VALUES
(1, 'Alice', 'HR'),
(2, 'Bob', 'IT'),
(3, 'Alice', 'Finance'),
(4, 'Charlie', 'IT'),
(5, 'David', 'Sales'),
(6, 'Bob', 'HR'),
(7, 'Emma', 'Marketing'),
(8, 'Bob', 'Finance'),
(9, 'Frank', 'Sales'),
(10, 'Alice', 'IT');



SELECT name, COUNT(*)
FROM employees1
GROUP BY name
HAVING COUNT(*) > 1;


SELECT DISTINCT name, cnt
FROM (
    SELECT name,
           COUNT(*) OVER (PARTITION BY name) AS cnt
    FROM employees1
) t
WHERE cnt > 1;

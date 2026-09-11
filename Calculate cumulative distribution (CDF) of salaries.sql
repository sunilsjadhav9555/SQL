/*
Calculate cumulative distribution (CDF) of salaries.
*/

CREATE TABLE employees10 (
    id INT,
    name VARCHAR(50),
    salary INT
);

INSERT INTO employees10 (id, name, salary) VALUES
(1, 'Alice', 30000),
(2, 'Bob', 40000),
(3, 'Charlie', 50000),
(4, 'David', 50000),
(5, 'Emma', 60000),
(6, 'Frank', 70000),
(7, 'Grace', 80000),
(8, 'Henry', 90000);

select * from employees10;


SELECT 
    name,
    salary,
    ROUND(CUME_DIST() OVER (ORDER BY salary), 3) AS salary_cdf
FROM employees10
ORDER BY salary;
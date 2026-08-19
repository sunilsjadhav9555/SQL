/*
Write a query to find the median salary.
*/


CREATE TABLE employees6 (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees6 (employee_id, employee_name, department, salary) VALUES
(1, 'John',  'IT',      50000),
(2, 'Sarah', 'HR',      60000),
(3, 'Mike',  'IT',      70000),
(4, 'David', 'Finance', 80000),
(5, 'Emma',  'IT',      90000),
(6, 'Alex',  'HR',      55000),
(7, 'Lisa',  'Finance', 75000);


select * from employees6;

SELECT
    PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY salary)
        OVER () AS median_salary
FROM employees6;

SELECT AVG(salary) AS median_salary
FROM
(
    SELECT salary
    FROM employees6
    ORDER BY salary
    OFFSET (SELECT (COUNT(*) - 1) / 2 FROM employees6) ROWS
    FETCH NEXT
        (2 - (SELECT COUNT(*) FROM employees6) % 2)
    ROWS ONLY
) AS median_subquery;
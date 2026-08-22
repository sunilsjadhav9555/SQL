/*
    Running total of salaries by department.
*/


CREATE TABLE employees7 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10,2),
    hire_date DATE
);



INSERT INTO employees7 (id, name, department_id, salary, hire_date)
VALUES
    (1,  'Alice',   10, 50000, '2021-01-15'),
    (2,  'Bob',     10, 60000, '2021-06-20'),
    (3,  'Charlie', 10, 70000, '2022-03-10'),
    (4,  'Diana',   10, 55000, '2023-01-05'),

    (5,  'Ethan',   20, 45000, '2020-11-12'),
    (6,  'Fiona',   20, 65000, '2021-08-18'),
    (7,  'George',  20, 75000, '2022-05-25'),
    (8,  'Hannah',  20, 55000, '2023-07-01'),

    (9,  'Ian',     30, 80000, '2020-02-10'),
    (10, 'Julia',   30, 90000, '2021-04-15'),
    (11, 'Kevin',   30, 85000, '2022-09-20'),
    (12, 'Laura',   30, 95000, '2024-01-10');


    select * from employees7;


    SELECT
    id,
    name,
    department_id,
    salary,
    SUM(salary) OVER (
        PARTITION BY department_id
        ORDER BY id
        ROWS UNBOUNDED PRECEDING
    ) AS running_total
FROM employees7
ORDER BY department_id, id;
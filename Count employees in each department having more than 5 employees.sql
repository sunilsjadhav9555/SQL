/*
Count employees in each department having more than 5 employees.
*/


CREATE TABLE employees3 (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department_id INT
);


INSERT INTO employees3 (employee_id, employee_name, department_id)
VALUES
    (1,  'Rahul',   10),
    (2,  'Priya',   10),
    (3,  'Amit',    10),
    (4,  'Neha',    10),
    (5,  'Vikram',  10),
    (6,  'Sneha',   10),
    (7,  'Arjun',   10),
    (8,  'Karan',   20),
    (9,  'Pooja',   20),
    (10, 'Rohit',   20),
    (11, 'Anjali',  20),
    (12, 'Suresh',  20),
    (13, 'Meera',   20),
    (14, 'Raj',     30),
    (15, 'Simran',  30),
    (16, 'Vivek',   30),
    (17, 'Nisha',   30),
    (18, 'Manish',  30),
    (19, 'Tanya',   30),
    (20, 'Dev',     40),
    (21, 'Riya',    40),
    (22, 'Akash',   40),
    (23, 'Isha',    40);


    select * from employees3;

SELECT
department_id,
COUNT(*) AS num_employees
FROM employees3
GROUP BY department_id
HAVING COUNT(*) > 5;


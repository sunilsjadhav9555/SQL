/*
Get departments with no employees.
*/


CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE employees5 (
    id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT
);

INSERT INTO departments (department_id, department_name)
VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Legal');

INSERT INTO employees5 (id, employee_name, department_id)
VALUES
(101, 'Alice', 1),
(102, 'Bob', 1),
(103, 'Charlie', 2),
(104, 'David', 3);


SELECT d.department_name
FROM departments d
LEFT JOIN employees5 e
    ON d.department_id = e.department_id
WHERE e.id IS NULL;



SELECT d.department_name
FROM departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM employees5 e
    WHERE e.department_id = d.department_id
);

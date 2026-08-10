/*

 Find employees who joined in the last 6 months.

*/


CREATE TABLE employees4 (
    employee_id INT,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    join_date DATE
);

INSERT INTO employees4 (employee_id, employee_name, department, join_date)
VALUES
(101, 'Alice', 'IT', '2026-07-15'),
(102, 'Bob', 'HR', '2026-05-20'),
(103, 'Charlie', 'Finance', '2026-03-10'),
(104, 'David', 'IT', '2025-12-01'),
(105, 'Emma', 'Marketing', '2026-08-01'),
(106, 'Frank', 'Sales', '2025-09-15'),
(107, 'Grace', 'IT', '2026-02-15');

select * from employees4;


select * from employees4 where join_date >= DATEADD(MONTH, -6, GETDATE());

SELECT *
FROM employees4
WHERE join_date >= CAST(DATEADD(MONTH, -6, GETDATE()) AS DATE);


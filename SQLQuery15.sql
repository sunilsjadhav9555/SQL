select * from stores s
where exists
(
select 1 from sales sa where sa.store_id = s.store_id
)

select * from stores s
where not exists
(
select 1 from sales sa where sa.store_id = s.store_id
)

select *, avg(salary) over() as avg_sal from employees;

select *, sum(salary) over() as sum_sal from employees;

select *, count(salary) over() as count from employees;

drop table employees;

CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    location VARCHAR(50),
    hire_date DATE
);
INSERT INTO employees (emp_id, name, department, salary, location, hire_date) 
VALUES
(1, 'Alice', 'HR', 50000.00, 'New York', '2020-01-15'),
(2, 'Bob', 'Sales', 60000.00, 'London', '2019-03-10'),
(3, 'Charlie', 'IT', 70000.00, 'Delhi', '2021-06-20'),
(4, 'Diana', 'Sales', 80000.00, 'New York', '2018-11-01'),
(5, 'Eve', 'IT', 90000.00, 'London', '2022-08-05'),
(6, 'Frank', 'HR', 55000.00, 'Delhi', '2020-02-10'),
(7, 'Grace', 'Sales', 75000.00, 'London', '2021-07-15'),
(8, 'Heidi', 'IT', 85000.00, 'New York', '2019-12-12'),
(9, 'Ivan', 'Finance', 62000.00, 'Delhi', '2020-05-22'),
(10, 'Judy', 'Finance', 75000.00, 'London', '2021-01-10'),
(11, 'Kevin', 'HR', 66000.00, 'New York', '2018-09-30'),
(12, 'Laura', 'Sales', 63000.00, 'Delhi', '2022-03-18'),
(13, 'Mallory', 'Finance', 71000.00, 'New York', '2019-10-14'),
(14, 'Niaj', 'IT', 68000.00, 'London', '2021-04-09'),
(15, 'Oscar', 'HR', 55000.00, 'Delhi', '2020-12-01'),
(16, 'Pam', 'IT', 85000.00, 'London', '2023-01-25'),
(17, 'Quincy', 'Finance', 68000.00, 'Delhi', '2022-06-06'),
(18, 'Ruth', 'Sales', 68000.00, 'New York', '2020-09-10'),
(19, 'Sam', 'Sales', 72000.00, 'London', '2023-02-14'),
(20, 'Tina', 'IT', 85000.00, 'Delhi', '2021-08-30');

select * from employees;

select *, avg(salary) over() as avg_sal from employees;

select *, avg(salary) over(partition by department) as avg_sal_per_dept from employees;

select *, min(salary) over(partition by department) as min_sal_per_dept from employees;

select *, count(emp_id) over(partition by department) as avg_sal_per_dept from employees;

select *, avg(salary) over() as avg_sal from employees;

select *, avg(salary) over(partition by department) as avg_sal_per_dept from employees;

select *, avg(salary) over(partition by department order by salary) as avg_sal_per_dept from employees;

select *, avg(salary) over(partition by department
order by salary rows between unbounded preceding and unbounded following)
from employees;

select *, ROW_NUMBER() over(order by salary) as row_number from employees;

select *, rank() over(order by salary) as rank from employees;

select *, DENSE_RANK() over(order by salary) as dense_rank from employees;

select *, ROW_NUMBER() over(order by salary) as row_number,
RANK() over (order by salary) as rank,
dense_rank() over (order by salary) dense_rank
from employees;

select *, DENSE_RANK() over(order by salary desc) as dense_rank from employees;
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(1,'Engineering'),
(2,'HR'),
(3,'Finance'),
(4,'Sales');

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    manager_id INT,
    salary INT,
    joining_date DATE,
    city VARCHAR(50),
    FOREIGN KEY (dept_id)
        REFERENCES departments(dept_id)
);

INSERT INTO employees VALUES
(101,'Rahul',1,NULL,120000,'2020-01-10','Mumbai'),
(102,'Priya',1,101,90000,'2021-03-15','Pune'),
(103,'Amit',1,101,90000,'2022-06-20','Mumbai'),
(104,'Sneha',2,NULL,70000,'2019-09-05','Delhi'),
(105,'Rohan',2,104,65000,'2023-01-11','Delhi'),
(106,'Anjali',3,NULL,110000,'2018-04-22','Bangalore'),
(107,'Vikram',3,106,95000,'2020-08-18','Hyderabad'),
(108,'Neha',4,NULL,85000,'2021-11-25','Mumbai'),
(109,'Karan',4,108,85000,'2022-12-12','Pune'),
(110,'Pooja',1,101,75000,'2023-05-10','Chennai');

select * from departments;


select * from employees;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    emp_id INT,
    order_amount INT,
    order_date DATE,
    FOREIGN KEY(emp_id)
        REFERENCES employees(emp_id)
);

INSERT INTO orders VALUES
(1,102,5000,'2024-01-10'),
(2,102,7000,'2024-01-12'),
(3,103,10000,'2024-02-01'),
(4,107,12000,'2024-02-05'),
(5,108,9000,'2024-03-10'),
(6,109,9000,'2024-03-15'),
(7,110,15000,'2024-04-20');

CREATE TABLE users (
    user_id INT,
    email VARCHAR(100)
);

INSERT INTO users VALUES
(1,'a@gmail.com'),
(2,'b@gmail.com'),
(3,'a@gmail.com'),
(4,'c@gmail.com'),
(5,'d@gmail.com'),
(6,'b@gmail.com');

SELECT e.*
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'Engineering';

--Get all employees from Engineering.

select e.* from employees e join departments d on e.dept_id = d.dept_id where d.dept_name = 'Engineering';

select e.* from employees e join departments d on e.dept_id = d.dept_id where d.dept_name = 'hr';

select e.* from employees e join departments d on e.dept_id = d.dept_id  where d.dept_name ='finance';

select e.* from employees e join departments d on e.dept_id = d.dept_id where d.dept_name = 'Sales';

--Find employees with salary > 90000.

select * from employees where salary > 90000;


--Count employees department-wise


select d.dept_name ,count(e.emp_id) as employee_count from employees e join departments d on e.dept_id =d.dept_id group by  d.dept_name;


--Find average salary by department.

SELECT d.dept_name,
       AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

select d.dept_name, avg(e.salary) as avg_salary from employees e join departments d on e.dept_id = d.dept_id group by d.dept_name;

--Highest salary in each department

select dept_id ,max(salary) from employees group by dept_id;

--Show employee name + department name.


select e.emp_name, d.dept_name from employees e join departments d on e.dept_id = d.dept_id;

--Employees without managers.

select * from employees where manager_id is null;

--Self join: employee with manager name.


select e.emp_name as employee, m.emp_name as manager from employees e join employees m on e.manager_id = m.emp_id;

--Departments with no employees.

select d.dept_name  from departments d left join employees e  on d.dept_id = e.dept_id where e.emp_id is null;

--Find total salary per department.

select dept_id, sum (salary) from employees group by dept_id;

select dept_id , sum(salary) from employees group by dept_id;

--Departments with avg salary > 80000.

select dept_id, avg(salary) from employees group by dept_id having avg(salary)  > 80000;

--Count employees city-wise.

select city, count(emp_id) from employees group by city;

--Rank employees by salary.

select emp_name, salary,rank() over(order by salary desc) as rank_no from employees;

select emp_name,salary,dense_rank() over(order by salary desc) as denscrank from employees;


--Top 3 salaries per department.



select emp_name,dept_id,salary from (select emp_name,dept_id,salary,dense_rank() over(partition by dept_id order by salary desc) as rnk
from employees)t where rnk <= 3;

--Find previous employee salary using LAG().

select emp_name,salary,lag(salary) over (order by salary) as previous_salary from employees;

select emp_name,salary,lead(salary) over(order by salary) as next_salary from employees;

--Find duplicate emails.

select email,count(*) as dublicate_count from users group by email having count(*) > 1;

--Remove duplicates keeping one row.

delete from users where user_id in(select user_id from( select user_id,row_number() over(
	partition by email order by user_id) as rn from users)t where rn > 1 );


--Second highest salary.

select max(salary) from employees where salary < (select max(salary) from employees);

select salary from (select salary, dense_rank() over(order by salary desc) as rnk from employees)t where rnk = 2;

--Employees earning above department average.

select emp_name,dept_id,salary from employees e where salary > (select avg (salary) from employees where dept_id = e.dept_id);

--Third highest salary.

select max(salary) from employees where salary < (select max(salary) from employees where salary <(select max(salary)
from employees)
);



with deptavg as(
	select department, avg(salary) as avg_salary
	from employees
	group by department
)

select e.* 
from employees e join deptavg d
on e.department = d.department
where e.salary > d.avg_salary;

select emp_id, name, salary, department
from employees e1 where salary > (
	select avg(salary) from employees e2
	where e2.department = e1.department
	);

select * from (
select *, avg(salary) over(partition by department) avg_sal from employees
)emp_with_avg_sal
where salary > avg_sal;

select e.*
from employees e join (select department, avg(salary) as avg_salary from employees group by department ) d
on e.department = d.department
where e.salary > d.avg_salary;

with cte_duplicates as (

	select *,
		row_number() over(partition by col1, col2, col3 order by(select Null)) as
		rn from MyTable)
		delete from cte_duplicates
		where rn > 1;

CREATE TABLE Customers_WithPK (
    customer_id INT PRIMARY KEY,
    name NVARCHAR(100),
    email NVARCHAR(100)
);

CREATE TABLE Customers_WithoutPK (
    customer_id INT NOT NULL,
    name NVARCHAR(100),
    email NVARCHAR(100)
);


INSERT INTO Customers_WithPK (customer_id, name, email) 
VALUES (105, 'Alice', 'alice@example.com'),
(102, 'Bob', 'bob@example.com'),
(110, 'Carol', 'carol@example.com'),
(101, 'Dave', 'dave@example.com'),
(108, 'Eve', 'eve@example.com');


INSERT INTO Customers_WithoutPK (customer_id, name, email) 
VALUES (105, 'Alice', 'alice@example.com'),
(102, 'Bob', 'bob@example.com'),
(110, 'Carol', 'carol@example.com'),
(101, 'Dave', 'dave@example.com'),
(108, 'Eve', 'eve@example.com');

select * from customers_withPk;

select * from  Customers_WithoutPK;

select * from Customers_WithoutPK where customer_id =108;

select * from Customers_WithPK where customer_id = 108;

create clustered index idx_employees_id on employees(emp_id);

create nonclustered index ix_customers_email on customers (email);

create unique clustered index ix_customers_customerid on customers(customer_id);

CREATE UNIQUE NONCLUSTERED INDEX IX_Customers_Email ON Customers(email);

When we create a UNIQUE CONSTRAINT in SQL Server, it automatically creates a unique index 
under the hood to enforce that constraint.
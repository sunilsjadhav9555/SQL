/*
 Retrieve employees who earn more than their manager.
*/


CREATE TABLE employees2 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    salary INT,
    manager_id INT
);

INSERT INTO employees2 (id, name, salary, manager_id) VALUES
(1, 'John', 90000, NULL),     
(2, 'Alice', 70000, 1),
(3, 'Bob', 95000, 1),         
(4, 'David', 60000, 2),
(5, 'Emma', 80000, 2),        
(6, 'Chris', 50000, 3),
(7, 'Sophia', 100000, 3);     

SELECT e.name AS Employee, e.salary, m.name AS Manager,
m.salary AS ManagerSalary FROM employees2 e JOIN employees2 
m ON e.manager_id = m.id WHERE e.salary > m.salary;


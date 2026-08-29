/*
Recursive query to find the full reporting chain for each employee.
*/

CREATE TABLE employees8 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    manager_id INT NULL,
    FOREIGN KEY (manager_id) REFERENCES employees8(id)
);

INSERT INTO employees8 (id, name, manager_id) VALUES
(1, 'Alice', NULL),       
(2, 'Bob', 1),          
(3, 'Charlie', 1),        
(4, 'David', 2),          
(5, 'Eva', 2),           
(6, 'Frank', 3),          
(7, 'Grace', 4),          
(8, 'Henry', 7);          

select * from employees8;

WITH ReportingChain AS
(
    
    SELECT
        e.id,
        e.name,
        e.manager_id,
        0 AS level,
        CAST(e.name AS VARCHAR(1000)) AS reporting_path
    FROM employees8 AS e

    UNION ALL

    
    SELECT
        rc.id,
        rc.name,
        m.manager_id,
        rc.level + 1,
        CAST(
            rc.reporting_path + ' -> ' + m.name
            AS VARCHAR(1000)
        ) AS reporting_path
    FROM ReportingChain AS rc
    INNER JOIN employees8 AS m
        ON m.id = rc.manager_id
)
SELECT
    id,
    name,
    reporting_path
FROM ReportingChain
WHERE manager_id IS NULL
ORDER BY id
OPTION (MAXRECURSION 100);
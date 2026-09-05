/*

Write a query to find gaps in a sequence of numbers (missing IDs).

*/


CREATE TABLE employees9 (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

INSERT INTO employees9 (id, name) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(5, 'David'),
(6, 'Eva'),
(9, 'Frank'),
(10, 'George'),
(13, 'Helen');

select * from employees9;


SELECT id + 1 AS missing_from,
       next_id - 1 AS missing_to
FROM (
    SELECT
        id,
        LEAD(id) OVER (ORDER BY id) AS next_id
    FROM employees9
) e
WHERE next_id > id + 1
ORDER BY missing_from;
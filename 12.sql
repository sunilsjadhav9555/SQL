/********************************* CROSS JOIN*********************************
Returns Cartesian product (all combinations of rows)
There is no join condition.
So, in output we will get each row from left tables joined with each row from right table.
So, if TableA has 2 rows and TableB has 3 rows, the CROSS JOIN will produce: 2 × 3 = 6 rows
All possible combinations of rows from the two tables.
*/

CREATE TABLE TableA (
    ID INT,
    Name VARCHAR(50)
);

CREATE TABLE TableB (
    Code CHAR(1),
    Description VARCHAR(50)
);

-- Insert 2 rows into TableA
INSERT INTO TableA (ID, Name) VALUES
(1, 'Alice'),
(2, 'Bob');

-- Insert 3 rows into TableB
INSERT INTO TableB (Code, Description) VALUES
('X', 'Item X'),
('Y', 'Item Y'),
('Z', 'Item Z');

-- Cross join TableA and TableB
SELECT A.ID, A.Name, B.Code, B.Description
FROM TableA A
CROSS JOIN TableB B;

SELECT A.ID, A.Name, B.Code, B.Description
FROM TableB B
CROSS JOIN TableA A;

SELECT *
FROM TableB B
CROSS JOIN TableA A;
/*
We can use some short cuts as well instead of writing full join names
INNER JOIN -> JOIN
LEFT OUTER JOIN -> LEFT JOIN
RIGHT OUTER JOIN -> RIGHT JOIN
FULL OUTER JOIN -> FULL JOIN
CROSS JOIN -> , (Just use a comma between two tables)
We can also achieve inner join using cross join and a where condition
SELECT * FROM Students S, Departments D 
WHERE S.DepartmentID = D.DepartmentID;
*/

SELECT * FROM Students S join Departments D 
on S.DepartmentID = D.DepartmentID;

SELECT * FROM Students S left join Departments D 
on S.DepartmentID = D.DepartmentID;

SELECT * FROM Students S right join Departments D 
on S.DepartmentID = D.DepartmentID;

SELECT * FROM Students S full join Departments D 
on S.DepartmentID = D.DepartmentID;

SELECT * FROM TableA , TableB; -- cross join

SELECT * FROM Students S, Departments D 
WHERE S.DepartmentID = D.DepartmentID;

SELECT * FROM Students S join Departments D 
on S.DepartmentID = D.DepartmentID;


/*-------------------------------SET--------------------
In Microsoft T-SQL, set operators are used to combine the results of two or more SELECT statements.
The key set operators in T-SQL are:
Union All
Union
Intersect
Except
In joins we were combining the columns from two tables, In set operators we will combine Rows from two tables.
*/

CREATE TABLE InternalTraining (
    EmployeeID INT,
    EmployeeName NVARCHAR(100),
    Skill NVARCHAR(100) );

INSERT INTO InternalTraining (EmployeeID, EmployeeName, Skill) VALUES
(1, 'Alice Carter', 'SQL'),
(2, 'Bob Daniels', 'Python'),
(3, 'Charlie Evans', 'Project Management'),
(4, 'Diana Foster', 'Excel'),
(5, 'Ethan Green', 'Power BI');

CREATE TABLE CertifiedSkills (
    EmployeeID INT,
    EmployeeName NVARCHAR(100),
    Skill NVARCHAR(100) );
INSERT INTO CertifiedSkills (EmployeeID, EmployeeName, Skill) VALUES
(2, 'Bob Daniels', 'Python'),
(3, 'Charlie Evans', 'Agile'),
(4, 'Diana Foster', 'Excel'),
(6, 'Fiona Hart', 'SQL'),
(7, 'George Ivy', 'Azure');

select * from InternalTraining;
select * from CertifiedSkills;

select * from InternalTraining
UNION ALL
select * from CertifiedSkills;

--Important Notes:
--The number of columns and their data types must match in all queries used with set operators.
--The column names in the result set are taken from the first query.
--ORDER BY can only be used at the end of the last SELECT statement

select EmployeeID, EmployeeName, Skill from InternalTraining
UNION ALL
select EmployeeID, EmployeeName from CertifiedSkills;

select EmployeeID, EmployeeName from InternalTraining
UNION ALL
select EmployeeName, Skill from CertifiedSkills;

select EmployeeID , EmployeeName , Skill from InternalTraining
UNION ALL
select EmployeeID empid, EmployeeName name, Skill from CertifiedSkills;

select EmployeeID , EmployeeName , Skill from InternalTraining 
UNION ALL
select EmployeeID , EmployeeName , Skill from CertifiedSkills order by EmployeeID;


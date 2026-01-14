/*
primary key uniquely identifies each row null valeus are not allowed creates the cluster index by default

unique constraints ensure  values in a column are distinct no duplicates null values are allowed most sql dialects allowed one or more null values 
creates a non cluster index by default.
*/

create table employee(
employeeid int primary key,

name varchar(50),
email varchar(100) unique
);

insert into employee values(101, 'sam','sam@company.com');
insert into employee values(102, 'bob','bob@company.com');

select * from employee;

insert into employee values(103, 'samy',null);

/*
you cannot define more than one Primary Key constraint in a single table. 
A Primary Key is the primary means of identifying a row, 
so there can be only one definition.
If you need two columns together (like a Student ID and a Course ID) 
to define a unique row, you create a Composite Primary Key.
This is still one Primary Key, but it consists of multiple columns.
Composite Primary Key: Use when the combination of columns defines the row.
Unique + Not Null: Use when columns are independently unique 
properties of the row (like email, phone, SSN).
*/

create table CourseEnrollments(
	studentid int,
	courseid int,
	enrollmentdate datetime,

	constraint PK_Enrollment primary key(studentid, courseid)
);

select * from CourseEnrollments;

create table Emp(
	employeeId int primary key,
	basicSalary decimal(10,2) not null default 25000 check (basicsalary between 10000 and 2000000)
);

select * from emp;

create table departments(
	departmentid int primary key,
	departmentname varchar(50) not null
);

create table empl(
	employeeid int primary key,
	employeename varchar(50) not null,
	departmentid int,
	constraint FK_department foreign key (departmentid)
	references departments(departmentid)
	On delete cascade
);


select * from departments;

select * from empl;
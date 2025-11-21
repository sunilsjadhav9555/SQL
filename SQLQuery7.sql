 create table employees (
	employeeid int primary key,
	firstname varchar(50),
	lastname varchar(50),
	email varchar(100),
	jobtitle varchar(50)
 );

 insert into employees (employeeid,firstname, lastname, email, jobtitle)
 values
 (1, 'Alice', 'Johnson', 'alice.johnson@example.com', 'Software Engineer'),
(2, 'Bob', 'Smith', 'bob.smith@example.com', 'Data Analyst'),
(3, 'Charlie', 'Brown', 'charlie.brown@gmail.com', 'Project Manager'),
(4, 'Diana', 'Prince', 'diana.prince@example.com', 'HR Specialist'),
(5, 'Ethan', 'Hunt', 'ethan.hunt@amazon.com', 'Security Officer'),
(6, 'Fiona', 'Shaw', 'fiona.shaw@example.com', 'QA Engineer'),
(7, 'George', 'Miller', 'george.miller@example.com', 'Product Manager'),
(8, 'Hannah', 'Lee', 'hannah.lee@yahoo.com', 'UI/UX Designer'),
(9, 'Ivan', 'Petrov', 'ivan.petrov@hotmail.com', 'DevOps Engineer'),
(10, 'Julia', 'Roberts', 'julia.roberts@example.com', 'Business Analyst');

select * from employees;

select ascii('A');
select ascii('b');
select ascii('a');
select ascii('B');
select ascii(' ');
select ascii('\');
select ascii(' ');
select ascii('%');

select char('65');
select char('92');

select * from employees;

select email, CHARINDEX('@',email) as atposition from employees;

select CHARINDEX('av','rasavindrav')

select CHARINDEX('a', 'ravindra', 5)

select employeeid, firstname, lastname, concat(firstname,lastname) as 
fullname from employees;

select CONCAT('pratik','shah')

select concat('pratik', ' ','shah')


select employeeid, firstname,lastname, concat(firstname, ' ', lastname ) as
fullname from employees;

select employeeid, firstname, lastname, CONCAT_WS(' ', firstname, lastname) as
fullname from employees;

select employeeid, firstname, lastname, CONCAT_WS(' ', firstname, lastname, email) as
fullname from employees;

select employeeid, firstname,lastname, concat(firstname, ' ', lastname,' ', email ) as
fullname from employees;

select firstname,lastname,jobtitle, concat_ws('_', firstname, lastname, jobtitle) as
employeessummery from employees;

select firstname, lastname, jobtitle, CONCAT_WS('***', firstname, lastname,jobtitle) as
employeesummery from employees;

select firstname, left(firstname,4) as intials from employees;

select firstname, right(firstname, 2) as initials from employees;

select email,len(email) as emaillength from employees;

select firstname, lower(firstname) as lowercaseemail from employees;

select firstname, upper(firstname) as lowercaseemail from employees;

select firstname, translate(firstname,'ABCDE','12345') as translatedname from employees;

select employeeid, email, PATINDEX('%.com%',email) as
atsymbolposition from employees;

select email, replace(email,'.com','.in') as updatedemail from employees;

update employees
set email= REPLACE(email,'.com','.in')
where email = 'alice.johnson@example.com';

select * from employees;

update employees
set firstname = lower(firstname)
where firstname = 'alice';

select REPLICATE('*', 10) as duplicate;

select firstname,REPLICATE(firstname, 3) from employees;

select firstname, REVERSE(firstname) as reversedname from employees;

select trim ('  hello  ');

select 'alice   '+' end' withoutfunction, RTRIM('                    alice       ')+ 'end' as righttrimmed;

select 'alice      '+' end' withoutfunction, LTRIM('                   alice   ') + 'end' as   righttrimmed;

select email,SUBSTRING(email, 1, 5) as emailstart from employees;

select email, SUBSTRING(email, 5, 7) as emailstart from employees;

select substring('ravindra',1,5)

select SUBSTRING('ravindra', 3, 5)

select email, right(email,11) from employees;

select email, CHARINDEX('@',email) from employees;

select email, len(email) from employees;

select email,right(email, len(email)- charindex('@',email)) from employees;

select email,len(Email) - CHARINDEX('@', email) from employees;
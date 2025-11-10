create table students(
studentid int,
name varchar(100),
age int,
enrollmentdate date
)

select * from students;


insert into students
(Studentid,Name,Age,Enrollmentdate)
values
(101,'pravin',25,'2023-02-24');

insert into students
(studentid, name , age, Enrollmentdate)
values
(102,'sameer',24,'2025-02-23'),
(103, 'manish',23,'2023-04-22'),
(104,'tushar',28,'2024-02-28')

select studentid, name from students;

select studentid, name, age, enrollmentdate
into student_backup
from students;


select * from student_backup;

delete student_backup;

drop table student_backup;

select * into student_backup from students;

delete from student_backup where studentid = 103;
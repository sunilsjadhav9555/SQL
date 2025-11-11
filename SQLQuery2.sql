select * from student_backup;

update student_backup
set name = 'sani'
where studentid = 102;

update student_backup
set name = 'pratik';

exec sp_rename  'backup_of_student', 'student' ;

select * from student;

select * from students where age = 24;

select * from students where age <= 24;

select * from students where age >= 24;

select * from students where age <> 24;

select * from students where age >= 18 AND age <= 24;

select * from students where age > 24 OR Enrollmentdate < '2024-05-01';


alter table backup_of_student add email varchar(100);

update backup_of_student set email = 'jadhav@gmail.com'
where studentid = 104;

alter table backup_of_student alter column age smallint;

alter table backup_of_student drop column email;

exec sp_help 'backup_of_student';

exec sp_rename 'backup_of_student.studentid','std_id', 'column';

select * from students
truncate table students;


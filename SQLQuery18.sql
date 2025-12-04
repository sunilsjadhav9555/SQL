select * from employees;

create procedure welcome
as
begin
	print'hello'
	print 'welcome'
end

execute welcome;

alter procedure welcome
as
begin
	print 'hello'
	print 'welcome'
	print 'how are you'
end

execute welcome;

CREATE TABLE raw_patients (
    patient_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1) CHECK (gender IN ('M','F','O')),
    date_of_birth DATE NOT NULL,
    state_code CHAR(2),
    city VARCHAR(50),
    phone VARCHAR(15)
);

select * from raw_patients;
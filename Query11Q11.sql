UPDATE CustomerGenInfo
SET Gender = CASE 
    WHEN Gender = 'M' THEN 'F'
    WHEN Gender = 'F' THEN 'M'
    ELSE Gender
END;

select * from CustomerGenInfo;
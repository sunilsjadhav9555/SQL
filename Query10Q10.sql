SELECT 
    dept_id,
    STRING_AGG(faculty_name, ', ') AS faculty_list
FROM 
    FacultyAssignments
GROUP BY 
    dept_id;
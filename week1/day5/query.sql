-- 1. Display all records from all tables
SELECT * FROM Department;
SELECT * FROM Student;
SELECT * FROM Staff;
SELECT * FROM Subject;
SELECT * FROM Mark;




-- 2. Display student names with their department names
SELECT s.student_name, d.department_name
FROM Student s
JOIN Department d
ON s.department_id = d.department_id;



-- 3. Display students from Coimbatore ordered by student name
SELECT s.student_name, d.department_name
FROM Student s
INNER JOIN Department d
ON s.department_id = d.department_id
WHERE city = 'coimbatore'
ORDER BY s.student_name;



-- 4. Display department names whose block number is 3
SELECT department_name, department_block_number
FROM Department
WHERE department_block_number = 3
ORDER BY department_name;




-- 5. Find students belonging to Computer Science department
SELECT s.student_name
FROM Student s
JOIN Department d
ON s.department_id = d.department_id
WHERE d.department_name = 'Computer Science';




-- 6. Display subject names with corresponding staff names
SELECT b.subject_name, s.staff_name
FROM Staff s
JOIN Subject b
ON s.staff_id = b.staff_id;

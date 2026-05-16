//creation of table and insertion of values

CREATE TABLE employee_payments (

emp_id INT PRIMARY KEY,

emp_name VARCHAR(50),

department VARCHAR(30),

base_salary DECIMAL(10,2),

bonus DECIMAL(10,2),

joining_date DATE

);
INSERT INTO employee_payments VALUES

(1,'karthik','Data',75000.75,5000.50,'2019-03-15'),

(2,'veena','HR',65000.40,4000.25,'2021-06-20'),

(3,'ravi','Data',85000.90,6000.75,'2016-01-10'),

(4,'anil','Finance',70000.10,NULL,'2020-09-01'),

(5,'suresh','HR',60000.55,3000.30,'2022-11-25');
//queries

SELECT 
    emp_name,
    UPPER(emp_name) AS upper_case,
    LOWER(emp_name) AS lower_case
FROM employee_payments;

SELECT 
    emp_name,
    base_salary,
    bonus,
    base_salary + IFNULL(bonus,0) AS total_income
FROM employee_payments;

SELECT 
    emp_name,
    ROUND(base_salary + IFNULL(bonus,0)) AS total_income
FROM employee_payments;

SELECT 
    emp_name,
    YEAR(joining_date) AS joining_year
FROM employee_payments;

SELECT 
    emp_name,
    joining_date,
    TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) AS experience,
    
    CASE
        WHEN TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) > 7 
            THEN 'Senior'
            
        WHEN TIMESTAMPDIFF(YEAR, joining_date, CURDATE()) BETWEEN 4 AND 7 
            THEN 'Mid'
            
        ELSE 'Junior'
    END AS employee_level

FROM employee_payments;

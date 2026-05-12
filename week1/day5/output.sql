**Schema (MySQL v5.7)**

    -- CREATE DATABASE
    CREATE DATABASE CollegeManagementSystem;
    USE CollegeManagementSystem;
    
    -- 1. Department Table
    CREATE TABLE Department (
        department_id INT PRIMARY KEY,
        department_name VARCHAR(30),
        department_block_number INT
    );
    
    -- 2. Student Table
    CREATE TABLE Student (
        student_id INT PRIMARY KEY,
        student_name VARCHAR(30),
        address VARCHAR(40),
        city VARCHAR(30),
        department_id INT,
        FOREIGN KEY (department_id)
        REFERENCES Department(department_id)
    );
    
    -- 3. Staff Table
    CREATE TABLE Staff (
        staff_id INT PRIMARY KEY,
        staff_name VARCHAR(30),
        department_id INT,
        FOREIGN KEY (department_id)
        REFERENCES Department(department_id)
    );
    
    -- 4. Subject Table
    CREATE TABLE Subject (
        subject_id INT PRIMARY KEY,
        subject_name VARCHAR(30),
        subject_code VARCHAR(10),
        staff_id INT,
        FOREIGN KEY (staff_id)
        REFERENCES Staff(staff_id)
    );
    
    -- 5. Mark Table
    CREATE TABLE Mark (
        value INT,
        subject_id INT,
        student_id INT,
        PRIMARY KEY (subject_id, student_id),
        FOREIGN KEY (subject_id)
        REFERENCES Subject(subject_id),
        FOREIGN KEY (student_id)
        REFERENCES Student(student_id)
    );
    -- Department Table
    INSERT INTO Department VALUES
    (1, 'Computer Science', 1),
    (2, 'Electronics', 3),
    (3, 'Mechanical', 3),
    (4,'cse',3),
    (5,'it',3),
    (6,'se',3);
    
    -- Student Table
    INSERT INTO Student VALUES
    (1, 'Rahul', 'MG Road', 'Hyderabad', 1),
    (2, 'Anjali', 'BTM Layout', 'coimbatore', 1),
    (3, 'Kiran', 'Ameerpet', 'Hyderabad', 2),
    (4, 'Sneha', 'KPHB', 'coimbatore', 3);
    
    -- Staff Table
    INSERT INTO Staff VALUES
    (101, 'Ramesh', 1),
    (102, 'Suresh', 2),
    (103, 'Mahesh', 3);
    
    -- Subject Table
    INSERT INTO Subject VALUES
    (201, 'Database Systems', 'DB101', 101),
    (202, 'Digital Electronics', 'DE102', 102),
    (203, 'Thermodynamics', 'ME103', 103);
    
    -- Mark Table
    INSERT INTO Mark VALUES
    (85, 201, 1),
    (90, 201, 2),
    (78, 202, 3),
    (88, 203, 4);

---

**Query #1**

    SELECT * FROM Department;

| department_id | department_name  | department_block_number |
| ------------- | ---------------- | ----------------------- |
| 1             | Computer Science | 1                       |
| 2             | Electronics      | 3                       |
| 3             | Mechanical       | 3                       |
| 4             | cse              | 3                       |
| 5             | it               | 3                       |
| 6             | se               | 3                       |

---
**Query #2**

    SELECT * FROM Student;

| student_id | student_name | address    | city       | department_id |
| ---------- | ------------ | ---------- | ---------- | ------------- |
| 1          | Rahul        | MG Road    | Hyderabad  | 1             |
| 2          | Anjali       | BTM Layout | coimbatore | 1             |
| 3          | Kiran        | Ameerpet   | Hyderabad  | 2             |
| 4          | Sneha        | KPHB       | coimbatore | 3             |

---
**Query #3**

    SELECT * FROM Staff;

| staff_id | staff_name | department_id |
| -------- | ---------- | ------------- |
| 101      | Ramesh     | 1             |
| 102      | Suresh     | 2             |
| 103      | Mahesh     | 3             |

---
**Query #4**

    SELECT * FROM Subject;

| subject_id | subject_name        | subject_code | staff_id |
| ---------- | ------------------- | ------------ | -------- |
| 201        | Database Systems    | DB101        | 101      |
| 202        | Digital Electronics | DE102        | 102      |
| 203        | Thermodynamics      | ME103        | 103      |

---
**Query #5**

    SELECT * FROM Mark;

| value | subject_id | student_id |
| ----- | ---------- | ---------- |
| 85    | 201        | 1          |
| 90    | 201        | 2          |
| 78    | 202        | 3          |
| 88    | 203        | 4          |

---
**Query #6**

    select s.student_name, d.department_name from Student s
     join Department d
    on s.department_id=d.department_id;

| student_name | department_name  |
| ------------ | ---------------- |
| Rahul        | Computer Science |
| Anjali       | Computer Science |
| Kiran        | Electronics      |
| Sneha        | Mechanical       |

---
**Query #7**

    select s.student_name, d.department_name from Student s
    inner join Department d
    on city='coimbatore' and s.department_id=d.department_id
    order by s.student_name;

| student_name | department_name  |
| ------------ | ---------------- |
| Anjali       | Computer Science |
| Sneha        | Mechanical       |

---
**Query #8**

    select department_name,department_block_number from Department where department_block_number=3
    order by department_name;

| department_name | department_block_number |
| --------------- | ----------------------- |
| cse             | 3                       |
| Electronics     | 3                       |
| it              | 3                       |
| Mechanical      | 3                       |
| se              | 3                       |

---
**Query #9**

    SELECT s.student_name
    FROM Student s
    JOIN Department d
    ON s.department_id = d.department_id
    WHERE d.department_name = 'Computer Science';

| student_name |
| ------------ |
| Rahul        |
| Anjali       |

---
**Query #10**

    select b.subject_name,s.staff_name from
    Staff s join Subject b on s.staff_id=b.staff_id;

| subject_name        | staff_name |
| ------------------- | ---------- |
| Database Systems    | Ramesh     |
| Digital Electronics | Suresh     |
| Thermodynamics      | Mahesh     |

---

[View on DB Fiddle](https://www.db-fiddle.com/)

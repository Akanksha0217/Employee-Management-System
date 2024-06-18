create database employee_mangemnt;
use employee_mangemnt;
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT,
    position VARCHAR(100),
    date_of_hire DATE,
    salary DECIMAL(10, 2),
    contact_info VARCHAR(100),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
CREATE TABLE PerformanceReviews (
    review_id INT PRIMARY KEY,
    employee_id INT,
    review_date DATE,
    score INT,
    feedback TEXT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

CREATE TABLE Attendance (
    attendance_id INT PRIMARY KEY,
    employee_id INT,
    date DATE,
    status VARCHAR(10),
    leave_type VARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

INSERT INTO Departments (department_id, department_name)
VALUES
(1, 'Human Resources'),
(2, 'Engineering'),
(3, 'Sales');
select *from Departments;

INSERT INTO Employees (employee_id, name, department_id, position, date_of_hire, salary, contact_info)
VALUES
(1, 'eknath khan ', 2, 'Software Engineer', '2023-01-15', 70000, 'eknath.khan@example.com'),
(2, 'Ram shinde', 1, 'HR Manager', '2021-05-23', 65000, 'ram.shinde@example.com'),
(3, 'Anu pawer', 3, 'Sales Executive', '2022-09-30', 50000, 'anu.pawer@example.com');
select *from employees;
select *from Departments;
select *from attendance;
select *from performancereviews;

INSERT INTO PerformanceReviews (review_id, employee_id, review_date, score, feedback)
VALUES
(1, 1, '2023-06-01', 85, 'Excellent performance'),
(2, 2, '2023-06-01', 90, 'Outstanding leadership'),
(3, 3, '2023-06-01', 78, 'Good sales skills');
select *from performanceReviews;


INSERT INTO Attendance (attendance_id, employee_id, date, status, leave_type)
VALUES
(1, 1, '2023-06-01', 'Present', NULL),
(2, 2, '2023-06-01', 'Absent', 'Sick Leave'),
(3, 3, '2023-06-01', 'absent', 'function');


select *from attendance; 

SELECT e.name, p.review_date, p.score, p.feedback
FROM Employees e
JOIN PerformanceReviews p ON e.employee_id = p.employee_id
WHERE e.employee_id = 1;

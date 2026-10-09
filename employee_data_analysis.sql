
CREATE DATABASE employee_analysis;
USE employee_analysis;

CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(30),
    salary INT,
    city VARCHAR(30),
    joining_date DATE
);

INSERT INTO employees
(employee_id, name, department, salary, city, joining_date)
VALUES
(1, 'Rahul', 'IT', 65000, 'Hyderabad', '2023-01-15'),
(2, 'Priya', 'HR', 45000, 'Hyderabad', '2022-06-10'),
(3, 'Arjun', 'IT', 72000, 'Bengaluru', '2021-03-20'),
(4, 'Sneha', 'Finance', 55000, 'Hyderabad', '2023-08-05'),
(5, 'Kiran', 'HR', 40000, 'Chennai', '2024-02-12'),
(6, 'Divya', 'IT', 68000, 'Chennai', '2022-11-25'),
(7, 'Vikram', 'Finance', 60000, 'Bengaluru', '2020-07-18'),
(8, 'Ananya', 'Marketing', 48000, 'Hyderabad', '2024-04-01'),
(9, 'Suresh', 'IT', 75000, 'Hyderabad', '2020-09-14'),
(10, 'Meena', 'Marketing', 52000, 'Chennai', '2021-12-03'),
(11, 'Ravi', 'Finance', 58000, 'Hyderabad', '2022-05-22'),
(12, 'Pooja', 'HR', 47000, 'Bengaluru', '2023-10-09');


SELECT * FROM employees;


SELECT name, department, salary
FROM employees
WHERE salary > 60000
ORDER BY salary DESC;


SELECT
    department,
    COUNT(*) AS total_employees,
    AVG(salary) AS average_salary
FROM employees
GROUP BY department
ORDER BY average_salary DESC;


SELECT
    department,
    name,
    salary
FROM employees e
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department = e.department
)
ORDER BY salary DESC;


SELECT
    city,
    COUNT(*) AS total_employees,
    AVG(salary) AS average_salary
FROM employees
GROUP BY city
ORDER BY total_employees DESC;


SELECT
    e.name,
    e.department,
    e.salary
FROM employees e
WHERE e.salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
)
ORDER BY e.department, e.salary DESC;




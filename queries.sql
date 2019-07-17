-- #1: List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
FROM employees AS emp
INNER JOIN salaries AS sal
ON emp.emp_no = sal.emp_no
ORDER BY emp.emp_no ASC;

-- #2: List employees hired in 1986

SELECT * 
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = '1986'
ORDER BY hire_date ASC;

-- #3: ....
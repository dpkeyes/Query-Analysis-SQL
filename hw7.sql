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

-- #3: List the manager of each department with the following information:
-- department number, department name, the manager's employee number, last name, 
-- first name, and start and end employment dates.
SELECT 
departments.dept_no, departments.dept_name, employees.emp_no, 
employees.last_name, employees.first_name, dept_emp.from_date, 
dept_emp.to_date
FROM 
dept_manager 
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN dept_emp ON dept_manager.emp_no = dept_emp.emp_no
INNER JOIN employees ON dept_emp.emp_no = employees.emp_no
ORDER BY departments.dept_no ASC, employees.emp_no ASC;

-- #4: List the department of each employee with the following information:
-- employee number, last name, first name, and department name.

SELECT 
employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM 
employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
ORDER BY employees.emp_no ASC;

-- #5: List all employees whose first name is "Hercules" and 
-- last names begin with "B."
SELECT emp_no, first_name, last_name 
FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%'
ORDER BY emp_no;

-- #6: List all employees in the Sales department, including 
-- their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
ORDER BY employees.emp_no;

-- #7: List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
ORDER BY departments.dept_name, employees.emp_no;

-- #8: In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
-- Drop existing tables if you want to rerun the code
DROP TABLE employees
DROP TABLE salaries
DROP TABLE titles
DROP TABLE departments
DROP TABLE dept_emp
DROP TABLE dept_manager;

-- Create 6 tables to upload data from csvs into
CREATE TABLE employees (
  emp_no INT PRIMARY KEY,
  birth_date DATE,
  first_name VARCHAR,
  last_name VARCHAR,
  gender VARCHAR,
  hire_date DATE
);

CREATE TABLE salaries (
  emp_no INT,
  salary INT,
  from_date DATE,
  to_date DATE,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
  emp_no INT,
  title VARCHAR,
  from_date DATE,
  to_date DATE,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE departments (
  dept_no VARCHAR PRIMARY KEY,
  dept_name VARCHAR
);

CREATE TABLE dept_emp (
  emp_no INT,
  dept_no VARCHAR,
  from_date DATE,
  to_date DATE,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
  dept_no VARCHAR,
  emp_no INT,
  from_date DATE,
  to_date DATE,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
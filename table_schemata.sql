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
  emp_no INT PRIMARY KEY,
  salary INT,
  from_date DATE,
  to_date DATE,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE titles (
  emp_no INT PRIMARY KEY,
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
  emp_no INT PRIMARY KEY,
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

--- CODE FOR QUICK DATABASEDIAGRAMS.COM FOR REFERENCE ONLY ---

-- employees
-- -
-- emp_no PK int
-- birth_date date
-- first_name varchar(200)
-- last_name varchar(200)
-- gender varchar(200)
-- hire_date date

-- salaries
-- -
-- emp_no PK int FK >- employees.emp_no
-- salary int 
-- from_date date
-- to_date date

-- titles
-- -
-- emp_no PK int FK >- employees.emp_no
-- title varchar(200)
-- from_date date
-- to_date date

-- departments
-- -
-- dept_no PK int
-- dept_name varchar(200)

-- dept_emp
-- -
-- emp_no PK int FK >- employees.emp_no
-- dept_no varchar(200) FK >- departments.dept_no
-- from_date date
-- to_date date

-- dept_manager
-- -
-- dept_no varchar(200) FK >- departments.dept_no
-- emp_no int FK >- employees.emp_no
-- from_date date
-- to_date date
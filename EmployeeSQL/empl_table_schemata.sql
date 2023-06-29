-- Creating tables for Module 9 Challenge
-- Create table for titles.csv (1)
CREATE TABLE titles (
	title_id VARCHAR NOT NULL, 
	title VARCHAR NOT NULL,
	PRIMARY KEY (title_id)
);

SELECT * 
FROM titles

-- Create table for departments.csv (2)
CREATE TABLE departments (
  	dept_no VARCHAR NOT NULL,
   	dept_name VARCHAR NOT NULL,
	PRIMARY KEY (dept_no)
);

SELECT * 
FROM departments

-- Create table for employees.csv (3)
CREATE TABLE employees (
  	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR(10),
	birth_date DATE,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
 );

SELECT * 
FROM employees

-- Create table for salaries.csv (4)
CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

ALTER TABLE IF EXISTS public.salaries
    ADD COLUMN salary_id SERIAL PRIMARY KEY

SELECT * 
FROM salaries

-- Create table for dept_emp.csv (5)
CREATE TABLE dept_emp (
  	emp_no INTEGER NOT NULL,
	dept_no VARCHAR NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
 );

ALTER TABLE IF EXISTS public.dept_emp
    ADD COLUMN demp_id SERIAL PRIMARY KEY

SELECT *
FROM dept_emp

-- Create table for dept_manager.csv (6)
CREATE TABLE dept_manager (
  	dept_no VARCHAR(10) NOT NULL,
	emp_no INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
 );

ALTER TABLE IF EXISTS public.dept_manager
    ADD COLUMN mng_id SERIAL PRIMARY KEY

SELECT * 
FROM dept_manager
 
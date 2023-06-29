-- Data Analysis Pewlett Hackard about people whom the company employed during the 1980s and 1990s.
-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s
	ON e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date > '1985-12-31' AND hire_date < '1987-01-01'
ORDER BY hire_date;

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name
FROM dept_manager m
JOIN departments d
	ON m.dept_no = d.dept_no
JOIN employees e
	ON m.emp_no = e.emp_no
ORDER BY dept_no;

--4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT d.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp n
	ON n.emp_no = e.emp_no
JOIN departments d
	ON d.dept_no = n.dept_no
ORDER BY emp_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
ORDER BY last_name;

--6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, last_name, first_name
FROM employees e
JOIN dept_emp n
	ON n.emp_no = e.emp_no
	WHERE n.dept_no 
	IN (
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales');

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, last_name, first_name, d.dept_name
FROM employees e
JOIN dept_emp n
	ON n.emp_no = e.emp_no
JOIN departments d
	ON d.dept_no = n.dept_no
	AND (dept_name = 'Development'
	OR dept_name = 'Sales'); 

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT COUNT(last_name), last_name
FROM employees
GROUP BY (last_name)
ORDER BY COUNT(last_name) DESC;


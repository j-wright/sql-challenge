-- List emp_no, last name, first name, sex, and salary for each employee
SELECT e.emp_no, last_name, first_name, sex, s.salary
FROM employees AS e
JOIN salaries AS s
ON (e.emp_no = s.emp_no);

-- List first name, last name, and hire date for employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- List manager of each department, dept_no, dept_name, emp_no, last name, first name
SELECT D.dept_no, dept_name, DM.emp_no, E.last_name, E.first_name
FROM departments AS D
JOIN department_managers AS DM
ON DM.dept_no = D.dept_no
JOIN employees as E
ON E.emp_no = DM.emp_no

-- List employee of each department, dept_no, emp_no, last name, first name, and dept_name
SELECT D.dept_no, DE.emp_no, E.last_name, E.first_name, dept_name
FROM departments AS D
JOIN department_employees AS DE
ON DE.dept_no = D.dept_no
JOIN employees as E
ON E.emp_no = DE.emp_no

-- List first name, last name, and sex of each employee whose first name is Hercules
-- and whose last name begins with the letter B
SELECT first_name, last_name, sex 
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'

-- List each employee in the Sales department, icluding emp_no, last name, first name
SELECT emp_no, last_name, first_name
FROM employees
WHERE emp_no IN
(
	SELECT emp_no 
	FROM department_employees
	WHERE dept_no IN
	(
		SELECT dept_no 
		FROM departments
		WHERE dept_name = 'Sales'
	)
);

-- List each employee in the Sales and Development deptmnts, include emp_no
-- last name, first name, and department_name
SELECT de.emp_no, last_name, first_name, dept_name
FROM departments AS d
JOIN department_employees AS de
ON de.dept_no = d.dept_no
JOIN employees AS e
ON e.emp_no = de.emp_no
WHERE dept_name = 'Development' OR dept_name = 'Sales'

-- List the frequency counts, in descending order, of all the employee last names
-- (that is, how many employees share each last name).
SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name
ORDER BY count DESC
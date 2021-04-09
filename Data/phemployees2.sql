-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND hire_date BETWEEN '1985-01-01' and '1988-12-31';

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Create new table with those likely to retire
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND hire_date BETWEEN '1985-01-01' and '1988-12-31';

DROP TABLE retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info

SELECT d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
FROM departments AS d
INNER JOIN dept_manager AS dm
ON d.dept_no = dm.dept_no;

SELECT to_date FROM dept_emp;

SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
de.to_date
-- INTO current_emp
FROM retirement_info AS ri
LEFT JOIN dept_emp AS de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT * FROM retirement_info

SELECT COUNT(ce.emp_no), de.dept_no
INTO dept_count
FROM current_emp as ce
left join dept_emp as de
on ce.emp_no = de.emp_no
group by de.dept_no
order by de.dept_no;

SELECT emp_no,
    first_name,
last_name,
    gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
s.salary,
   s.to_date
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)


SELECT e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    	s.salary,
    		de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

SELECT * FROM current_emp ORDER BY to_date ASC;

-- List of managers per department
SELECT dm.dept_no,
	d.dept_name,
	dm.emp_no,
	ce.last_name,
	ce.first_name,
	dm.from_date,
	dm.to_date
INTO manager_info
FROM dept_manager AS dm
	INNER JOIN departments AS d
		ON dm.dept_no = d.dept_no
	INNER JOIN current_emp AS ce
		on dm.emp_no = ce.emp_no;
		
SELECT ce.emp_no,
	ce.first_name,
	ce.last_name,
		d.dept_name
INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp as de
	ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
	on (d.dept_no = de.dept_no);
	
SELECT * FROM DEPARTMENTS

SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
		d.dept_name
FROM retirement_info AS ri
INNER JOIN dept_emp AS de
	ON ri.emp_no = de.emp_no
INNER JOIN departments as d
	ON d.dept_no = de.dept_no
WHERE de.dept_no = 'd007' OR de.dept_no = 'd005';


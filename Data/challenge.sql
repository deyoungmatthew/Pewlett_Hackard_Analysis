-- Deliverable 1
SELECT e.emp_no,
	e.first_name,
	e.last_name,
		t.title,
		t.from_date,
		t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles;

SELECT COUNT(emp_no) FROM retirement_titles;

SELECT COUNT(emp_no) as "Retirement Count", 
title as "Title"
FROM retirement_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

-- Deliverable 2
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles AS rt
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM unique_titles;

SELECT COUNT(emp_No) FROM unique_titles;

SELECT COUNT(emp_no) as "Retirement Count", 
title as "Title"
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

SELECT COUNT(u.title), 
u.title
INTO retiring_titles
FROM unique_titles AS U
GROUP BY u.title
ORDER BY COUNT (u.title) DESC;

SELECT * FROM retiring_titles;


SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
		de.from_date,
		de.to_date,
			t.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
INNER JOIN titles AS t
	ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (t.to_date = '9999-01-01')
ORDER BY e.emp_no ASC;

SELECT COUNT(DISTINCT(emp_no)) FROM mentorship_eligibility;

SELECT COUNT(emp_no) as "Employee Count" ,
	title as "Title"
FROM mentorship_eligibility
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

SELECT COUNT(DISTINCT(emp_no)) FROM employees;

-- 
SELECT ut.emp_no,
	ut.first_name,
	ut.last_name,
		d.dept_name,
			e.birth_date,
				t.title
INTO first_year
FROM unique_titles AS ut
INNER JOIN employees AS e
ON ut.emp_no = e.emp_no
	INNER JOIN dept_emp AS de
	ON ut.emp_no = de.emp_no
		INNER JOIN departments AS d
		ON d.dept_no = de.dept_no
			INNER JOIN titles AS t
			on t.emp_no = ut.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1952-12-31')
ORDER BY ut.emp_no;

SELECT * FROM first_year;

SELECT COUNT(emp_no) AS "Employee Total",
	title AS "Title"
INTO title_first_year
FROM first_year
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

SELECT * FROM title_first_year;

SELECT COUNT(emp_no) AS "Employee Total",
	dept_name AS "Department"
INTO dept_first_year
FROM first_year
GROUP BY dept_name
ORDER BY COUNT(emp_no) DESC;

SELECT * FROM dept_first_year;


-- Deliverable 1: #1-7
-- Create table of all retiring employees (i.e. birth date b/w 1952 and 1955) and their titles
SELECT e.emp_no, 
	e.first_name, 
	e.last_name,
	t.title, 
	t.from_date, 
	t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN title as t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Deliverable 1: #8-14
-- Create table to remove duplicates from above and keep only recent title of each employee
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, to_date DESC;

-- Deliverable 1: #15-21
-- Create table which counts the number of employees retiring under each title
SELECT COUNT(title), title 
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

-- Deliverable 2: #1-11
-- Create table of mentorship eligibility (i.e. employees who are eligible to particpate)
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name, 
	e.last_name,
    e.birth_date,
	de.from_date, 
	de.to_date,
    t.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN title as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;

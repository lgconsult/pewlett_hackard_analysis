-- retiring employees by title
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
INTO retire_title
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no


SELECT * FROM retire_title;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no)
rt.emp_no, 
rt.first_name,
rt.last_name,
rt.title
INTO actually_retiring
FROM retire_title AS rt
WHERE (rt.to_date = '9999-01-01')
ORDER BY rt.emp_no;

SELECT * FROM actually_retiring

DROP TABLE actually_retiring

--Number of employees retiring by title
SELECT COUNT (ar.emp_no),
	ar.title
INTO retiring_titles
FROM actually_retiring as ar
GROUP BY ar.title
ORDER BY count DESC;

--deliverable # 2

SELECT DISTINCT ON (e.emp_no)
	e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_elig
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;
--DELIVERABLE -1
SELECT e.emp_no,
		e.first_name,
		e.last_name,
		tt.title,
		tt.from_date,
		tt.to_date
INTO retirement_titles		
FROM employees AS e
INNER JOIN titles as tt
 ON (e.emp_no =tt.emp_no)
 WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
 ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
				first_name,
				last_name,
				title

INTO Unique_Titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

--Retrieve the number of emplyees by their most recent job title

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title 
ORDER BY count(title) DESC;


--DELIVERABLE 2


SELECT DISTINCT ON (emp_no) e.emp_no,
		e.first_name,
		e.last_name,
		e.birth_date,
		de.from_date,
		de.to_date,
		t.title
		
INTO mentorship_eligibilty	
FROM employees as e	
	INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
	INNER JOIN titles AS t
	ON (e.emp_no= t.emp_no)
	
WHERE (de.to_date = '9999-01-01') 
AND (e.birth_date BETWEEN '1965-01-01'AND '1965-12-31')
ORDER BY emp_no

--Deliverable 3

--Total number of employees retiring
SELECT COUNT(title) 
FROM unique_titles;

-- No of employess eligibile for mentorship by each title
SELECT COUNT(title), title
FROM mentorship_eligibilty	
GROUP BY title 
ORDER BY count(title) DESC;

--Total number of employees elibile for mentorship
SELECT COUNT(title)
FROM mentorship_eligibilty;

--Number of employees retiring by department
SELECT ut.emp_no,
	ut.first_name,
	ut.last_name,
	ut.title,
	d.dept_name
INTO department_unique_title
FROM unique_titles as ut
INNER JOIN dept_emp as de
ON (ut.emp_no = de.emp_no)
INNER JOIN departments as d
ON (d.dept_no = de.dept_no)
ORDER BY ut.emp_no, de.to_date DESC;


--Employess retiring by tiles and department
SELECT COUNT(title),title, dept_name
INTO retiring_title_by_department
FROM department_unique_title
GROUP BY dept_name, title
ORDER BY dept_name ASC;

-- Total number of emplyees retiring from each department
SELECT COUNT(emp_no), dept_name
FROM department_unique_title
GROUP BY dept_name
ORDER BY COUNT(title) DESC;


--Qualified retiring emplyees for training
SELECT count(ru.title),ru.title, ru.dept_name
FROM department_unique_title AS ru
WHERE ru.title IN ( 'Senior Staff', 'Manager','Senior Engineer')
GROUP BY ru.dept_name, ru.title
ORDER BY COUNT(ru.title) DESC;



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




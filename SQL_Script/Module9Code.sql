CREATE TABLE titles(
	title_id VARCHAR(5)) PRIMARY KEY,
	title VARCHAR(20)
);

CREATE TABLE employees(
	emp_no INTEGER PRIMARY KEY,
	emp_title_id VARCHAR(5),
	birth_date DATE,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	sex VARCHAR(1),
	hire_date DATE,	
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(20)
);

CREATE TABLE dept_manager(
	dept_no VARCHAR(4),
	emp_no INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE dept_emp(
	emp_no INTEGER,
	dept_no VARCHAR(4),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY(emp_no, dept_no)
);

CREATE TABLE salaries(
	emp_no INTEGER PRIMARY KEY,
	salary INTEGER,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
  ON e.emp_no = s.emp_no;


SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM departments AS d
JOIN dept_manager AS dm
  ON d.dept_no = dm.dept_no
JOIN employees AS e
  ON dm.emp_no = e.emp_no;

SELECT e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON e.emp_no = de.emp_no
JOIN departments AS d
  ON de.dept_no = d.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
	AND last_name LIKE 'B%';

SELECT e.emp_no, e.first_name, e.last_name
FROM employees AS e
JOIN dept_emp AS d
  ON e.emp_no = d.emp_no
JOIN departments AS de
  ON d.dept_no = de.dept_no
  WHERE de.dept_name = 'Sales';

SELECT e.emp_no, e.first_name, e.last_name, de.dept_name
FROM employees AS e
JOIN dept_emp AS d
  ON e.emp_no = d.emp_no
JOIN departments AS de
  ON d.dept_no = de.dept_no
  WHERE de.dept_name IN ('Sales', 'Development')
  ORDER BY de.dept_name;

SELECT last_name, COUNT(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

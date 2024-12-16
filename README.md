# sql-challenge

# sql-challenge
Bootcamp SQL Challenge using PostGress

In this challenge we were required to use Postgres to load and evaluate some data in a database that was provided to us.  First, we had to create a database, which I called Module_9_Database.
After creating each table, with each column crafted by data type, we were asked to load provided CSV files into the Database.  The snag was that we had to create the database tables in the correct order so that primary and foreign keys would work as designed.  Additionally, the data had to be loaded in the same order that the tables were created or else you would end up with a 'column' error.  Following this task, we were also asked to create queries to find additional informaiton contained within our database.

The queries were as followed (provided by the rubric for the module.

List the employee number, last name, first name, sex, and salary of each employee.
  To do this, you had to select the columns you were looking for from the employee table and join on employee ID the salary table to output the properly aligned employees with their names, ids and salaries
  
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s
  ON e.emp_no = s.emp_no;

List the first name, last name, and hire date for the employees who were hired in 1986.
  In this query, we were asked to find information on employees who were hired to the firm in 1986.  This required us to use a WHERE clause as well as BETWEEN in order to sort and query this information.  Additionally, we
  had to ensure to use ''s for the dates.

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';
  

List the manager of each department along with their department number, department name, employee number, last name, and first name.
  In this query, we were asked to sort out the manager of each department along with their department name and company information.  In this query, we had to do a double join in order to pull all required and
  connected information using the primary keys of several different tables and foreign keys of several others to aggregate the information sought.

SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM departments AS d
JOIN dept_manager AS dm
  ON d.dept_no = dm.dept_no
JOIN employees AS e
  ON dm.emp_no = e.emp_no;  

List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
  In this query, we had to join the employee table to the department employee table and the departments table.  Using the primary key of employee ID, we were able to match the department name, number and employee data
  for each employee in the firm.

SELECT e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
  ON e.emp_no = de.emp_no
JOIN departments AS d
  ON de.dept_no = d.dept_no;  

List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
  In this query, we needed to select the requested information from the employee table and then sort out how many people had the first name of Hercules and the last name beginning with the letter B.  We used
  the WHERE clause to first find those with the first name of "Hercules" and then used a LIKE clause with a % wildcard to sort out who has both the first name and last name requirements.

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' 
	AND last_name LIKE 'B%';

List each employee in the Sales department, including their employee number, last name, and first name.
  In this query we had to select the appropriate columns in the employee table and then join them to the department employees table and the departments table.  We joined on the Primary Key of employee ID to find which department employees were assigned to and then joined the departments table to sort those employees who were in the "Sales" department.

SELECT e.emp_no, e.first_name, e.last_name
FROM employees AS e
JOIN dept_emp AS d
  ON e.emp_no = d.emp_no
JOIN departments AS de
  ON d.dept_no = de.dept_no
  WHERE de.dept_name = 'Sales';

List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
  This query was very similar to the former, we had to do the same thing, but then for our WHERE stament, we had to use IN to pull employee information from both the "Sales" 
  and "Development" departments.

SELECT e.emp_no, e.first_name, e.last_name, de.dept_name
FROM employees AS e
JOIN dept_emp AS d
  ON e.emp_no = d.emp_no
JOIN departments AS de
  ON d.dept_no = de.dept_no
  WHERE de.dept_name IN ('Sales', 'Development')
  ORDER BY de.dept_name;

List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
  For this query we had to select the last name of the employees from the employee table and then count the frequency with which each last name occurred.  We used the count clause in SQL to accomplish this task. After we set it up and created and alias, we grouped by last name to get the final count of frequency.  We then ordered the output table by frequency from most to least.

SELECT last_name, COUNT(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

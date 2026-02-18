USE ORGANISATION;

select * from employees;



1. Aggregate Functions

COUNT();

SELECT COUNT(commision_pct) AS total_employeess
FROM employees;


Counts total number of employeess.

SUM();

SELECT SUM(salary) AS total_salary
FROM employees;

Calculates total of all salaries.

AVG();

SELECT AVG(salary) AS avg_salary
FROM employees;


Finds the average employees salary.

MIN() / MAX();

SELECT MIN(first_name) AS min_salary, MAX(first_name) AS max_salary
FROM employees;

select salary from employees order by salary desc limit 10  offset 9 ;


select department_id,sum(salary),max(Salary),min(Salary),avg(Salary) from employees 
group by department_id;

select * from employees order by department_id asc,first_name asc;
Returns the lowest and highest salaries.

Aggregate per Department;

select * from employees;
SELECT d.dept_name, COUNT(e.emp_id) AS emp_count, AVG(e.salary) AS avg_salary
FROM employees e
JOIN department d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;


---

 2. String Functions

CONCAT();

SELECT CONCAT(first_name,' ',last_name, ' works in Department ID ', department_id) 
AS employees_info
FROM employees;

Combines strings into one column.

SUBSTRING();

SELECT first_name, SUBSTRING(first_name, 1, 3) AS short_name
FROM employees;


Extracts first 3 letters of each name.

UPPER() / LOWER();


SELECT UPPER(first_name) AS upper_name, LOWER(first_name) AS lower_name
FROM employees;


TRIM();

SELECT ('   John Doe   '),TRIM('   John             Doe   ') AS trimmed_name from dual;


Removes leading and trailing spaces.

LENGTH();


SELECT first_name, LENGTH(first_name) AS name_length
FROM employees;


REPLACE();

SELECT REPLACE(first_name, 'Steven', 'Stev') AS modified_name
FROM employees;


Replaces “Doe” with “Smith”.

---

3. Numeric Functions

	1. Round 100.2 --->100
	2. Ceil (Give the next value of decimal) 10.2 11 10.98 11
	3. Floor	(Remove the decimal)
	4. Mod
	5. ABS;

select round(28.454,2) from dual;
select ceil(28.15/2) from dual;
select floor(28.85/2) from dual;
select mod(11.5,2) from dual;
select abs(-10),abs(+10) from dual;


ROUND();
use organisation;
;
SELECT first_name, ROUND(salary, 2) AS monthly_salary
FROM employees;

select * from employees;
Rounds salary to 2 decimal places.

CEIL();


SELECT first_name, CEIL(salary / 15) AS salary_in_thousands
FROM employees;


Rounds up to nearest integer.

FLOOR()


SELECT first_name, FLOOR(salary / 1000) AS salary_in_thousands
FROM employees;


Rounds down to nearest integer.

ABS();


SELECT first_name, salary  AS salary_difference
FROM employees;


Returns absolute difference from 60000.

---

4. Date Functions;

NOW();

SELECT NOW() AS current_datetime;


Returns current date and time.;

CURRENT_DATE();

SELECT current_date()  FROM DUAL;

.CURRENT_TIME();

SELECT current_TIME()  FROM DUAL;


DATE();

use organisation;

SELECT time('2025-11-25 08:16:10') AS time
FROM dual;


Extracts just the date part (no time).

DATEADD() (in My use `DATE_ADD()`);

SELECT first_name,hire_date, 
DATE_ADD(hire_date, INTERVAL -1 quarter) AS next_anniversary
FROM employees;


Adds one year to each hire date.

DATEDIFF();

SELECT first_name,hire_date, 
DATEDIFF(current_date, hire_date) AS days_worked
FROM employees;


Number of days since hire.

---

 5. Conversion Functions

CAST();


SELECT first_name, TO_CHAR(SALARY) AS salary_text
FROM employees;


Converts numeric salary to text.

CONVERT();


SELECT first_name, CONVERT(salary, char) AS salary_as_text,salary as salary_as_num
FROM employees;


Same as `CAST()` — My allows both.

---

Combined Example


SELECT 
    e.first_name,
    d.dept_name,
    CONCAT(UPPER(SUBSTRING(e.first_name, 1, 1)), LOWER(SUBSTRING(e.first_name, 2))) AS formatted_name,
    ROUND(e.salary / 12, 2) AS monthly_salary,
    DATEDIFF(CURDATE(), e.hire_date) AS days_in_company,
    CAST(e.salary AS CHAR) AS salary_as_text
FROM employees e
JOIN department d ON e.dept_id = d.dept_id;


Combines string, numeric, date, and conversion functions in one query.


WHERE clause specifies search conditions for the rows returned by the Query and limits rows to a specific row-set. 
If a table has huge amount of records and if someone wants to get the particular records then using the ‘where’ clause is useful.

GROUP BY clause summaries identical rows into a single/distinct group and returns a single row with the summary for each group, 
by using appropriate Aggregate functions in the SELECT list, like COUNT(), SUM(), MIN(), MAX(), AVG(), etc.




select * from employees;







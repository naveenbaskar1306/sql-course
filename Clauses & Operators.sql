SQL is a standard language for storing, manipulating, and retrieving data in databases.

Data validation 

SQL can execute queries against a database
SQL can retrieve data from a database
SQL can insert records into a database
SQL can update records in a database
SQL can delete records from a database
SQL can create new databases
SQL can create new tables in a database
SQL can create stored procedures in a database
SQL can create views in a database
SQL can set permissions on tables, procedures, and views

---------------------------------------------------------------

Clauses:
-------------
	1. Select _ for selecting the Column 
	2. from	 - Indicate the table where its from.
	3. Where (Condition)-Filter the base data.
	5. Group By - Help to aggregate the data.
	4. Having -Filter the aggregated data
	6. Order by - Help to sorting the data Asc or Desc
	7. Limit/rownum - Return the data to a row count 

Operators:
---------------
1. =
2. <> ,!=
3. >
4. <
5. >=
6. <=
7. IN/Not in
8. Between/not between  >= 10000 and <= 20000
9. like
10.AND
11.OR
-------;

select * from employees where SALARY BETWEEN 10000 AND 20000;

select employee_id,
		first_name name,
        salary,
        department_id 
from employees 
where employee_id = 100 and employee_id = 100
order by employee_id;

use organisation;

select employee_id,first_name,last_name,salary from employees where employee_id in   ( 100,101,102,103,104) or salary > 10000 or salary < 5000;

select * from employees where employee_id not in( 100,101,102,103);
select employee_id,first_name from employees  order by  employee_id desc ;
select first_name as name ,salary,employee_id as id from employees;

select employee_id as id,first_name as name ,salary from employees order by salary asc,id desc;

select *,upper(first_name) from employees where upper(first_name) = 'steven'       ;

select * from employees where salary not between 17000 and 24000;
select * from employees where first_name <> 'STEVEN' ORDER BY EMPLOYEE_ID ASC;

SELECT * FROM EMPLOYEES WHERE salary > 17000;

SELECT * FROM EMPLOYEES WHERE salary >= 17000;

SELECT * FROM EMPLOYEES WHERE salary < 17000 ORDER BY SALARY DESC;

SELECT * FROM EMPLOYEES WHERE salary <= 17000 ORDER BY SALARY DESC;

SELECT * FROM EMPLOYEES WHERE salary BETWEEN 10000  AND 17000 ORDER BY SALARY DESC;

SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 100 OR EMPLOYEE_ID=105;


SELECT * FROM EMPLOYEES WHERE FIRST_NAME = 'STEVEN' AND LAST_NAME = 'KING';

SELECT * FROM EMPLOYEES WHERE FIRST_NAME = 'STEVEN' OR LAST_NAME = 'KING';

SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID IN (100,105,110,120,125) OR SALARY > 15000;

SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID NOT IN (100,105,110,120,125);

SELECT * FROM EMPLOYEES WHERE FIRST_NAME  LIKE 'Steve_n';

SELECT * FROM EMPLOYEES WHERE employee_id  LIKE '10_';

SELECT * FROM EMPLOYEES WHERE FIRST_NAME  LIKE 'St___n';

SELECT * FROM EMPLOYEES WHERE FIRST_NAME  LIKE 'STE_EN';

SELECT * FROM EMPLOYEES WHERE FIRST_NAME  LIKE '_____EN';

select * from employees where salary between 10000 and 12000;


select * from employees;

select * from departments;

select * from employees where employee_id = 100 or salary = 17000;

use organisation;

select avg(salary),department_id from employees group by department_id;


select department_id,sum(salary) 
from employees 
group by department_id,job_id;


select * from departments;



select sum(salary) from emplyees group by department_id;

select * from employees where first_name like '%e%e_n';

use organisation;

select * from employees order by employee_id desc limit 100 offset 10;


select * from employees where employee_id = 100 or employee_id = 101;
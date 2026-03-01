use organisation;
create database asif;
select * from employees;

select * from departments;

select job_id,department_id,sum(salary) from employees group by job_id,department_id;

select department_id,count(employee_id) as employee_count from employees
group by department_id,manager_id;

select department_id,sum(salary) from employees
 group by department_id having sum(salary) > 20000;



SELECT d.department_name,
       COUNT(e.employee_id) AS total_employees,
       round(AVG(e.salary),2) AS avg_salary
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY avg_salary DESC;


SELECT e.first_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id = (
    SELECT department_id FROM employees WHERE first_name = 'Neena'
)
AND e.first_name <> 'Neena';



SELECT a.department_name, a.avg_salary
FROM (
    SELECT d.department_name as department_name, AVG(e.salary) AS avg_salary
    FROM departments d
    JOIN employees e ON d.department_id = e.department_id
    GROUP BY d.department_name
    ORDER BY avg_salary DESC
) a
limit 1;

,
       DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dense_rank_in_dept,
	   ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_num,
  select salary,LAG(salary) OVER (PARTITION BY department_id ORDER BY salary) AS prev_salary,
       LEAD(salary) OVER (PARTITION BY department_id ORDER BY salary) AS next_salary,
       NTILE(4) OVER (ORDER BY salary DESC) AS salary_band
       ;
use organisation;

SELECT first_name,
       department_id,
       salary,
       RANK() OVER ( partition by  department_id ORDER BY salary  DESC) AS rank_in_dept,
       DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS dense_rank_in_dept,
	   ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary DESC) AS row_num,
	   LAG(salary) OVER (PARTITION BY department_id ORDER BY salary) AS prev_salary,
       LEAD(salary) OVER (PARTITION BY department_id ORDER BY salary) AS next_salary,
       NTILE(4) OVER (ORDER BY salary DESC) AS salary_band,
       LAG(salary) OVER (ORDER BY salary asc) AS prev_salary,
       LEAD(salary) OVER (ORDER BY salary asc) AS next_salary
FROM employees;






LAG(salary) OVER (partition by  department_id ORDER BY salary  desc) AS prev_salary,
       LEAD(salary) OVER (partition by department_id  ORDER BY salary desc) AS next_salary,
use organisation;

SELECT MAX(SALARY) FROM EMPLOYEES  WHERE SALARY <
(
SELECT MAX(SALARY) FROM EMPLOYEES
) 
WHERE SALARY < 
(
SELECT MAX(SALARY) FROM EMPLOYEES
)
);

1000   3
3000   1
3000   1
3000   1
2000   2;

WITH CTE AS(
SELECT first_name,
       department_id,
       salary,
       ROW_NUMBER() OVER (PARTITION BY DEPARTMENT_ID ORDER BY salary DESC) AS rank_in_dept
FROM employees
ORDER BY department_id, salary DESC
)

SELECT * FROM CTE WHERE RANK_IN_DEPT = 2;



AND DEPARTMENT_ID=100 LIMIT 1;




SELECT * FROM EMPLOYEES ;



use organisation;

select sum(salary),department_id from employees group by department_id;

select avg(salary),department_id from employees group by department_id;

select first_name,salary,department_id from employees e
where salary > 
(select avg(salary) from employees e1 where e.department_id =  e1.department_id);

select * from employees;

create view emp_view as select * from employees where department_id = 90;

select  * from emp_view;








with CTE as 
(
select first_name,last_name,salary,department_id,LENGTH(first_name) as len from employees
)

, CTE1 as (
select *  from CTE  where len > 5 )

select * from CTE1 WHERE SALARY > 6000;





select * from CTE;




with cte as(
SELECT first_name,
       department_id,
       salary,
       DENSE_RANK() OVER (partition by department_id ORDER BY salary DESC) AS dense_rank_in_dept
FROM employees
ORDER BY department_id,dense_rank_in_dept
)

select first_name,department_id,salary from CTE WHERE DENSE_RANK_IN_DEPT=3; 

WITH AVERAGE_SALARY AS (
 SELECT AVG(SALARY) as AVERAGE,DEPARTMENT_ID FROM EMPLOYEES GROUP BY DEPARTMENT_ID
)
SELECT DEPARTMENT_ID FROM AVERAGE_SALARY WHERE AVERAGE > 10000;







SELECT AVG(SALARY),DEPARTMENT_ID FROM EMPLOYEES  GROUP BY DEPARTMENT_ID  HAVING AVG(SALARY) > 10000;

with high_Sal as (
select employee_id,
		first_name,
        department_id,
        salary ,        
        dense_rank() over (partition by department_id order by salary desc) as DENSE_RANK_IN_SALARY
        from employees
        )
select  employee_id,
		first_name,
        department_id,
        salary 
        from high_Sal 
        where DENSE_RANK_IN_SALARY =  3;


with cte as (
select * from employees where department_id in( 10,20,30,40,50)
)

,cte1 as(
select employee_id ,first_name,salary from cte where department_id = 10);


WITH TABLE_A AS(


SELECT first_name,
       department_id,
       salary,
       dense_RANK() OVER ( partition by  department_id ORDER BY salary  DESC) AS rank_in_dept
FROM employees WHERE RANK_IN_DEPT = 3

)
SELECT * FROM TABLE_A WHERE RANK_IN_DEPT = 3;



) TABLE_a
where rank_in_dept = 3;


use organisation;

select * from employees where department_id =(
select department_id from departments where department_name ='Shipping');



with employeess as (
			select employee_id,first_name,salary,department_id 
					from employees 
                    )
	, departmentss as (
			select department_id,department_name 
                    from  departments
                    )
                    
select e.employee_id,
		e.first_name,
        e.salary,
        d.department_name
        from employeess e
        inner join departmentss d
        on e.department_id = d.department_id;
					












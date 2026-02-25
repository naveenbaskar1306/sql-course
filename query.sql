use employee

select e.first_name,e. salary, d.department_name from employees e 
right join departments d 
on  e.department_id=d.department_id;

select e.first_name,d.department_name
from employees e
inner join departments d
on e.department_id=d.department_id;

SELECT 
    e.employee_id,
    e.first_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id;

SELECT 
    e.employee_id,
    e.first_name,
    d.department_name
FROM employees e
JOIN departments d
    ON e.department_id = d.department_id;

SELECT e.department_id, d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id where salary>"15000";
    
     select * from  departments
 select e1.employee_id, e2.first_name as manager_name  from employees e1
 inner join employees e2 on e1.department_id=e2. department_id;
 
  select * from employees;
  with employee1 as (
   select employee_id,first_name,salary,department_id,
   rank() over (order by salary desc) as rnk,
   dense_rank() over(order by salary desc) as desn_rnk   
from employees),
employee2 as (
select   first_name , salary, department_id from employees
)



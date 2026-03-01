use organisation;
create view Shipping as select employee_id,first_name,salary from employees where department_id = 10 ;
drop view 	shipping;
select * from shipping;

create view Employees_Data as 

with CTE as (
select emp_id, name, position, salary,last_modified,
	   row_number() over (partition by emp_id order by last_modified desc) as latest_date
       from emp
       )
select  emp_id, name, position, salary from CTE where latest_date = 1;



select * from emp;



create view Latest_Employee_data as 
with employee_data as (

select emp_id,
	   name,
       position,
       salary,
       row_number() over (partition by emp_id order by last_modified desc) as rn
       from emp
       )
       
select emp_id,name,position,salary from employee_data where  rn = 1;



select emp_id,salary,name from Latest_Employee_data;









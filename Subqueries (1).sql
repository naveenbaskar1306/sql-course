
select employee_id,
       first_name,
       last_name,
       salary,
       department_id 
       from hr.employees 
       where department_id in 
       (
        select  department_id 
                from hr.departments 
                where location_id in 
                (
                    select location_id 
                           from hr.locations 
                           where city='Seattle'
                )
                or department_name = 'Marketing'
       );

select * from hr.departments;


select * from hr.employees where salary in (
select max(salary) from hr.employees where salary < (
select max(salary) from hr.employees));


select * from hr.countries;

select * from hr.employees where department_id in (
select d.department_id 
        from hr.departments d
        inner join hr.locations l
        on d.location_id = l.location_id
        where l.city = 'Seattle');


select * from hr.employees where salary in (
select max(salary) from hr.employees where salary <(
select max(salary) from hr.employees where salary <(
select max(salary) from hr.employees where salary < (
select max(salary) from hr.employees))))
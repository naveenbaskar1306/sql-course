use organisation;

delete from emp where last_modified= '2027-01-01';

CREATE TABLE emp (
    emp_id INT ,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10 , 2 )
);

select * from emp;
drop table employees_audit;


CREATE TABLE employees_audit (
    emp_id INT,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10,2),
    deleted_at DATETIME
);

***********************************************************
***********************************************************;

DELIMITER $$

CREATE TRIGGER after_employee_delete
AFTER DELETE ON emp
FOR EACH ROW
BEGIN
    INSERT INTO employees_audit(emp_id, name, position, salary, deleted_at)
    VALUES (OLD.emp_id, OLD.name, OLD.position, OLD.salary, NOW());
END$$

DELIMITER ;

***********************************************************
***********************************************************;

Insert into EMP (emp_id, name, position, salary) values (101,'Asif','IT',11000);
Insert into EMP (emp_id, name, position, salary) values (103,'Mohamed Asif','IT',12000);
DELETE FROM emp WHERE EMP_ID in (100,101);
SELECT * FROM employees_audit;
select * from emp;

***********************************************************
***********************************************************;

DELIMITER $$

CREATE TRIGGER before_employee_insert
BEFORE INSERT ON emp
FOR EACH ROW
BEGIN
    IF NEW.salary < 10000 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Salary must be at least 10,000';
    END IF;
END$$

DELIMITER ;

***********************************************************
***********************************************************;



ALTER TABLE emp ADD COLUMN last_modified DATETIME;

select * from emp;

***********************************************************
***********************************************************;

DELIMITER $$

CREATE TRIGGER before_employee_update
BEFORE UPDATE ON emp
FOR EACH ROW
BEGIN
    SET NEW.last_modified = NOW();
END$$

DELIMITER ;


***********************************************************
***********************************************************;
UPDATE emp SET SALARY = 5000 WHERE EMP_ID=102 ;

select * from emp;
DROP TRIGGER IF EXISTS after_employee_update;

SHOW TRIGGERS;

SELECT * FROM Employees_Data;


create view Employees_Data as 

with CTE as (
select emp_id, name, position, salary,last_modified,
	   row_number() over (partition by emp_id order by last_modified desc) as latest_date
       from emp
       )
select  emp_id, name, position, salary from CTE where latest_date = 1;
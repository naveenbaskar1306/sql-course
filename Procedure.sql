use organisation;

DELIMITER $$

CREATE PROCEDURE procedure_name (parameters)
BEGIN
    -- SQL statements
END $$

DELIMITER ;

** DELIMITER $$ changes the delimiter temporarily so that semicolons (used inside the procedure) dont terminate the command.

** CREATE PROCEDURE defines a new stored procedure.

** Parameters can be optional and can be IN, OUT, or INOUT.
 
** After the procedure, DELIMITER ; restores the default delimiter.


DELIMITER $$

CREATE  PROCEDURE GetAllEmployees(emp_id int)
BEGIN
    SELECT * FROM employees  where employee_id = emp_id;
END $$

DELIMITER ;

drop procedure GetAllEmployees;

call GetAllEmployees(100);

****************************************************************************************************

DELIMITER $$

CREATE PROCEDURE GetEmployeesByDepartment(IN dept_id VARCHAR(255))
BEGIN
    SELECT * FROM employees WHERE department_id = dept_id;
END $$

DELIMITER ;

USE ORGANISATION;
drop procedure GetEmployeesByDepartment;
CALL GetEmployeesByDepartment('90');

**********************************************************

DELIMITER $$

CREATE PROCEDURE GetTotalSalaryByDepartment(IN dept_id VARCHAR(255), OUT total_salary DECIMAL(10,2))
BEGIN
    SELECT SUM(salary) INTO total_salary
    FROM employees
    WHERE department_id = dept_id;
END $$

DELIMITER ;

CALL GetTotalSalaryByDepartment('90', @total_salary);


SELECT @total_salary;

*******************************************************************************************************

DELIMITER $$

CREATE PROCEDURE UpdateEmployeeSalary(IN emp_id INT, IN new_salary DECIMAL(10,2))
BEGIN
    UPDATE employees SET salary = new_salary WHERE employee_id = emp_id;
    SELECT 'Salary Updated Successfully' AS status;
END $$

DELIMITER ;

select salary from employees where employee_id = 120;

CALL UpdateEmployeeSalary(1200, 50000);

************************************************************************************************************************


DELIMITER $$

CREATE PROCEDURE UpdateSalaryWithCheck(IN emp_id INT, IN new_salary DECIMAL(10,2))
BEGIN
    DECLARE employee_exists INT;
    
    -- Check if employee exists
    SELECT COUNT(*) INTO employee_exists FROM employees WHERE employee_id = emp_id;
    
    IF employee_exists = 0 THEN
        SELECT 'Employee not found' AS status;
    ELSE
        UPDATE employees SET salary = new_salary WHERE employee_id = emp_id;
        SELECT 'Salary updated' AS status;
    END IF;
END $$

DELIMITER ;

CALL UpdateSalaryWithCheck(1200, 4000);



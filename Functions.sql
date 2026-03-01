use organisation;

DELIMITER $$
CREATE FUNCTION get_annual_salary(monthly_salary DECIMAL(10,2))
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN monthly_salary * 12;
END$$
DELIMITER ;


SELECT employee_id, first_name, get_annual_salary(A) AS annual_salary
FROM employees where employee_id = 100;


select avg(salary) from employees;

DELIMITER $$
CREATE FUNCTION full_name(a VARCHAR(50), b VARCHAR(50))
RETURNS VARCHAR(120)
DETERMINISTIC
BEGIN
    RETURN CONCAT(a, ' ', b);
END$$
DELIMITER ;

s

SELECT department_id, full_name(department_id, 'ASIF') AS employee_name
FROM departments;
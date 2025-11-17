-- Stored Procedures


-- this is a simple example
create procedure large_salaries()
select * 
from employee_salary
where salary >= 50000;

call large_salaries();

-- usecase example pf dilimiter
Delimiter $$
create procedure large_salaries2()
BEGIN
	select * 
	from employee_salary
	where salary >= 50000;
	select * 
	from employee_salary
	where salary >= 70000;
END $$
DELIMITER ;
call large_salaries2()

Delimiter $$
create procedure large_salaries3(p_employee_id int)
BEGIN
	select salary 
	from employee_salary
	where employee_id = p_employee_id;
	
END $$
DELIMITER ;
call large_salaries3(1);

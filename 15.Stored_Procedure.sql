-- Stored Procedures


-- this is a simple example
create procedure large_salaries()
select * 
from employee_salary
where salary >= 50000;

call large_salaries();


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

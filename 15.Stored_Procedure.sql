-- Stored Procedures


-- this is a simple example
create procedure large_salaries()
select * 
from employee_salary
where salary >= 50000;

call large_salaries();


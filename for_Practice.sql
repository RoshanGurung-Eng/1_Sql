-- Practice
select salary, employee_id, first_name
from employee_salary
where salary <= 70000 and employee_id <5;

-- try to clean data
update employee_salary
set salary = 0
where salary is null;
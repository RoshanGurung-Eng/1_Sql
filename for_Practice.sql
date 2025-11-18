-- Practice
select salary, employee_id, first_name
from employee_salary
where salary <= 70000 and employee_id <5;

-- try to clean data but not able to
update employee_salary
set salary = 0
where salary is null;

-- get to know occupation and department_name
select occupation , department_name 
from employee_salary es  
join parks_departments pd
where es.dept_id = pd.department_id
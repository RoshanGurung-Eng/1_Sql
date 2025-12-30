SELECT * 
FROM parks_and_recreation.employee_demographics;

SELECT first_name, 
last_name,
birth_date,
age,
2 * (age + 10) + 2
FROM parks_and_recreation.employee_demographics;
# PEMDAS
select distinct first_name,gender
FROM parks_and_recreation.employee_demographics;

select * 
from parks_departments;

select department_name
from parks_departments;

select *
from employee_salary
where salary < 50000;
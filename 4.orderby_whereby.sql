-- groub by

select *
from employee_demographics;

select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender;

select occupation, salary
from employee_salary
group by occupation, salary
;

-- order by
select *
from employee_demographics
order by 5 ,4   #u can do this but it may give you headache sometime
;
select *
from employee_demographics
order by gender, age
;


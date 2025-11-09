select *
from employee_salary;

select *
from employee_salary
WHERE  salary <=50000;

select *
from employee_demographics
WHERE gender != "male" ;

select *
from employee_demographics
WHERE birth_date > '1985-01-01'
;

-- and OR NOT -- LOGICAL OPERATOR
select *
from employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = "male";

select *
from employee_demographics
WHERE (first_name='leslie' and age = 44) or age > 44;


-- like statement

select *
from employee_demographics
where first_name like "a%";

select *
from employee_demographics
where first_name like "a__%";

select *
from employee_demographics
where birth_date like "1989%";



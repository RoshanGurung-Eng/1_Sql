-- Case Statement

select first_name, last_name, age,
CASE 
	WHEN age <=30 then 'young'
    when age between 31 and 50 then 'Old'
    when age > 50 then "On Death's Door"
end as age_bracket
from employee_demographics;

-- PAY INCREASE, BONUS
-- 50000<5%
-- 50000>7%
-- FINANCE DEAPRTMENT = 10%


select first_name, last_name, salary, 
case 
	when salary < 50000 then salary + (salary * 5 / 100) 
	when salary > 50000 then salary + (salary * 7 / 100)
end as new_salary,
	case 
    when dept_id = 6 then salary * .10
	end as bonus
FROM employee_salary;

-- practice
select first_name, last_name, age,
CASE 
	WHEN age <=30 then 'young'
    when age between 31 and 50 then 'Old'
    when age > 50 then "On Death's Door"
end as age_bracket
from employee_demographics;

select first_name, last_name, salary, 
case 
	when salary < 50000 then salary + (salary * 5 / 100) 
	when salary > 50000 then salary + (salary * 7 / 100)
end as new_salary,
	case 
    when dept_id = 6 then salary * .10
	end as bonus
FROM employee_salary;






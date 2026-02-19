-- CTE

-- cte example 
with CTE_Example as 
(select gender, avg(salary) as avg_sal, max(salary) max_salary, min(salary) min_salary, count(salary) salary_count
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender
)
select avg(avg_sal) 
from CTE_Example
;

-- subquery example which is difficult to read
select avg(avg_sal)
from (select gender, avg(salary) as avg_sal, max(salary) max_salary, min(salary) min_salary, count(salary) salary_count
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender
) example_subquery;

-- you can create cte within a cte or multiple cte
with CTE_Example as 
(
select employee_id, gender,birth_date
from employee_demographics
where birth_date > "1985-01-01"
),
CTE_Example2 as
(
select employee_id, salary
from employee_salary
where salary > 50000
)
select *
from CTE_Example as e1
join CTE_Example2 as e2
	on e1.employee_id = e2.employee_id
;

-- CTE doesnot need alias we can change the name using parathesis but if use alias while having the name in parenthesis i t will overwrite the alias for eg:
with CTE_Example (Gender, Avg_sal, MAX_sal, MIN_sal, COUNT_sal) as 
(select gender, avg(salary) as avg_sal, max(salary) max_salary, min(salary) min_salary, count(salary) salary_count
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender
)
select * 
from CTE_Example
;

-- practise
with CTE_Example (Gender, Avg_sal, MAX_sal, MIN_sal, COUNT_sal) as 
(select gender, avg(salary) as avg_sal, max(salary) max_salary, min(salary) min_salary, count(salary) salary_count
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender
)
select * 
from CTE_Example
;
-- practise with multiple cte
with CTE_Example as 
(
select employee_id, gender,birth_date
from employee_demographics
where birth_date > "1985-01-01"
),
CTE_Example2 as
(
select employee_id, salary
from employee_salary
where salary > 50000
)
select *
from CTE_Example as e1
join CTE_Example2 as e2
	on e1.employee_id = e2.employee_id
;
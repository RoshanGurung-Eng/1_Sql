-- CTE
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
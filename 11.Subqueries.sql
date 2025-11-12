-- subqueries

select *
from employee_demographics
where employee_id in 
		(select employee_id
        from employee_salary
        where dept_id =1)
;

-- subquery in select statement
select first_name, salary,
	(SELECT avg(salary) 
    from employee_salary) as avg_salary
from employee_salary; 


-- subquery in from statement
select gender, avg(age), max(age),min(age), count(age)
from employee_demographics
group by gender;

-- I'm finding average of every age
select avg(avg_age), avg(max_age), avg(min_age), avg(count_age)
from 
(select gender, avg(age) as avg_age, max(age) as max_age, min(age) as min_age, count(age) as count_age
from employee_demographics
group by gender) as Agg_table

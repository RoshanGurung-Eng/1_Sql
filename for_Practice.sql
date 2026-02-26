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
where es.dept_id = pd.department_id;

-- Calculating Metrics with GROUP BY and Aggregates
select salary,  count(salary) totalSalary, max(salary) Maxsalary, sum(salary) Totalrevenue
from employee_salary
where salary > 50000
group by salary
order by Totalrevenue;

-- Ranking employee by Salary within their category
select employee_id, gender , age,
-- Calculate the rank of salary within each category
rank() over(
		partition by gender
        order by age desc
) as rankinCategory,

-- Calculate the difference from the average salary in the age
age - avg(age) over (partition by gender) as salaryvsAgeavg
from employee_demographics
order by gender, rankinCategory; 

-- Finding employee with Above-Average Salary (using CTE)
-- Step 1: Calculate the overall average salary for all employees/records
WITH OverallAverage AS (
    SELECT 
        AVG(salary) AS GlobalAvgSalary
    FROM 
        employee_salary
)
-- Step 2: Select the employee details whose salary is greater than the overall average
SELECT 
    e.employee_id,
    e.salary
FROM 
    employee_salary e, OverallAverage oa  
WHERE 
    e.salary > oa.GlobalAvgSalary;
    
-- joining every table
select *
from employee_demographics as ed
inner join
	employee_salary as es on ed.employee_id = es.employee_id
  ;  
-- cte practice:
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

-- details of employee
select count(*)
from employee_demographics;

update employee_salary
set salary = 0
where salary is null;

select *
from employee_salary;

select * 
from employee_demographics
where first_name ;

--  subquery example which is difficult to read
select avg(avg_sal)
from (select gender, avg(salary) as avg_sal, max(salary) max_salary, min(salary) min_salary, count(salary) salary_count
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by gender
) example_subquery;

-- union practice
select first_name,last_name, 'Old Man' as label 
from employee_demographics
where age >40 and gender = "Male"
union
select first_name,last_name, 'Old Lady' as label 
from employee_demographics
where age >40 and gender = "Female"
union
select first_name, last_name, 'Highly paid employee' as label
from employee_salary
where salary>70000
order by first_name, last_name;

-- union 
select first_name
from employee_demographics
union all
select first_name
from employee_salary;

-- where
select *
from employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = "male";

-- stored_procedure
create procedure large_salaries()
select * 
from employee_salary
where salary >= 50000;

call large_salaries();

-- use case of delimiter
Delimiter $$
create procedure large_salaries2()
BEGIN
	select * 
	from employee_salary
	where salary >= 50000;
	select * 
	from employee_salary
	where salary >= 70000;
END $$
DELIMITER ;
call large_salaries2()

Delimiter $$
create procedure large_salaries3(p_employee_id int)
BEGIN
	select salary 
	from employee_salary
	where employee_id = p_employee_id;
	
END $$
DELIMITER ;
call large_salaries3(1);

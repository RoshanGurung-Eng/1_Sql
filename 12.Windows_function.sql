-- windows function

-- this is the example of group by
select dem.first_name,dem.last_name,gender, avg(salary) as avg_salary
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id
group by dem.first_name,dem.last_name,gender;

-- this is the example of windows
select dem.first_name,dem.last_name,gender, avg(salary) over(partition by gender) 
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
-- rolling total used to sum everything from specific value
-- it can be used in finance
select dem.first_name,dem.last_name, gender, salary, sum(salary) over(partition by gender order by dem.employee_id) as rolling_total
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id;
    
-- row_number(), rank () and 
select dem.employee_id, dem.first_name, dem.last_name, gender, salary, 
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as rank_num,
dense_rank() over (partition by gender order by salary desc) as dense_num
from employee_demographics as dem
join employee_salary as sal
	on dem.employee_id = sal.employee_id;


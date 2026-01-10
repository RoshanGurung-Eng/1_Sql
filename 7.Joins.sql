-- Joins

select *
from employee_demographics;

select *
from employee_salary ;

select *
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
    ;
    
-- outer joins


select *
from employee_demographics as dem
left join employee_salary as sal
	on dem.employee_id = sal.employee_id
    ;

select*
from employee_demographics as dem
right join employee_salary as sal
	on dem.employee_id = sal.employee_id
    ;
    
-- self join
select emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as emp_name,
emp2.first_name as first_name_emp,
emp2.last_name as last_name_emp
from employee_salary as emp1
join employee_salary as emp2
	on emp1.employee_id +1 = emp2.employee_id;
    
-- joining multiple tables
select *
from employee_demographics as dem
inner join employee_salary as sal
	on dem.employee_id = sal.employee_id
left  join parks_departments as pd
	ON 	sal.dept_id = pd.department_id
;
    
select *
from parks_departments;

-- practising

select *
from employee_demographics as d
inner join employee_salary as s
	on d.employee_id = s.employee_id
    ;
    
select *
from employee_demographics as d
inner join employee_salary as s
	on d.employee_id = s.employee_id
left  join parks_departments as pd
	ON 	s.dept_id = pd.department_id
;

-- outer joins


select *
from employee_demographics as dem
left join employee_salary as sal
	on dem.employee_id = sal.employee_id
    ;

select*
from employee_demographics as dem
right join employee_salary as sal
	on dem.employee_id = sal.employee_id
    ;
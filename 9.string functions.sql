-- string function

select length ('BrockLesnar');

select first_name, length(first_name)
from employee_demographics
order by 2;

select length ('Jhon Cena');

-- 2.upper
select upper('hulalala');
select lower('LOWER');

select first_name, upper(first_name)
from employee_demographics;

select last_name, lower(last_name)
from employee_demographics;

-- 3.Trims, lefttrim and righttrin 
select rtrim('           sky            ');

-- 4. substring
select first_name, 
left(first_name, 4),
right(first_name, 4),
substring(first_name,3,2),
birth_date,
substring(birth_date,6,2)
from employee_demographics;

-- 5.replace
select first_name, replace(first_name,'a','z') as z

FROM employee_demographics;

-- 6. Locate
select locate('o','bobby');

select locate ('a','fdsfdna du bist aba');

select first_name, locate('an',first_name)
FROM employee_demographics;

select last_name, locate('b',last_name)
FROM employee_demographics;

-- 7. Concat
select first_name, last_name,
concat (first_name,"",last_name) as fullname
from employee_demographics;

-- practising
select first_name, locate('a',first_name)
FROM employee_demographics;

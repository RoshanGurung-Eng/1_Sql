-- TEMP/ Temporary table

create temporary table Details
( First_name varchar(50),
last_name varchar(50),
fav_actress_movie varchar(100)
);

insert into Details
values('Bob', 'Marley', 'OMega');

select * 
from Details;

-- this is how we gonna use in works:


create  temporary table table_over_60k
select *
from employee_salary
where salary >= 60000;

select *
from table_over_60k
;

-- practise 

create  temporary table table_over_50k
select *
from employee_salary
where salary >= 50000;

select *
from table_over_50k;

create temporary table Detail
( First_name varchar(50),
last_name varchar(50),
fav_actress_movie varchar(100)
);

insert into Detail
values('Boban', 'Marley', 'Obese');

select * 
from Detail;

-- Project1: Data Cleaning



-- 1. Remove duplicates
-- 2. Standardize the data
-- 3. NUll Values or blank values
-- 4. remove any coloumns


create table layoffs_staging
like layoffs;

select * 
from layoffs_staging;

insert layoffs_staging
select *
from layoffs;


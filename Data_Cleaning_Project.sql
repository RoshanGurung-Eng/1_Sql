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

with duplicate_cte as (
select *,
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, country, funds_raised ) as row_num
from layoffs_staging
)
select *
from duplicate_CTE 
WHERE row_num > 1;

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `total_laid_off` text,
  `date` text,
  `percentage_laid_off` text,
  `industry` text,
  `source` text,
  `stage` text,
  `funds_raised` int DEFAULT NULL,
  `country` text,
  `date_added` text,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * 
from layoffs_staging2
where row_num > 1;

insert into layoffs_staging2
select *,
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, country, funds_raised ) as row_num
from layoffs_staging;

delete
from layoffs_staging2
where row_num > 1;

select *
from layoffs_staging2; 


-- standirazing data 
-- finding issues and fixing them

select company, trim(company)
from layoffs_staging2;

update layoffs_staging2
set company = trim(company);

select *
from layoffs_staging2
where industry like 'Crypto%';

update layoffs_staging2
set industry = 'Crypto'
where industry like 'Crypto%';

select distinct country, trim(trailing '.' from country)
from layoffs_staging2
order by 1;

update layoffs_staging2
set country = trim(trailing '.' from country)
where country like 'United States%';

select `date` -- Capital M is different u should use m for date and use capital Y
from layoffs_staging2;

update layoffs_staging2
set `date` = str_to_date(`date`, '%m/%d/%Y') ;

alter table layoffs_staging2
modify column `date` DATE;

-- working with null and blank values

select * 
from layoffs_staging2;



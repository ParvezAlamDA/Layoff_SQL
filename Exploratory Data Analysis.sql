-- Importing the data that is related to layoffs that started after CORONA. The task is to do exploratory data analysys. The data is already cleaned in the previous project. 

select * from layoffs
where laid_off_perc = 1
order by funds desc;

    -- COmpany wise layoff
select 
    company,
    sum(laid_off)
from layoffs
group by company
order by sum(laid_off) desc;

    -- Date range 
select 
    min(dates),
    max(dates)
from layoffs;

    -- Industry wise layoff
select 
    industry,
    sum(laid_off) as total_laid_off
from layoffs
group by industry
order by 2 desc;

    -- Country wise layoff
select 
    Country,
    sum(laid_off) as total_laid_off
from layoffs
group by Country
order by 2 desc;

    -- Year wise layoff
select 
    extract(Year from Dates)as year,
    sum(laid_off) as total_laid_off
from layoffs
group by extract(Year from Dates)
order by 2 desc;    
    
    -- Month wise layoff
select 
    extract(Month from Dates)as Month,
    sum(laid_off) as total_laid_off
from layoffs
group by extract(Month from Dates)
order by 2 desc;   


    -- Stage wise layoff
select 
    Stage,
    sum(laid_off) as total_laid_off
from layoffs
group by Stage
order by 2 desc;


    -- Rolling Total Layoff


select 
    extract(month from dates) as month,
    sum(laid_off)
from layoffs
group by extract(month from dates);


SELECT 
    TO_CHAR(Dates, 'YYYY-MM') AS month_year,
    SUM(laid_off) AS total_laid_off
FROM 
    layoffs
GROUP BY 
    TO_CHAR(Dates, 'YYYY-MM')
ORDER BY 
    month_year;
    
with running_ttl as
(
SELECT 
    TO_CHAR(Dates, 'YYYY-MM') AS month_year,
    SUM(laid_off) AS total_laid_off
FROM 
    layoffs
GROUP BY 
    TO_CHAR(Dates, 'YYYY-MM')
ORDER BY 
    month_year
)
select 
    month_year,
    total_laid_off,
    sum(total_laid_off) over(order by month_year) as running_ttl
from running_ttl;
    
    
    

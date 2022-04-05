-- show me all the rows in sachin_scores's table
-- give me sachin_scores's scores country wise -- opponent wise


select versus,year(mtch_date) as yr, sum(runs) as runs
from sachin_scores
group by versus,year(mtch_date)
--having versus not in ('Pakistan','Australia', 'Sri Lanka')
order by 1,3 desc


select versus,
year(mtch_date) as yr, 
sum(runs) as runs
from sachin_scores
group by versus,year(mtch_date)
having year(mtch_date) > 2000
order by 1,2 desc


select versus,
year(mtch_date) as yr, 
sum(runs) as runs
from sachin_scores
group by versus,year(mtch_date)
having versus = 'Australia'
order by 1,3 desc
OFFSET 0 ROWS 
FETCH NEXT 3 ROWS ONLY;

select 
year(mtch_date) as yr, 
sum(runs) as runs
from sachin_scores
where versus = 'Australia'
group by year(mtch_date)
having year(mtch_date) > 2000
order by 2 desc
offset 0 ROWS
fetch first 3 rows only





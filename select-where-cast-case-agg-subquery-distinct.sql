-- show me all the rows in sachin_scores's table

select * from sachin_scores

-- give me those matches where sachin_scores has played against pakistan

select * from sachin_scores
where versus = 'pakistan'


-- give me all the matches which sachin_scores has played against pakistan 
-- and the matches took place between 1/1/1990 and 1/1/1995

select * from sachin_scores
where versus = 'Australia'
and runs >=100

-- give me the strike rate of sachin_scores across all matches

-- filter
-- more than one filters
-- where
-- and
-- additional column calculation -- calculated fields
-- cast
-- round
-- sub-query
-- max, min, sum, avg, count -- aggregate function
-- order by asc/desc -- asc is by default -- you need not specify explicitly
-- case when statement
-- case when within a case when > equivalent to if condition with an if condition
-- count(*)
-- distinct
-- count(distinct)
-- group by
-- in / not in
-- having 

select * 
from (
select *
,round(cast(runs as float)/balls,2)*100 as 'str_rate'
from sachin_scores
) as t1
order by str_rate desc


-- what is the total ODI runs of sachin_scores

select * from sachin_scores
where runs >=100

select sum(runs) as 'tot_runs'
from sachin_scores

select avg(runs) as 'max_runs'
from sachin_scores

-- what is the career average of sachin_scores 

select sum(isnotout)
--sum(runs)/cast(sum(isnotout) as float) as 'totinningsnotout'
from (
select *
,case when runs >=100 then 1 
else case when Match_Dismissal_Mode in ('did not bat','not out') then 0 else 1 end
end as 'isnotout'
from sachin_scores
) as t1


select count(*)
from sachin_scores
where runs >= 100
and versus = 'South Africa'

-- list out all the teams against which sachin_scores has scored a century

select count(distinct versus) as x
from sachin_scores
where runs >= 100

select distinct versus from sachin_scores





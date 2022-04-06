select *,
sum(salary) OVER (PARTITION BY DEPT_NAME) as 'dept_total_salaries_paid',
min(salary) OVER (PARTITION BY DEPT_NAME) as 'dept_min_salaries_paid',
max(salary) OVER (PARTITION BY DEPT_NAME) as 'dept_max_salaries_paid',
format(cast(salary as float)/(sum(salary) OVER (PARTITION BY DEPT_NAME)),'P') as 'perc_contribution',
sum(salary) OVER () as 'grand_total_salaries_paid',
format(cast(salary as float)/(sum(salary) OVER ()),'P') as 'perc_grand'
from new_emp



select *,
sum(salary) OVER (PARTITION BY DEPT_NAME) as 'dept_total_salaries_paid',
sum(salary) OVER () as 'overall_total_salaries_paid',
format(cast(SALARY as float)/(sum(salary) OVER (PARTITION BY DEPT_NAME)),'P') as 'perc_salary_of_dept',
format(cast(SALARY as float)/(sum(salary) OVER ()),'P') as 'perc_salary_over_all'
from new_emp



select * from sachin_scores

/* Some experiments. Feel free to ignore :)
select *,
lead(runs) over(order by mtch_date) as next_match,
case when 1000 between runs and (lead(runs) over(order by mtch_date)) then 1
     when 2000 between runs and (lead(runs) over(order by mtch_date)) then 2
     when 3000 between runs and (lead(runs) over(order by mtch_date)) then 3
     when 4000 between runs and (lead(runs) over(order by mtch_date)) then 4
     when 5000 between runs and (lead(runs) over(order by mtch_date)) then 5 end as marker
from sachin_scores

select * from (
select *,
case when 1000 between prev_total and cum_total then 1
     when 2000 between prev_total and cum_total then 1
     when 3000 between prev_total and cum_total then 1
     when 4000 between prev_total and cum_total then 1
     when 5000 between prev_total and cum_total then 1
     else 0 end as marker
 from (
select *,
lag(cum_total) over(order by mtch_date) as prev_total
from (
select *,
sum(runs) over(order by mtch_date) as cum_total
from sachin_scores
) as t
) as t1
) as t2
where marker = 1

This one was an interesting problem though!

**/

select avg(days_between_century) from (
select *,
lead(mtch_date) over(order by mtch_date) as next_match_date,
lag(mtch_date) over(order by mtch_date) as prev_match_date,
datediff(DAY,mtch_date,(lead(mtch_date) over(order by mtch_date))) days_between_century
 from (
    select * from sachin_scores
    where runs >= 100
) as t
) as t2


select *,
first_value(mtch_date) over(partition by versus order by mtch_date) as first_match_date,
last_value(mtch_date) over(partition by versus order by mtch_date RANGE 
		BETWEEN 
		UNBOUNDED PRECEDING 
		AND 
		UNBOUNDED FOLLOWING) as last_match_date
 from sachin_scores
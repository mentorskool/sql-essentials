-- filtering with OR/AND clauses
select * from sachin_scores
where (versus = 'Pakistan' or versus = 'Sri Lanka')
and venue = 'Sharjah Cricket Stadium')

-- easier filtering using the IN clause
select * from sachin_scores
where versus in ('Pakistan','Sri Lanka')
and venue = 'Sharjah Cricket Stadium'

-- filtering dates
select * from sachin_scores
where mtch_date between '1992-01-01' and '1992-12-31'

select * from sachin_scores
where mtch_date >= '1992-01-01' and 
mtch_date < '1993-01-01'

-- partial string search
select * from sachin_scores
where dismissal_mode like '%Wasim Akram%'

select * from sachin_scores
where dismissal_mode like '%b%Wasim Akram%'
-- drop table new_emp

-- create a new table as shown below
create table new_emp
( emp_ID int
, emp_NAME varchar(50)
, DEPT_NAME varchar(50)
, SALARY int);

-- add some data
insert into new_emp values(101, 'Mohan', 'Admin', 4000);
insert into new_emp values(102, 'Rajkumar', 'HR', 3000);
insert into new_emp values(103, 'Akbar', 'IT', 4000);
insert into new_emp values(104, 'Dorvin', 'Finance', 6500);
insert into new_emp values(105, 'Rohit', 'HR', 3000);
insert into new_emp values(106, 'Rajesh',  'Finance', 5000);
insert into new_emp values(107, 'Preet', 'HR', 7000);
insert into new_emp values(108, 'Maryam', 'Admin', 4000);
insert into new_emp values(109, 'Sanjay', 'IT', 6500);
insert into new_emp values(110, 'Vasudha', 'IT', 7000);
insert into new_emp values(111, 'Melinda', 'IT', 8000);
insert into new_emp values(112, 'Komal', 'IT', 10000);
insert into new_emp values(113, 'Gautham', 'Admin', 2000);
insert into new_emp values(114, 'Manisha', 'HR', 3000);
insert into new_emp values(115, 'Chandni', 'IT', 4500);
insert into new_emp values(116, 'Satya', 'Finance', 6500);
insert into new_emp values(117, 'Adarsh', 'HR', 3500);
insert into new_emp values(118, 'Tejaswi', 'Finance', 5500);
insert into new_emp values(119, 'Cory', 'HR', 8000);
insert into new_emp values(120, 'Monica', 'Admin', 5000);
insert into new_emp values(121, 'Rosalin', 'IT', 6000);
insert into new_emp values(122, 'Ibrahim', 'IT', 8000);
insert into new_emp values(123, 'Vikram', 'IT', 8000);
insert into new_emp values(124, 'Dheeraj', 'IT', 11000);
insert into new_emp values(113, 'Ravi','Admin',2000);


select * from new_emp


select *,
row_number() OVER (ORDER BY salary desc) as 'row_number',
        rank() OVER (ORDER BY salary desc) as 'rank',
        percent_rank() OVER (ORDER BY salary desc) as 'percent_rank',
        cume_dist() OVER (ORDER BY salary desc) as 'cume_dist'
from new_emp
order by dept_name



select *,
row_number() OVER (
            PARTITION BY dept_name
            ORDER BY salary desc) as 'row_number',
        rank() OVER (
            PARTITION BY dept_name
            ORDER BY salary desc) as 'rank',
        percent_rank() OVER (
            PARTITION BY dept_name
            ORDER BY salary desc) as 'percent_rank',
        cume_dist() OVER (
            PARTITION BY dept_name 
            ORDER BY salary desc) as 'cume_dist'
from new_emp
order by dept_name

select *,
row_number() OVER (PARTITION BY DEPT_NAME, SEGMENT
            ORDER BY salary desc) as 'row_number',
        rank() OVER (PARTITION BY DEPT_NAME            
            ORDER BY salary desc) as 'rank',
        dense_rank() OVER ( PARTITION BY DEPT_NAME           
            ORDER BY salary desc) as 'dense_rank',
        format(cume_dist() OVER (PARTITION BY DEPT_NAME             
            ORDER BY salary desc),'P') as 'cume_dist',
        ntile(4) OVER(PARTITION BY DEPT_NAME
            ORDER BY salary desc) as 'quartile'
from new_emp
--order by dept_name



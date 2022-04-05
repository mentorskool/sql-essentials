-- drop table amit_customers

create table amit_customers (
customer_id varchar(10),
customer_city varchar(100),
customer_state varchar(100),
segment varchar(50),
zip_code int,
phone_no varchar(20)
)

insert into amit_customers values ('DK-13375','Madras','Tamil Nadu','Consumer',55407,'+91-9446653722')
insert into amit_customers values ('EB-13705','Chennai','Tamil Nadu','Consumer',94109,'92211 53723')
insert into amit_customers values ('NF-18475','Bombay','Maharashtra','Consumer',94122,'098873321123')
insert into amit_customers values ('NF-18474','Mumbai','Maharashtra','Consumer',94124,'(080) 65432 12341')
insert into amit_customers values ('BW-11065','Ahmedabad','Gujarat','Home Office',85204,'+91-9443537211')
insert into amit_customers values ('KM-16720','Ahemdabad','    Gujarat','Consumer',68104,'')
insert into amit_customers values ('LE-16810','New Delhi','Delhi','Consumer',90008,'')
insert into amit_customers values ('NG-18355','New Delhi','Delhi','Consumer',97301,'')

select * from amit_customers

select left('DK-13375',2)

select customer_id,left(customer_id,2)
from amit_customers

select customer_id,right(customer_id,5)
from amit_customers

select customer_id,
customer_state,
trim(customer_state) as correct_state
from amit_customers

select customer_id,
phone_no,
replace(phone_no,' ','') as correct_phone_no
from amit_customers

select customer_id,
customer_city,
customer_state,
lower(customer_city) as new_city,
lower(customer_state) as new_state
from amit_customers

select customer_id,
charindex('-',customer_id) as position 
from amit_customers

select customer_id,
charindex('-',customer_id) as position 
from amit_customers


select customer_id,
substring(customer_id,charindex('-',customer_id)+1,5) as customer_number 
from amit_customers

select reverse(customer_city)
from amit_customers

select reverse(left(reverse(customer_id),5)) as customer_number 
from amit_customers

select customer_id,
reverse(left(reverse(customer_id),5))
from amit_customers

select coalesce(null,'Amit')
select coalesce(null,null,'Amit',null,'Rahul')


-- Create table for first vaccination takers
Create Table first_vacc_list 
(PersonID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50),
Vaccinated_date date,
Vaccinated_city varchar(50)
)

-- Add some data
Insert into first_vacc_list VALUES
(1001, 'Jim', 'Halpert', 30, 'Male','2020-04-05','New Orleans'),
(1002, 'Pam', 'Beasley', 30, 'Female','2020-05-01','San Diego'),
(1003, 'Dwight', 'Schrute', 29, 'Male','2020-04-12','Boston')

-- Create table for second vaccination takers
Create Table second_vacc_list 
(PersonID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50),
Vaccinated_date date,
Vaccinated_city varchar(50)
)

-- Add some data
Insert into second_vacc_list VALUES
(1002, 'Pam', 'Beasley', 30, 'Female','2020-05-01','San Diego'),
(1003, 'Dwight', 'Schrute', 29, 'Male','2020-04-12','Boston'),
(1004, 'Alan', 'Stewart', 25, 'Male','2020-04-15','Chicago')

-- Check for data
select * from first_vacc_list
select * from second_vacc_list


select f.PersonID, f.FirstName, s.PersonID,s.FirstName
from first_vacc_list f 
left join second_vacc_list s  
on f.PersonID = s.PersonID
where s.PersonID is null

select f.PersonID, f.FirstName, s.PersonID,s.FirstName
from first_vacc_list f 
join second_vacc_list s 
on f.PersonID = s.PersonID


select s.PersonID, s.FirstName, f.PersonID,f.FirstName
from first_vacc_list f 
right join second_vacc_list s  
on f.PersonID = s.PersonID
where f.PersonID is null

select f.PersonID, f.FirstName, s.PersonID,s.FirstName
from first_vacc_list f 
full join second_vacc_list s 
on f.PersonID = s.PersonID
--where f.PersonID is null


-- drop table EmployeeDemographics
Create Table EmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50),
ManagerID int
)

Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male',null),
(1002, 'Pam', 'Beasley', 30, 'Female',1001),
(1003, 'Dwight', 'Schrute', 29, 'Male',1001),
(1004, 'Angela', 'Martin', 31, 'Female',1002),
(1005, 'Toby', 'Flenderson', 32, 'Male',1002),
(1006, 'Michael', 'Scott', 35, 'Male',1002),
(1007, 'Meredith', 'Palmer', 32, 'Female',1003),
(1008, 'Stanley', 'Hudson', 38, 'Male',1003),
(1009, 'Kevin', 'Malone', 31, 'Male',1003)

select * from EmployeeDemographics

select ed1.FirstName, ed2.FirstName as 'ManagerName'
from EmployeeDemographics ed1 
left join EmployeeDemographics ed2 
on ed1.ManagerID = ed2.EmployeeID


select ed1.FirstName, ed2.FirstName as 'ManagerName'
from EmployeeDemographics ed1 
cross join EmployeeDemographics ed2 
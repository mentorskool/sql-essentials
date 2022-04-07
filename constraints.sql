-- drop table employee_records
select * from employee_records

-- plain table
create table employee_records (
EmployeeCode varchar(10) ,
LastName varchar(50),
FirstName varchar(50),
Age int ,
Gender varchar(10) ,
EmployeeType varchar(20) ,
City varchar(50),
State varchar(50)
)


-- table with primary key constraint
create table employee_records (
EmployeeCode varchar(10) primary key,
LastName varchar(50),
FirstName varchar(50),
Age int ,
Gender varchar(10) ,
EmployeeType varchar(20) ,
City varchar(50),
State varchar(50)
)


-- table with not null constraints
create table employee_records (
EmployeeCode varchar(10) primary key,
LastName varchar(50),
FirstName varchar(50),
Age int ,
Gender varchar(10) ,
EmployeeType varchar(20) not null,
City varchar(50),
State varchar(50)
)


-- table with default constraint added
create table employee_records (
EmployeeCode varchar(10) primary key,
LastName varchar(50),
FirstName varchar(50),
Age int 
Gender varchar(10) default 'Male',
EmployeeType varchar(20) not null,
City varchar(50),
State varchar(50)
)


-- table with check constraint added
create table employee_records (
EmployeeCode varchar(10) primary key,
LastName varchar(50),
FirstName varchar(50),
Age int check (Age >=18),
Gender varchar(10) default 'Male',
EmployeeType varchar(20) not null,
City varchar(50),
State varchar(50)
)


insert into employee_records values('CA-1001','Halpert','Jim',30,'Male','Permanent','Los Angeles','California')
insert into employee_records values(null,'Hugo','Louise',30,'Male','Contractual','Los Angeles','California')
insert into employee_records(EmployeeCode,LastName,FirstName,Age,EmployeeType,City,State) values('CA-1002','Beasley','Pam',31,'Contractual','San Francisco','California')
insert into employee_records values('NY-1003','Schrute','Dwight',15,'Male','Contractual','New York','New York')
insert into employee_records values('TX-1004','Martin','Angela',31,'Female','Contractual','Austin','Texas')
insert into employee_records values('TX-1004','Martin','Angela',31,'Female','Contractual','Austin','Texas')
insert into employee_records values('TX-1005','Scott','Michael',35,'Male','Permanent','Austin','Texas')
insert into employee_records values('TX-1006','Palmer','Meredith',32,'Female','','Austin','Texas')
insert into employee_records values('TX-1006','Ron','Sebastian','Thirty Six','','','','')
insert into employee_records values('MS-1001','Hudson','Stanley',38,'Male','Contractual','Boston','Massachusetts')
insert into employee_records values('MS-1001','Hudson','Stanley',38,'Male','Contractual','Boston','Massachusetts')



-- plain table
create table employee_scans (
ScanID int,
SignIn datetime,
SignOut datetime,
EmployeeCode varchar(10)
City varchar(50),
State varchar(50),
)

-- table with foreign key constraint added
create table employee_scans (
ScanID int primary key,
SignIn datetime,
SignOut datetime,
EmployeeCode varchar(10) FOREIGN KEY REFERENCES employee_records(EmployeeCode),
City varchar(50),
State varchar(50),
)



insert into employee_scans values(100001,'2021-03-28 08:53:38','2021-03-28 22:25:46','CA-1001','Los Angeles','California')
insert into employee_scans values(100002,'2021-03-23 09:58:18','2021-03-23 18:36:18','CA-1001','Los Angeles','California')
insert into employee_scans values(100003,'2021-03-22 09:56:32','2021-03-22 11:56:32','CA-1001','Los Angeles','California')
insert into employee_scans values(100003,'2021-03-29 09:11:22','2021-03-29 19:11:22','CA-1001','San Diego','California')
insert into employee_scans values(100004,'2021-03-29 09:13:25','2021-03-29 19:13:25','CA-1001','San Jose','California')
insert into employee_scans values(100005,'2021-03-29 09:16:00','2021-03-29 19:16:00','NY-1003','New York','New York')
insert into employee_scans values(100006,'2021-03-29 09:12:38','2021-03-29 19:12:38','NY-1003','New York','New York')
insert into employee_scans values(100007,'2021-03-29 09:15:04','2021-03-29 01:15:04','NY-1003','Austin','Texas')
insert into employee_scans values(100008,'2021-03-29 10:12:55','2021-03-29 23:12:55','TX-1004','Austin','Texas')
insert into employee_scans values(100009,'2021-03-29 08:12:55','2021-03-29 13:12:55','WS-1004','Seattle','Washington')

select * from employee_records

select * from employee_scans

-- drop table employee_records

-- drop table employee_scans
-- Create a brand new database
CREATE DATABASE Amit_TestDB

-- Create Schema 1
CREATE SCHEMA Amit_Schema_1;

-- Create Schema 2
CREATE SCHEMA Amit_Schema_2;


-- drop the newly created database
DROP DATABASE Amit_TestDB


-- List all existing databases in the system
SELECT name
FROM master.sys.databases

EXEC sp_databases;


-- Drop existing table
Drop table EmployeeDemographics

-- Let's create the EmployeeDemographics Table
Create Table EmployeeDemographics 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
--last_punch_in datetime,
--last_punch_out datetime,
--credit_score float
)

-- Add new columns in a table
ALTER TABLE EmployeeDemographics 
ADD last_punch_in datetime;

ALTER TABLE EmployeeDemographics 
ADD last_punch_out datetime;

-- Change data type of existing columns
ALTER TABLE EmployeeDemographics ALTER COLUMN last_punch_in date;

ALTER TABLE EmployeeDemographics ALTER COLUMN last_punch_out date;

-- Get rid of a column
ALTER TABLE EmployeeDemographics
DROP COLUMN last_punch_in;

ALTER TABLE EmployeeDemographics
DROP COLUMN last_punch_out;


--Let's create EmployeeSalary Table
Create Table EmployeeSalary 
(EmployeeID int, 
JobTitle varchar(50), 
Salary int
)

-- Check for data
SELECT * FROM EmployeeDemographics

-- Check for data
SELECT * FROM EmployeeSalary

-- Remove records from a table
delete from EmployeeDemographics

-- Single record insert with full column names
Insert into EmployeeDemographics(EmployeeID,FirstName,LastName,Age,Gender) VALUES
(1006, 'Michael', 'Scott','30 Years','Male')

-- Multi-record insert
Insert into EmployeeDemographics VALUES
(1001, 'Jim', 'Halpert', 30, 'Male'),
(1002, 'Pam', 'Beasley', 30, 'Female'),
(1003, 'Dwight', 'Schrute', 29, 'Male'),
(1004, 'Angela', 'Martin', 31, 'Female'),
(1005, 'Toby', 'Flenderson', 32, 'Male'),
(1006, 'Michael', 'Scott', 35, 'Male'),
(1007, 'Meredith', 'Palmer', 32, 'Female'),
(1008, 'Stanley', 'Hudson', 38, 'Male'),
(1009, 'Kevin', 'Malone', 31, 'Male')

-- Multi-record insert
Insert Into EmployeeSalary VALUES
(1001, 'Salesman', 45000),
(1002, 'Receptionist', 36000),
(1003, 'Salesman', 63000),
(1004, 'Accountant', 47000),
(1005, 'HR', 50000),
(1006, 'Regional Manager', 65000),
(1007, 'Supplier Relations', 41000),
(1008, 'Salesman', 48000),
(1009, 'Accountant', 42000)


-- Insert script generated using Excel
Insert Into EmployeeSalary VALUES
(1001,'Jim','Halpert',30,'Male')
Insert Into EmployeeSalary VALUES
(1002,'Pam','Beasley',30,'Female')
Insert Into EmployeeSalary VALUES
(1003,'Dwight','Schrute',29,'Male')
Insert Into EmployeeSalary VALUES
(1004,'Angela','Martin',31,'Female')
Insert Into EmployeeSalary VALUES
(1005,'Toby','Flenderson',32,'Male')
Insert Into EmployeeSalary VALUES
(1006,'Michael','Scott',35,'Male')
Insert Into EmployeeSalary VALUES
(1007,'Meredith','Palmer',32,'Female')
Insert Into EmployeeSalary VALUES
(1008,'Stanley','Hudson',38,'Male')
Insert Into EmployeeSalary VALUES
(1009,'Kevin','Malone',31,'Male')


-- Inserting data into new table from an existing table using Select clause
INSERT INTO EmployeeTest (EmployeeID,JobTitle,Salary) 
SELECT
    EmployeeID,
    JobTitle,
    Salary
FROM
   EmployeeSalary
-- How to perform bulk insert into the database from local?

Create Table amit_temp 
(EmployeeID int, 
FirstName varchar(50), 
LastName varchar(50), 
Age int, 
Gender varchar(50)
)


BULK INSERT amit_temp
FROM 'G:\My Drive\Business\fractal\project-information-architect-2022\program-preparation\sql\prep-material\data\amit_temp.csv'
WITH (
    FORMAT = 'CSV',
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR='\n',
    BATCHSIZE=250000,
    MAXERRORS=2
    );

--select * from amit_temp
--delete from amit_temp

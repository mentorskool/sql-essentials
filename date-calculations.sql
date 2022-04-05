-- select * from employee_scans

-- drop table employee_scans

create table employee_scans (
ScanID int,
SignIn datetime,
SignOut datetime,
EmployeeCode varchar(10),
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


-- Look at different time functions
select CURRENT_TIMESTAMP 
select GETDATE()
select GETUTCDATE()
select SYSUTCDATETIME()
select CAST(GETDATE() AS DATE)
select DATEFROMPARTS(2022,3,12)

SELECT ScanID,
SignIn,
SignOut,
ISDATE(CAST(SignIn AS NVARCHAR)) 'IsDate',
DATEPART(year,SignIn) AS YEAR ,
DATEPART(quarter,SignIn) AS QUARTER, 
DATEPART(month,SignIn) AS MONTH,
DATENAME(month,SignIn) AS MONTH_NAME,
DATEPART(dayofyear,SignIn) AS DAYOFYEAR,
DATEPART(day,SignIn) AS DAY,
DATEPART(week,SignIn) AS WEEK,
DATEPART(weekday,SignIn) AS 'WEEKDAY',
DATENAME(weekday,SignIn) AS 'WEEKDAYNAME',
DAY(SignIn) AS day ,
MONTH(SignIn) AS month ,
YEAR(SignIn) AS year,
LEFT(DATENAME(month,SignIn),3)+'-'+DATENAME(YEAR,SignIn) AS 'Month_Year',
DATEPART(YEAR,SignIn)*100+DATEPART(month,SignIn) as 'Month_Year_2'
FROM employee_scans;

SELECT
DATEDIFF(DAY,'2022-04-01',GETDATE()) AS days_passed ,
DATEDIFF(quarter,'2021-04-01',GETDATE()) AS quarters_passed_1,
DATEDIFF(quarter,'2022-01-01',GETDATE()) AS quarters_passed_2,
DATEDIFF(month,'2021-12-31',GETDATE()) AS months_passed_1,
DATEDIFF(month,'2022-01-01',GETDATE()) AS months_passed_2,
DATEDIFF(month,'2022-04-04',GETDATE()) AS months_passed_3,
DATEDIFF(month,'2022-04-04',GETDATE()) AS MONTH,
DATEDIFF(day,'2022-04-04',GETDATE()) AS DAY,
DATEDIFF(week,'2022-04-01',GETDATE()) AS WEEK


select scanid,
signin,
signout,
datediff(hour,signin,signout) as hours_stayed_at_office
from employee_scans


SELECT
DATEADD(DAY,1,GETDATE()) AS ADDDAY,
DATEADD(QUARTER,1,GETDATE()) AS ADDQUARTER_1,
DATEADD(QUARTER,2,GETDATE()) AS ADDQUARTER_2,
DATEADD(month,-6,GETDATE()) AS ADDMONTH_1,
DATEADD(month,13,GETDATE()) AS ADDMONTH_13,
DATEADD(YEAR,1,GETDATE()) AS ADDYR,
DATEADD(WEEK,1,GETDATE()) AS ADDWEEK,
DATEADD(HOUR,25,GETDATE()) AS ADDHOUR_,
DATEADD(MINUTE,60,GETDATE()) AS ADDMIN,
DATEADD(SECOND,20,GETDATE()) AS ADDSEC



/* CONVERT() function to convert datetime to string*/
/*To convert a datetime to a string, you use the CONVERT() function as follows:

         CONVERT(VARCHAR, datetime [,style])

VARCHAR :: the first argument that represents the string type.

datetime :: an expression that evaluates to date or datetime value that you want to convert to a string

sytle :: specifies the format of the date. The value of style is a number predefined by SQL Server. The style parameter is optional.*/

/*
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
Without century (yy)|   With century (yyyy)  |     Standard                   |     Format
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   –           |     0 or 100    |  Default for datetime and smalldatetime |  mon dd yyyy hh:miAM (or PM)
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   1           |     101            |  U.S.                          |  1 = mm/dd/yy
               |                 |                                |  101 = mm/dd/yyyy
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   2           |     102            |  ANSI                          |  2 = yy.mm.dd
               |                 |                                |  102 = yyyy.mm.dd
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   3           |     103            |  British/French                   |  3 = dd/mm/yy
               |                 |                                |  103 = dd/mm/yyyy
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   4           |     104            |  German                           |  4 = dd.mm.yy
               |                 |                                |  104 = dd.mm.yyyy
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   5           |     105            |  Italian                          |  5 = dd-mm-yy
               |                 |                                |  105 = dd-mm-yyyy
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   6           |     106            |     –                          |  6 = dd mon yy
               |                 |                                |  106 = dd mon yyyy
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   7           |     107            |     –                          |  7 = Mon dd, yy
               |                 |                                |  107 = Mon dd, yyyy
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   8           |     108            |        –                       |  hh:mi:ss
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   –           |     9 or 109    |  Default + milliseconds              |  mon dd yyyy 
               |                 |                                |  hh:mi:ss:mmmAM (or PM)
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   10          |     110            |  USA                              |  10 = mm-dd-yy
               |                 |                                |  110 = mm-dd-yyyy
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   11          |     111            |  JAPAN                         |  11 = yy/mm/dd
               |                 |                                |  111 = yyyy/mm/dd
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   12          |     112            |  ISO                              |  12 = yymmdd
               |                 |                                |  112 = yyyymmdd
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   –           |     13 or 113      |  Europe default + milliseconds       |  dd mon yyyy 
               |                 |                                |  hh:mi:ss:mmm(24h)
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   14          |     114            |  –                             |  hh:mi:ss:mmm(24h)
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   –           |     20 or 120      |  ODBC canonical                   |  yyyy-mm-dd 
               |                 |                                |  hh:mi:ss(24h)
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   –           |     21 or 121      |  ODBC canonical (with milliseconds)     |  yyyy-mm-dd 
               |                 |  default for time, date, datetime2,     |  hh:mi:ss.mmm(24h)
               |                 |  and datetimeoffset                  |
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   –           |     126            |  ISO8601                          |  yyyy-mm-ddThh:mi:ss.mmm (no spaces)
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   –           |     127            |  ISO8601 with time zone Z.           |  yyyy-mm-ddThh:mi:ss.mmmZ (no spaces)
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   –           |     130            |  Hijri                         |  dd mon yyyy 
               |                 |                                |  hh:mi:ss:mmmAM
+-------------------+-----------------------+-------------------------------------------+-------------------------------+
   –           |     131            |  Hijri                         |  dd/mm/yyyy 
+-------------------+-----------------------+-------------------------------------------+-------------------------------+                                                                 |  hh:mi:ss:mmmAM
*/

DECLARE @dt DATETIME = '2019-12-31 14:43:35.863';

SELECT 
   --Default for datetime and smalldatetime
    --CONVERT(VARCHAR(20),@dt,0) code_0,
    CONVERT(VARCHAR(20),@dt,100) code_100,
   --Convert datetime to string in mm/dd/yy and mm/dd/yyyy formats
    --CONVERT(VARCHAR(20),@dt,1) code_1,
    CONVERT(VARCHAR(20),@dt,101) code_101,
   --Convert datetime to string in mon dd yyyy hh:miAM (or PM) format
    --CONVERT(VARCHAR(20),@dt,2) code_3,
    CONVERT(VARCHAR(20),@dt,102) code_102,
   --Convert datetime to string in dd.mm.yy and dd.mm.yyyy
    --CONVERT(VARCHAR(20),@dt,3) code_4,
    CONVERT(VARCHAR(20),@dt,103) code_103,
    CONVERT(VARCHAR(20),@dt,104) code_104
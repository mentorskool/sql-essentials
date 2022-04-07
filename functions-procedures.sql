-- Write a function to retrieve total runs made by Sachin till date for a supplied date

CREATE FUNCTION RunsTillDate (@Versus as varchar(100),@TodayDate as DATE)
RETURNS INT
AS
BEGIN
	RETURN (
	SELECT SUM(runs) 
	FROM amit_sachin_scores 
	WHERE mtch_date <= @TodayDate
    and versus = @Versus)
END

-- usage of function

--SELECT dbo.RunsTillDate('Pakistan','2001-01-01') as total_run_till_date


-- create a blank summary table

CREATE TABLE [dbo].[sachin_scores_summary](
	[versus] [varchar](100) NULL,
	[Total_run] [int] NULL,
	[TOTAL_CENTURIES] [int] NULL,
	[TOTAL__HALF_CENTURIES] [int] NULL,
	[Total_strike_rate] [float] NULL,
	[career_Avg] [float] NULL
) 


-- create procedure to populate the summary table with a procedure

alter PROCEDURE Sachin_summary AS

/*
CREATE TABLE sachin_scores_summary(
versus varchar (100),
Total_run int,
TOTAL_CENTURIES int,
TOTAL__HALF_CENTURIES int,
Total_strike_rate float,
career_Avg float
)*/
--DROP TABLE #temp_versus
CREATE TABLE #temp_versus
(
   Id INT IDENTITY(1,1) PRIMARY KEY,
   versus VARCHAR(50)
)
INSERT INTO #temp_versus
SELECT DISTINCT versus FROM amit_sachin_scores

BEGIN
	DECLARE @id int = 1;
    DECLARE @versus varchar(50);
	WHILE @id <=(SELECT COUNT(*) FROM #temp_versus)
	BEGIN
    select @versus = versus from #temp_versus where id = @id
	INSERT INTO sachin_scores_summary
		SELECT 
            @versus,
			SUM(runs) AS Total_run ,
			SUM(CASE WHEN runs>=100 THEN 1 ELSE 0 END) AS TOTAL_CENTURIES,
			SUM(CASE WHEN runs BETWEEN 50 AND 99 THEN 1 ELSE 0 END) AS TOTAL_HALF_CENTURIES,
			CASE WHEN SUM(balls) = 0 THEN NULL ELSE CAST(SUM(runs) AS FLOAT)/SUM(balls) END AS career_strike_rate,
			CASE WHEN SUM(CASE WHEN dismissal_mode IN ('not out', ' did not bat')THEN 0 ELSE 1 END)=0 THEN NULL 
			ELSE round(cast(SUM(runs) as float)/SUM(CASE WHEN dismissal_mode IN ('not out', ' did not bat')THEN 0 ELSE 1 END),2) END AS career_Avg
			FROM amit_sachin_scores
			WHERE versus=@versus
			
		SET @id=@id+1
	END
	SELECT * FROM sachin_scores_summary
END

EXEC Sachin_summary 
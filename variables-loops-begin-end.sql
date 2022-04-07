DECLARE @match_year int;
SET @match_year = 1996;
SELECT
    *
FROM 
    amit_sachin_scores
WHERE 
    year(mtch_date) = @match_year
ORDER BY
    versus;

DECLARE @mtch_count as int
SET @mtch_count = (
    SELECT 
        COUNT(*) 
    FROM 
        amit_sachin_scores 
);
print @mtch_count

begin
    declare @versus varchar(100)
    declare @venue varchar(100)
    SELECT 
        @versus = versus,
        @venue = venue
    FROM amit_sachin_scores
    WHERE
    mtch_date = '1990-03-06';
    print 'The venue was ' + @venue
    print 'The oponent was ' + @versus
end


-- Looping using variables
BEGIN
    DECLARE @Counter int

    SET @Counter=0

    WHILE @Counter<10
        BEGIN
            PRINT 'Current Value is : ' + cast(@Counter as varchar)
            SET @Counter=@Counter+1
	    END
end
/* USING WHILE LOOP WITHOUT CURSOR*/

select * from EmployeeDemographics
select * from EmployeeSalary

BEGIN
	DECLARE @name varchar(80);
	DECLARE @sal numeric(8,2);
	DECLARE @grade varchar(80);
	DECLARE @id int = 1001;

	WHILE @id <=1009
	BEGIN
		SELECT @name =Firstname , @sal = Salary
		FROM EmployeeDemographics as ed
		JOIN EmployeeSalary as es
		ON ed.EmployeeId=es.EmployeeId
		WHERE ed.EmployeeId=@id
		IF @sal>60000
		BEGIN
			SET @grade='A'
		END
		ELSE IF @sal>45000
		BEGIN
			SET @grade='B'
		END
		ELSE 
		BEGIN
			SET @grade='C'
		END
		PRINT @name + ' is in grade '+@grade
		SET @id=@id+1
	END
END


/* USING WHILE LOOP WITH CURSOR
CURSORS ARE NO LONGER USED DUE TO THEIR POOR PERFORMANCE. THIS IS JUST FYI
*/

BEGIN
	DECLARE @name varchar(80);
	DECLARE @sal numeric(8,2);
	DECLARE @grade varchar(80);
	DECLARE @id int = 1001;

	DECLARE empCursor CURSOR FOR 
	SELECT ed. FirstName,ed.EmployeeID, es.Salary
	FROM EmployeeDemographics ed
	JOIN EmployeeSalary es
	ON ed.EmployeeId=es.EmployeeId

	OPEN empCursor

	FETCH NEXT FROM  empCursor INTO @name,@id,@sal
	WHILE @@FETCH_STATUS=0
	BEGIN
		SELECT @name =Firstname , @sal = Salary
		FROM EmployeeDemographics as ed
		JOIN EmployeeSalary as es
		ON ed.EmployeeId=es.EmployeeId
		WHERE ed.EmployeeId=@id
		IF @sal>60000
		BEGIN
			SET @grade='A'
		END
		ELSE IF @sal>45000
		BEGIN
			SET @grade='B'
		END
		ELSE 
		BEGIN
			SET @grade='C'
		END
		PRINT @name + ' is in grade '+@grade

		FETCH NEXT FROM  empCursor INTO @name,@id,@sal
	END
END

CLOSE empCursor
DEALLOCATE empCursor

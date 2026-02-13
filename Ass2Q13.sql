CREATE FUNCTION dbo.GetWorkingDaysSimple
(
    @StartDate DATE,
    @EndDate DATE
)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT = 0;
    WHILE @StartDate <= @EndDate
    BEGIN
        IF DATEPART(WEEKDAY, @StartDate) NOT IN (1, 7)
        BEGIN
            SET @Count = @Count + 1;
        END
        SET @StartDate = DATEADD(DAY, 1, @StartDate);
    END
	RETURN @Count;
END;
GO



SELECT dbo.GetWorkingDaysSimple('2023-10-01', '2023-10-10');
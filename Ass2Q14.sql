CREATE FUNCTION dbo.CalculateSimpleInterest
(
    @Principal DECIMAL(18, 2), 
    @Rate DECIMAL(5, 2),     
    @TimeInYears DECIMAL(5, 2) 
)
RETURNS DECIMAL(18, 2)
AS
BEGIN
    DECLARE @Interest DECIMAL(18, 2);
    SET @Interest = (@Principal * @Rate * @TimeInYears) / 100;

    RETURN @Interest;
END;
GO

SELECT dbo.CalculateSimpleInterest(50000, 8.5, 2);
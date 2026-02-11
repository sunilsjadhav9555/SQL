CREATE PROCEDURE sp_UpdateEmployeeSalaries
    @PercentageChange DECIMAL(5, 2)
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;
            UPDATE Employees
            SET Salary = Salary + (Salary * (@PercentageChange / 100));
            DECLARE @RowsAffected INT = @@ROWCOUNT;
        COMMIT TRANSACTION;
        PRINT CAST(@RowsAffected AS VARCHAR) + ' employee salaries were updated.';
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
        ROLLBACK TRANSACTION;
        PRINT 'Error occurred: ' + ERROR_MESSAGE();
    END CATCH
END;
GO
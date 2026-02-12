CREATE PROCEDURE sp_TruncateTable
    @TableName NVARCHAR(128)
AS
BEGIN
    IF OBJECT_ID(@TableName, 'U') IS NOT NULL
    BEGIN
        DECLARE @SQL NVARCHAR(MAX);
        SET @SQL = 'TRUNCATE TABLE ' + QUOTENAME(@TableName);
        EXEC sp_executesql @SQL; 
        PRINT 'Table ' + @TableName + ' has been truncated.';
    END
    ELSE
    BEGIN
        PRINT 'Error: Table ' + @TableName + ' does not exist.';
    END
END;
GO


EXEC sp_TruncateTable @TableName = 'MyTestTable';
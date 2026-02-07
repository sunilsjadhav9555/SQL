
SELECT 
    log_date,
    CASE 
        WHEN DATEDIFF(day, LAG(log_date) OVER (ORDER BY log_date), log_date) > 1 THEN 1 
        ELSE 0 
    END AS IsMissingPreviousLog
FROM 
    TransactionLogDates;
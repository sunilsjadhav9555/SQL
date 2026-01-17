SELECT 
    T.Name,
    T.Target,
    ISNULL(SUM(S.Sale), 0) AS Total_Sale,
    T.Target - ISNULL(SUM(S.Sale), 0) AS Remaining_Target
FROM 
    SalesmanTarget T
LEFT JOIN 
    SalesmanSale S ON T.Name = S.Name
GROUP BY 
    T.Name, T.Target;

	select * from salesmansale

	select * from salesmantarget
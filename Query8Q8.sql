MERGE INTO CustomerInfoOld AS Target
USING CustomerInfoNew AS Source
ON Target.CUST_ID = Source.CUST_ID


WHEN MATCHED THEN
    UPDATE SET Target.CUST_CITY = Source.CUST_CITY


WHEN NOT MATCHED BY TARGET THEN
    INSERT (CUST_ID, CUST_CITY)
    VALUES (Source.CUST_ID, Source.CUST_CITY);


select * from CustomerInfoOld;

select * from CustomerInfoNew;
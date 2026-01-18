SELECT SUM(Amount) AS Sum_Pos_Values
FROM BankTransationDetails
WHERE Amount > 0;

SELECT SUM(Amount) AS Sum_Neg_Values
FROM BankTransationDetails
WHERE Amount < 0;
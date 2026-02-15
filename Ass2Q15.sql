  /*
  To improve the performance of a SQL query taking over 30 minutes,
I would first diagnose the root cause by generating the Execution Plan. 
This visualizes how the database engine is retrieving data, allowing me to spot inefficiencies 
like Table Scans (reading every row) or missing indexes. I would then check for blocking or wait 
statistics to see if the query is stuck waiting for resources like locks or disk I/O. Based on
these findings, I would optimize the query by creating necessary indexes (especially on columns
used in WHERE and JOIN clauses), rewriting the SQL to be "SARGable" (e.g., removing functions on 
indexed columns), and ensuring statistics are up to date. Finally, I would verify the fix by re-running 
the execution plan to confirm the improved performance

*/
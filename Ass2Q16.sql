/*
An index is like the index at the back of a textbook. 
Without it, you'd have to scan every single page to find a 
topic (a slow "Table Scan"), but with it, you can jump directly to the right page (a fast "Index Seek"). 
By creating a sorted structure of your data—usually 
a B-Tree—indexes allow the database engine to find specific rows instantly without reading the entire table.
This dramatically speeds up SELECT queries, especially those with WHERE, JOIN, 
or ORDER BY clauses, though it comes with a small trade-off: writes (INSERT, UPDATE, DELETE) 
become slightly slower because the index must be updated every time the data changes.

In simple terms, a Clustered Index is like a phone book: 
the data itself (the person's name and number) is physically sorted in that order on the disk. 
Because the data can only be sorted one way, you can have only one clustered index per table.
A Non-Clustered Index, on the other hand, is like the index at the back of a textbook:
it’s a separate list that points to where the actual data is located.
You can have many of these (usually up to 999), and they are great for speeding up searches on columns other than the primary key,
like looking up a customer by their email address instead of their ID.

The primary disadvantage of over-indexing is the significant degradation of
DML (Data Manipulation Language) performance; every INSERT, UPDATE, or DELETE incurs write amplification because 
the engine must synchronously maintain the table and every corresponding index structure, 
leading to increased I/O latency and locking contention. Additionally, excessive indexes consume
valuable disk space and buffer pool memory—potentially evicting "hot" data from the cache—while imposing 
a higher maintenance burden regarding fragmentation and statistics updates. Finally, a bloated index strategy
can negatively impact the Query Optimizer, increasing compilation times as the engine attempts to evaluate an 
excessive number of potential access paths for each query

*/
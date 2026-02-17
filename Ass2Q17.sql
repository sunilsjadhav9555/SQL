/*

From an architectural perspective, a View serves as an abstraction layer over the physical schema,
decoupling the database structure from the application logic. 
This promotes encapsulation, allowing DBAs to refactor underlying tables without breaking downstream dependencies.
Furthermore, Views are a critical instrument for implementing granular security policies, 
granting users access to specific subsets of data (vertical or horizontal partitioning) without exposing the base tables, 
effectively adhering to the Principle of Least Privilege.

In an enterprise environment, a Table serves as the fundamental unit of physical data persistence, 
adhering to normalization principles (typically 3NF) to minimize redundancy and ensure referential integrity.
Conversely, a View functions as a logical abstraction layer or "stored query" that encapsulates complex joins,
aggregations, and business logic without duplicating data storage.
While tables are optimized for transactional throughput (OLTP) via clustered indexing, views are primarily leveraged for
security—by implementing row-level or column-level restrictions—and for simplifying the interface for downstream reporting tools (OLAP) 
or application layers, effectively decoupling the physical schema from the logical presentation

In an enterprise context, the critical differentiator is updatability via DML.
A Simple View acts as a direct window to a single base table, preserving the 1:1 row mapping and 
thus permitting standard INSERT, UPDATE, and DELETE operations without triggers. A Complex View, conversely,
abstracts multiple base tables via JOINs or aggregates (like GROUP BY or DISTINCT), 
breaking the direct lineage to the physical data; consequently, it is read-only by default and requires
INSTEAD OF triggers to handle any data modification logic

The primary limitations of Views in SQL Server revolve around
performance overhead and DML restrictions. Because standard views are virtual and do not materialize data,
complex aggregations or joins are re-executed at runtime, potentially causing latency unless indexed (materialized).
Furthermore, updates are restricted; views involving GROUP BY, DISTINCT,
or multiple base tables are generally read-only without the implementation of INSTEAD OF triggers. 
Finally, without SCHEMABINDING, views are susceptible to breaking changes in the underlying schema, 
creating fragile dependencies in production environments.

 Core difference lies in materialization: a standard view is a virtual abstraction that executes its underlying query at runtime,
 whereas an Indexed View (often called a Materialized View in other RDBMS platforms) persists the result set to disk, 
 maintained via a clustered index. This transformation shifts the performance cost from query 
 execution (CPU/Memory intensive for complex joins/aggregates) to data modification (I/O intensive), 
 as every DML operation on the base tables must synchronously update the view's physical index. Consequently, 
 Indexed Views are strategically deployed for high-read, low-write scenarios—such as data
 warehousing or complex reporting dashboards—where the overhead of maintaining the index is justified by 
 the elimination of repetitive, expensive query computations.



*/
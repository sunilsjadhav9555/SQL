

/*

Sequence is a critical, independent database object used to generate unique numeric keys
(often Primary Keys) efficiently, decoupling ID generation from specific table schemas and 
enabling high-concurrency inserts through caching. In contrast, a Synonym serves as an 
abstraction layer or alias for another database object, providing location transparency and 
simplifying queries by decoupling the application code from the underlying physical schema 
(e.g., allowing a table to move servers without breaking dependent stored procedures).
While sequences focus on data generation, synonyms focus on object referencing and schema management.

*/
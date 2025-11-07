Indexing Techniques Overview
 Introduction
Indexing improves data retrieval speed by creating a lookup structure separate from the actual data. It reduces disk I/O and accelerates query execution.

 B+ Trees
- **Search**: Traverse from root to leaf using key comparisons.
- **Insert**: Add key in sorted order; split node if overflow.
- **Delete**: Remove key; merge or redistribute if underflow.
- Used in most RDBMS for range queries and dynamic updates.

 Hash-Based Indexing
- Uses a hash function to map keys to buckets.
- Fast for exact-match queries but poor for range queries.

 File Organization
- **Heap**: Unordered records; slow search.
- **Sequential**: Sorted records; good for range queries.
- **Clustered**: Data stored in same order as index.
- **Indexed**: Separate index structure for fast access.

 Index Types
- **Primary Index**: On primary key; unique and clustered.
- **Secondary Index**: On non-key attributes; non-clustered.
- **Clustered Index**: Sorts actual data rows.
- **Non-clustered Index**: Separate structure pointing to data.

 Database Tuning & Optimization
 Performance Tuning
- Analyze slow queries using `EXPLAIN`.
- Add indexes on frequently searched columns.
- Avoid SELECT *; use only needed columns.

 Query Optimization Algorithms
- **Heuristic-based**: Reorder joins, push selections.
- **Cost-based**: Estimate cost of query plans.

 Backup & Recovery
- **Backup**: Periodic data dumps or snapshots.
- **Recovery**: Use logs or restore points to recover lost data.


Practice: Index Operations in SQL

 Create Primary and Secondary Index

-- Primary index (automatically created on primary key)
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Major VARCHAR(50)
);

-- Secondary index on Major
CREATE INDEX idx_major ON Students(Major);

 Retrieve Data Using Index

-- Query using indexed column
SELECT * FROM Students WHERE Major = 'Physics';
-- This uses idx_major to speed up lookup

 Insert Data and Update Indexes

-- Insert new student
INSERT INTO Students VALUES (101, 'Alice', 'Physics');
-- Index on Major is automatically updated

 Delete Data and Impact on Indexes

-- Delete student
DELETE FROM Students WHERE StudentID = 101;
-- Index entries for StudentID and Major are removed

# Partitioning Performance Report

## Objective
To improve query performance on the large `bookings` table by implementing **range partitioning** on the `start_date` column.

---

## Approach

- The original `bookings` table was partitioned into yearly segments (2023, 2024, 2025) using PostgreSQL's **RANGE** partitioning.
- Indexes were created on `user_id` and `property_id` in each partition.
- Queries on date ranges were then tested and analyzed using `EXPLAIN ANALYZE`.

---

## Performance Comparison

### Query:
```sql
SELECT * FROM bookings_partitioned
WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';
# Indexing for Query Performance

## Objective
Improve performance of frequent queries by adding indexes on columns used in WHERE, JOIN, and ORDER BY clauses.

---

## Step 1: Identify High-Usage Columns

| Table     | Column        | Reason for Indexing                  |
|-----------|---------------|--------------------------------------|
| bookings  | user_id       | Frequently used in JOIN with users   |
| bookings  | property_id   | Frequently used in JOIN with properties |
| bookings  | created_at    | Used in ORDER BY or range queries    |
| users     | email         | Used in user lookups and authentication |
| properties| location      | Used in filtering properties         |

---

## Step 2: Create Indexes

Indexes were created using the following SQL commands:

```sql
-- See database_index.sql file for actual commands.
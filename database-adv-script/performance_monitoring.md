# Database Performance Monitoring and Refinement Report

## Objective
To monitor and improve the performance of frequently used queries in the Airbnb database by analyzing execution plans and making schema-level adjustments such as indexing or normalization.

---

## Tools Used
- `EXPLAIN ANALYZE` – to visualize and analyze the query execution plan.
- PostgreSQL (or MySQL's `SHOW PROFILE` if applicable).

---

## Query 1: Retrieve All Bookings with User and Property Details

### Original Query:
```sql
SELECT b.id, b.start_date, b.end_date, u.name, p.name
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id;

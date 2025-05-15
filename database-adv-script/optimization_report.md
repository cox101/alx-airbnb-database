# Query Optimization Report

## Objective
Optimize a complex SQL query to reduce execution time and improve performance.

---

## Initial Query Analysis

### Query:
- Joins `bookings`, `users`, `properties`, and `payments`
- Retrieves multiple fields

### Performance Analysis (Using EXPLAIN):

- **Joins**: All 4 tables joined using primary and foreign keys
- **Cost**: ~8000
- **Execution Time**: ~150 ms
- **Issues**:
    - No selective filtering (`WHERE` clause missing)
    - Fetching all columns, even unnecessary ones
    - No index usage observed

---

## Optimization Steps

### 1. Add Relevant Indexes

```sql
-- Indexes (already added in previous tasks, but critical here too)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);
# Optimization Report

## Initial Query
The initial query joined the `bookings`, `users`, `properties`, and `payments` tables to fetch all related details. It used:

- `JOIN` on 3 other tables
- `ORDER BY` on `bookings.id`

## Performance Analysis (Using EXPLAIN)
The query was slow due to:

- No indexes on foreign keys like `user_id`, `property_id`, or `booking_id`.
- Selecting unnecessary columns (e.g., `location`, `status`).
- Multiple full table scans.

## Optimization Steps

1. **Reduced Columns**:
  - Removed unnecessary columns like `location` and `status` to reduce data load.

2. **Index Suggestions**:
  - Added indexes on:
    - `bookings.user_id`
    - `bookings.property_id`
    - `payments.booking_id`

3. **Query Refactor**:
  - Used only necessary fields.
  - Kept the same JOIN logic but made it lighter.

## Result
The optimized query executed faster due to:
- Smaller result size.
- Use of indexes which reduced full table scans.

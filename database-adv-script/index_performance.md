# Index Performance Report

## Why Indexes?

Indexes make it faster to find rows in large tables — like how a book index helps you find a topic quickly.

## What We Did
Booked at queries that join tables or filter/search using specific columns. These are the columns we indexed:

- `bookings.user_id` → used in JOIN with users.
- `bookings.property_id` → used in JOIN with properties.
- `payments.booking_id` → used in JOIN with bookings.
- `users.email` → often used in login or search.
- `bookings.start_date` → used in date range filters.

## Performance Test

Ran this query before and after adding indexes:

```sql
EXPLAIN
SELECT bookings.id, users.first_name, properties.name
FROM bookings
JOIN users ON bookings.user_id = users.id
JOIN properties ON bookings.property_id = properties.id
WHERE bookings.start_date >= '2024-01-01'
ORDER BY bookings.id;

-- Initial Query
-- This joins four tables: bookings, users, properties, payments
SELECT
    bookings.id AS booking_id,
    users.first_name,
    users.last_name,
    properties.name AS property_name,
    properties.location,
    payments.amount,
    payments.status
FROM bookings
         JOIN users ON bookings.user_id = users.id
         JOIN properties ON bookings.property_id = properties.id
         JOIN payments ON bookings.id = payments.booking_id
ORDER BY bookings.id;

-- Use EXPLAIN to analyze performance
EXPLAIN
SELECT
    bookings.id AS booking_id,
    users.first_name,
    users.last_name,
    properties.name AS property_name,
    properties.location,
    payments.amount,
    payments.status
FROM bookings
         JOIN users ON bookings.user_id = users.id
         JOIN properties ON bookings.property_id = properties.id
         JOIN payments ON bookings.id = payments.booking_id
ORDER BY bookings.id;

-- only select what’s needed, add indexes on keys if not there
-- Also, if 'location' or 'status' are not required, remove them
-- join keys should be indexed: user_id, property_id, booking_id

-- Optimize Query
SELECT
    bookings.id AS booking_id,
    users.first_name,
    users.last_name,
    properties.name AS property_name,
    payments.amount
FROM bookings
         JOIN users ON bookings.user_id = users.id
         JOIN properties ON bookings.property_id = properties.id
         JOIN payments ON bookings.id = payments.booking_id
ORDER BY bookings.id;

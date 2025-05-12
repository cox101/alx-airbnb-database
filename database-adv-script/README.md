# Join Queries - ALX Airbnb Database Module

This file contains SQL scripts demonstrating advanced SQL JOINs using the simulated Airbnb schema.

## 📄 Queries Included

1. **INNER JOIN**  
   Retrieves all bookings and the users who made those bookings.

2. **LEFT JOIN**  
   Retrieves all properties along with their reviews, including properties without reviews.

3. **FULL OUTER JOIN**  
   Retrieves all users and bookings, including users without bookings and bookings without a linked user.
    - **Note**: Since MySQL does not support `FULL OUTER JOIN` natively, it is emulated using a `UNION` of `LEFT JOIN` and `RIGHT JOIN`.

## Subqueries

This module includes:
- A non-correlated subquery to filter properties with average rating > 4.0.
- A correlated subquery to find users with more than 3 bookings.

### Files
- `subqueries.sql`: Contains all subquery SQL scripts.

## Aggregations and Window Functions

This script includes:
- An aggregation query to count how many bookings each user has made.
- A window function (RANK) to order properties by the number of bookings they've received.

### File
- `aggregations_and_window_functions.sql`: Contains aggregation and ranking logic using SQL.

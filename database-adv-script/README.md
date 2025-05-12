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


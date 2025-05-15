# Join Queries - ALX Airbnb Database Module

# Complex Queries with Joins

## Objective
To practice and demonstrate the ability to use various types of SQL joins to retrieve meaningful insights from multiple related tables.

## Implemented Joins

### 1. INNER JOIN
This query retrieves all bookings and the respective users who made those bookings. It only includes rows where there is a match between `bookings.user_id` and `users.id`.

### 2. LEFT JOIN
This query retrieves all properties and their reviews. It includes all properties even if they don’t have any reviews.

### 3. FULL OUTER JOIN
This query retrieves all users and all bookings. It ensures that users without bookings and bookings without users are still included in the results.

## Notes
- All queries include `ORDER BY` clauses to ensure results are sorted and easy to read.

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
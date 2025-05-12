# Airbnb Database Normalization

## Objective
This document outlines the normalization process applied to the Airbnb database schema to ensure data integrity, eliminate redundancy, and comply with the Third Normal Form (3NF).

---

## First Normal Form (1NF)

**Definition**: A table is in 1NF if:
- All columns contain atomic (indivisible) values.
- Each record is unique.

**Evaluation**:
- All entities (User, Property, Booking, Payment, Review, Message) have atomic fields.
- There are no repeating groups or arrays.
- Primary keys are defined to ensure uniqueness.

✅ **Result**: All tables are in 1NF.

---

## Second Normal Form (2NF)

**Definition**: A table is in 2NF if:
- It is in 1NF.
- All non-key attributes are fully functionally dependent on the entire primary key.

**Evaluation**:
- All tables with composite primary keys were evaluated (none currently exist; all use UUIDs).
- Each attribute depends on the full primary key (which is a single attribute in each table).
- No partial dependencies.

✅ **Result**: All tables are in 2NF.

---

## Third Normal Form (3NF)

**Definition**: A table is in 3NF if:
- It is in 2NF.
- No transitive dependency exists (non-key attributes do not depend on other non-key attributes).

**Evaluation**:
- No transitive dependencies were found.
- All non-key fields depend only on the primary key.

Example:
- In `Property`, `host_id` is a foreign key and not derived from any other non-key attribute.
- In `Review`, `rating` and `comment` are dependent only on `review_id`.
- In `Payment`, `amount` and `payment_method` are only dependent on `payment_id`.

✅ **Result**: All tables are in 3NF.

---

## Summary

The original database schema has been carefully reviewed and confirmed to satisfy:
- **1NF** by having atomic attributes and unique rows.
- **2NF** by eliminating partial dependencies.
- **3NF** by removing transitive dependencies.

Thus, the Airbnb database design is normalized up to the **Third Normal Form (3NF)**, ensuring data efficiency and integrity.

# alx-airbnb-database
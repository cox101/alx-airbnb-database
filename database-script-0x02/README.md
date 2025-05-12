# ER Diagram – Airbnb Database Project

## Objective
This document outlines the entities and relationships represented in the ER diagram for the Airbnb-like database system. It serves as the foundational blueprint for the system's schema design, aligning with best practices for relational databases.

---

## Tools Used
- **Draw.io** (also known as diagrams.net) – for designing the ERD.

---

## Entities and Attributes

### 1. User
- `user_id` (PK)
- `first_name`
- `last_name`
- `email` (UNIQUE)
- `password_hash`
- `phone_number`
- `role` (ENUM: guest, host, admin)
- `created_at`

### 2. Property
- `property_id` (PK)
- `host_id` (FK → User)
- `name`
- `description`
- `location`
- `pricepernight`
- `created_at`
- `updated_at`

### 3. Booking
- `booking_id` (PK)
- `property_id` (FK → Property)
- `user_id` (FK → User)
- `start_date`
- `end_date`
- `total_price`
- `status` (ENUM: pending, confirmed, canceled)
- `created_at`

### 4. Payment
- `payment_id` (PK)
- `booking_id` (FK → Booking)
- `amount`
- `payment_date`
- `payment_method` (ENUM: credit_card, paypal, stripe)

### 5. Review
- `review_id` (PK)
- `property_id` (FK → Property)
- `user_id` (FK → User)
- `rating` (1–5)
- `comment`
- `created_at`

### 6. Message
- `message_id` (PK)
- `sender_id` (FK → User)
- `recipient_id` (FK → User)
- `message_body`
- `sent_at`

---

## Relationships

- **User–Property**: One-to-Many (One host can list multiple properties)
- **User–Booking**: One-to-Many (One user can make many bookings)
- **User–Review**: One-to-Many (One user can review multiple properties)
- **User–Message**: Self-referencing One-to-Many (users send messages to other users)
- **Property–Booking**: One-to-Many (Each property can have multiple bookings)
- **Property–Review**: One-to-Many (Each property can be reviewed multiple times)
- **Booking–Payment**: One-to-One (Each booking has one payment)

---

## Notes
- UUIDs are used for primary keys.
- Timestamps are used for tracking creation and update times.
- ENUMs are used for fixed set attributes to maintain data consistency.
- Indexing is applied to frequently queried fields such as `email`, `property_id`, and `booking_id`.

---

## Diagram Location
The ER diagram is stored in this directory as an image or XML file:






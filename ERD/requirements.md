# Entity-Relationship Diagram (ERD) – Airbnb Database

## Objective
Create an Entity-Relationship (ER) diagram based on the Airbnb database specification provided.

## Tools
This diagram was created using [Draw.io](https://draw.io) for clear and professional visualization of entities and relationships.

## Entities and Attributes

### 1. User
- **user_id** (PK)
- first_name
- last_name
- email (UNIQUE)
- password_hash
- phone_number
- role (ENUM: guest, host, admin)
- created_at

### 2. Property
- **property_id** (PK)
- host_id (FK → User.user_id)
- name
- description
- location
- pricepernight
- created_at
- updated_at

### 3. Booking
- **booking_id** (PK)
- property_id (FK → Property.property_id)
- user_id (FK → User.user_id)
- start_date
- end_date
- total_price
- status (ENUM: pending, confirmed, canceled)
- created_at

### 4. Payment
- **payment_id** (PK)
- booking_id (FK → Booking.booking_id)
- amount
- payment_date
- payment_method (ENUM: credit_card, paypal, stripe)

### 5. Review
- **review_id** (PK)
- property_id (FK → Property.property_id)
- user_id (FK → User.user_id)
- rating (1–5)
- comment
- created_at

### 6. Message
- **message_id** (PK)
- sender_id (FK → User.user_id)
- recipient_id (FK → User.user_id)
- message_body
- sent_at

## Relationships

- **User (1) → (M) Booking**
- **User (1) → (M) Property** (as host)
- **Property (1) → (M) Booking**
- **Booking (1) → (1) Payment**
- **User (1) → (M) Review**
- **Property (1) → (M) Review**
- **User (1) → (M) Message** (sent and received)

## ER Diagram File
The ERD image is saved in this directory as:  
📄 `![airbnb_erd.png.png](../../Downloads/airbnb_erd.png.png)`

---

## Notes
- All entities are in 3rd Normal Form (3NF).
- Relationships are clearly defined with proper foreign key references.
- Indexing considerations and constraints are observed.


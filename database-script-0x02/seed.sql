-- Insert Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    (gen_random_uuid(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw_1', '1234567890', 'guest'),
    (gen_random_uuid(), 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '0987654321', 'host'),
    (gen_random_uuid(), 'Clara', 'Oswald', 'clara@example.com', 'hashed_pw_3', '1112223333', 'admin');

-- Insert Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
    (gen_random_uuid(), (SELECT user_id FROM User WHERE email = 'bob@example.com'),
     'Ocean View Apartment', 'A cozy apartment with sea view.', 'Mombasa, Kenya', 85.50),
    (gen_random_uuid(), (SELECT user_id FROM User WHERE email = 'bob@example.com'),
     'Mountain Cabin Retreat', 'Peaceful getaway in the hills.', 'Naivasha, Kenya', 120.00);

-- Insert Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
    (
        gen_random_uuid(),
        (SELECT property_id FROM Property WHERE name = 'Ocean View Apartment'),
        (SELECT user_id FROM User WHERE email = 'alice@example.com'),
        '2025-06-01', '2025-06-05', 342.00, 'confirmed'
    );

-- Insert Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
    (
        gen_random_uuid(),
        (SELECT booking_id FROM Booking WHERE status = 'confirmed'),
        342.00, 'credit_card'
    );

-- Insert Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
    (
        gen_random_uuid(),
        (SELECT property_id FROM Property WHERE name = 'Ocean View Apartment'),
        (SELECT user_id FROM User WHERE email = 'alice@example.com'),
        5, 'Amazing stay! Great view and hospitality.'
    );

-- Insert Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
    (
        gen_random_uuid(),
        (SELECT user_id FROM User WHERE email = 'alice@example.com'),
        (SELECT user_id FROM User WHERE email = 'bob@example.com'),
        'Hi Bob, is your apartment available in July?'
    );

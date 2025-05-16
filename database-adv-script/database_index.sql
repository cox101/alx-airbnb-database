-- Create index on user_id in bookings table for faster JOINs
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Create index on property_id in bookings table
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Create index on booking_id in payments table for faster JOINs
CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- Create index on email in users table (if you often search users by email)
CREATE INDEX idx_users_email ON users(email);

-- Create index on start_date in bookings table (used in WHERE or for partitioning)
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

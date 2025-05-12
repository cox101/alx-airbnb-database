-- User Table
CREATE TABLE User (
                      user_id UUID PRIMARY KEY,
                      first_name VARCHAR NOT NULL,
                      last_name VARCHAR NOT NULL,
                      email VARCHAR UNIQUE NOT NULL,
                      password_hash VARCHAR NOT NULL,
                      phone_number VARCHAR,
                      role VARCHAR CHECK (role IN ('guest', 'host', 'admin')) NOT NULL,
                      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Property Table
CREATE TABLE Property (
                          property_id UUID PRIMARY KEY,
                          host_id UUID REFERENCES User(user_id),
                          name VARCHAR NOT NULL,
                          description TEXT NOT NULL,
                          location VARCHAR NOT NULL,
                          pricepernight DECIMAL NOT NULL,
                          created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                          updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Booking Table
CREATE TABLE Booking (
                         booking_id UUID PRIMARY KEY,
                         property_id UUID REFERENCES Property(property_id),
                         user_id UUID REFERENCES User(user_id),
                         start_date DATE NOT NULL,
                         end_date DATE NOT NULL,
                         total_price DECIMAL NOT NULL,
                         status VARCHAR CHECK (status IN ('pending', 'confirmed', 'canceled')) NOT NULL,
                         created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Payment Table
CREATE TABLE Payment (
                         payment_id UUID PRIMARY KEY,
                         booking_id UUID REFERENCES Booking(booking_id),
                         amount DECIMAL NOT NULL,
                         payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                         payment_method VARCHAR CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')) NOT NULL
);

-- Review Table
CREATE TABLE Review (
                        review_id UUID PRIMARY KEY,
                        property_id UUID REFERENCES Property(property_id),
                        user_id UUID REFERENCES User(user_id),
                        rating INTEGER CHECK (rating >= 1 AND rating <= 5) NOT NULL,
                        comment TEXT NOT NULL,
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Message Table
CREATE TABLE Message (
                         message_id UUID PRIMARY KEY,
                         sender_id UUID REFERENCES User(user_id),
                         recipient_id UUID REFERENCES User(user_id),
                         message_body TEXT NOT NULL,
                         sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Indexes
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_property_property_id ON Property(property_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

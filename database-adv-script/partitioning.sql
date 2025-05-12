-- Drop the original table if needed (backup first in real scenarios)
-- CREATE TABLE bookings_backup AS SELECT * FROM bookings;

-- Step 1: Create the master partitioned table
CREATE TABLE bookings_partitioned (
                                      id SERIAL PRIMARY KEY,
                                      user_id INT NOT NULL,
                                      property_id INT NOT NULL,
                                      start_date DATE NOT NULL,
                                      end_date DATE NOT NULL,
                                      status VARCHAR(50),
                                      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 2: Create child partitions by date ranges
CREATE TABLE bookings_2023 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE bookings_2025 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 3: (Optional) Add indexes on commonly queried fields
CREATE INDEX idx_user_id_2024 ON bookings_2024(user_id);
CREATE INDEX idx_property_id_2024 ON bookings_2024(property_id);

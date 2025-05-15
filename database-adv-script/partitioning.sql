-- First, create a new partitioned table
CREATE TABLE Booking_partitioned (
    booking_id INTEGER PRIMARY KEY,
    user_id INTEGER,
    property_id INTEGER,
    start_date DATE,
    end_date DATE,
    status VARCHAR(50),
    total_price DECIMAL(10,2),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES "User"(user_id),
    FOREIGN KEY (property_id) REFERENCES Property(property_id)
) PARTITION BY RANGE (start_date);

-- Create partitions for different date ranges
CREATE TABLE booking_y2023 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE booking_y2024 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE booking_y2025 PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE booking_future PARTITION OF Booking_partitioned
    FOR VALUES FROM ('2026-01-01') TO (MAXVALUE);

CREATE TABLE booking_past PARTITION OF Booking_partitioned
    FOR VALUES FROM (MINVALUE) TO ('2023-01-01');

-- Migrate data from original table to partitioned table
INSERT INTO Booking_partitioned
SELECT * FROM Booking;

-- Create indexes on the partitioned table
CREATE INDEX idx_booking_partitioned_user_id ON Booking_partitioned(user_id);
CREATE INDEX idx_booking_partitioned_property_id ON Booking_partitioned(property_id);
CREATE INDEX idx_booking_partitioned_status ON Booking_partitioned(status);

-- Example query using the partitioned table
EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    b.total_price,
    u.first_name,
    u.last_name,
    p.name as property_name
FROM Booking_partitioned b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date >= '2024-01-01'
ORDER BY b.start_date DESC;
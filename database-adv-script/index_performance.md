-- Indexes for User table
CREATE INDEX idx_user_id ON "User" (user_id);
CREATE INDEX idx_user_email ON "User" (email);

-- Indexes for Booking table
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);
CREATE INDEX idx_booking_dates ON Booking (start_date, end_date);
CREATE INDEX idx_booking_status ON Booking (status);

-- Indexes for Property table
CREATE INDEX idx_property_id ON Property (property_id);
CREATE INDEX idx_property_location ON Property (location);

-- Test query to measure performance
EXPLAIN ANALYZE
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) as total_bookings
FROM "User" u
LEFT JOIN Booking b ON u.user_id = b.user_id
WHERE b.status = 'confirmed'
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_bookings DESC;
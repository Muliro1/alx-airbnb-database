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


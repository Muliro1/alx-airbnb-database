-- Users
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  ('11111111-1111-1111-1111-111111111111', 'Alice', 'Smith', 'alice@example.com', 'hash1', '1234567890', 'guest'),
  ('22222222-2222-2222-2222-222222222222', 'Bob', 'Johnson', 'bob@example.com', 'hash2', '2345678901', 'host'),
  ('33333333-3333-3333-3333-333333333333', 'Carol', 'Williams', 'carol@example.com', 'hash3', NULL, 'host'),
  ('44444444-4444-4444-4444-444444444444', 'Dave', 'Brown', 'dave@example.com', 'hash4', '3456789012', 'guest'),
  ('55555555-5555-5555-5555-555555555555', 'Eve', 'Admin', 'eve@example.com', 'hash5', NULL, 'admin');

-- Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  ('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '22222222-2222-2222-2222-222222222222', 'Cozy Cottage', 'A lovely cottage in the countryside.', 'Nairobi', 75.00),
  ('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '33333333-3333-3333-3333-333333333333', 'City Apartment', 'Modern apartment in the city center.', 'Mombasa', 120.00);

-- Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  ('bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', '2024-07-01', '2024-07-05', 300.00, 'confirmed'),
  ('bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '44444444-4444-4444-4444-444444444444', '2024-08-10', '2024-08-12', 240.00, 'pending');

-- Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  ('ccccccc1-cccc-cccc-cccc-ccccccccccc1', 'bbbbbbb1-bbbb-bbbb-bbbb-bbbbbbbbbbb1', 300.00, 'credit_card'),
  ('ccccccc2-cccc-cccc-cccc-ccccccccccc2', 'bbbbbbb2-bbbb-bbbb-bbbb-bbbbbbbbbbb2', 240.00, 'paypal');

-- Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  ('ddddddd1-dddd-dddd-dddd-dddddddddddd1', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaa1', '11111111-1111-1111-1111-111111111111', 5, 'Wonderful stay!'),
  ('ddddddd2-dddd-dddd-dddd-dddddddddddd2', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaa2', '44444444-4444-4444-4444-444444444444', 4, 'Great location, clean apartment.');

-- Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  ('eeeeeee1-eeee-eeee-eeee-eeeeeeeeeee1', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Hi, is the cottage available in July?'),
  ('eeeeeee2-eeee-eeee-eeee-eeeeeeeeeee2', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Yes, it is available. Looking forward to hosting you!');
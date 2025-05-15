EXPLAIN ANALYZE
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.status,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name as property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_status
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= CURRENT_DATE - INTERVAL '1 year'
ORDER BY b.start_date DESC;

Optimizations made:
Removed unnecessary columns (email, payment_date)
Added a date filter to limit the data set
Using existing indexes from database_index.sql
4. Changed to LEFT JOIN for Payment table since not all bookings might have payments
Kept the most important columns for the query
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) as total_bookings
FROM "User" u
LEFT JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_bookings DESC;


SELECT 
    p.property_id,
    p.name,
    p.location,
    COUNT(b.booking_id) as booking_count,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) as booking_rank,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) as booking_row_number
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name, p.location
ORDER BY booking_count DESC;
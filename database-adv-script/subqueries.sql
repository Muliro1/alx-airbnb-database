SELECT 
    p.property_id,
    p.name,
    p.location,
    (SELECT AVG(rating) 
     FROM Review 
     WHERE property_id = p.property_id) as avg_rating
FROM Property p
WHERE (SELECT AVG(rating) 
       FROM Review 
       WHERE property_id = p.property_id) > 4.0;


SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    (SELECT COUNT(*) 
     FROM Booking 
     WHERE user_id = u.user_id) as booking_count
FROM "User" u
WHERE (SELECT COUNT(*) 
       FROM Booking 
       WHERE user_id = u.user_id) > 3;
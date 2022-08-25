SELECT id, name, email, password
FROM users
WHERE email = tristanjacobs@gmail.com;

SELECT avg(end_date-start_date) AS average_duration
FROM reservations;

SELECT properties.id, title, cost_per_night, avg(poperty_reviews.rating) AS average_rating
FROM properties
LEFT JOIN property_reviews ON properties.id = property_id
WHERE city LIKE "%ancouv%"
GROUP BY properties.id
HAVING avg(property_reviews.rating) >= 4
ORDER BY cost_per_night
LIMIT 10;

SELECT properties.city, COUNT(reservations.id) AS total_reservations
FROM reservations
JOIN properties ON property_id = properties.id
GROUP BY properties.city
ORDER BY total_reservations DESC;

SELECT reservations.id, properties.title, reservations.start_date, properties.cost_per_night, avg(rating) as average_rating
FROM reservations
JOIN properties ON reservations.property_id = properties.id
JOIN property_reviews ON properties.id = property_reviews.property_id
WHERE reservations.guest_id = 1
GROUP BY properties.id, reservations.id
ORDER BY reservations.start_date
LIMIT 10;
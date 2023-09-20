-- 1. How many actors are there with the last name ‘Wahlberg’?
--ANSWER-- 2
SELECT COUNT (*) AS actor_count
FROM actor
WHERE last_name = 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
--ANSWER-- 2
SELECT COUNT(*) AS payment_count
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- 3. What film does the store have the most of? (search in inventory)
--ANSWER-- Academy Dinosaur
SELECT title, COUNT(*)
FROM film, inventory
GROUP BY title
ORDER BY COUNT(*) DESC
LIMIT 1; 

-- 4. How many customers have the last name ‘William’?
--ANSWER-- 0
SELECT COUNT (*) AS actor_count
FROM actor
WHERE last_name = 'William';

-- 5. What store employee (get the id) sold the most rentals?
--ANSWER-- staff id 2 sold 2911.44 rentals
SELECT staff_id, SUM(amount) AS total_rentals
FROM payment
WHERE amount > 0
GROUP BY staff_id
ORDER BY total_rentals DESC

-- 6. How many different district names are there?
--ANSWER-- 603
SELECT COUNT(district)
FROM address;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
--ANSWER-- Pajama Jawbreaker
SELECT film_id, title
FROM film
GROUP BY film_id,title
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
--ANSWER--0
SELECT COUNT (*) AS customer_count
FROM customer
WHERE store_id = 1 AND last_name LIKE 'es%';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
--ANSWER--
SELECT amount, COUNT(customer_id)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(customer_id) > 250;

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total? 5 rating categories with rating PG-13 having the most total movies of 224
--ANSWER--
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating;

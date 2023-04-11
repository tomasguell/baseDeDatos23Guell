
SELECT title, special_features FROM film WHERE rating = 'PG-13';


SELECT DISTINCT length FROM film;

SELECT title, rental_rate, replacement_cost FROM film WHERE replacement_cost BETWEEN 20.00 AND 24.00;

SELECT title, category.name, rating FROM film 
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
WHERE special_features LIKE '%Behind the Scenes%';

SELECT actor.first_name, actor.last_name FROM actor 
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
WHERE title LIKE 'ZOOLANDER FICTION';

SELECT address, city.city, country.country FROM store
JOIN address ON store.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
WHERE store.store_id = 1;

SELECT f1.title, f2.title, f1.rating FROM film f1, film f2
WHERE f1.film_id <> f2.film_id AND f1.rating = f2.rating
ORDER BY f1.rating;

SELECT film.title, staff.first_name, staff.last_name FROM inventory
JOIN film ON inventory.film_id = film.film_id
JOIN store ON inventory.store_id = store.store_id
JOIN staff ON store.manager_staff_id = staff.staff_id
WHERE inventory.store_id = 2;
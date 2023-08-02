use sakila; 
 #Get the amount of cities per country in the database. Sort them by country, country_id. 
 SELECT co.country ,count(ci.city)  
 from country co  
 join city ci on co.country_id = ci.country_id  
 group by co.country  
 order by co.country; 
  
 #Get the amount of cities per country in the database. Show only the countries with more than 10 cities, order from the highest amount of cities to the lowest 
 SELECT co.country ,count(ci.city) as Cantidad  
 from country co 
 join city ci on co.country_id = ci.country_id  
 group by co.country 
 having count(ci.city) >10 
 order by Cantidad DESC; 
  
 #Generate a report with customer (first, last) name, address, total films rented and the total money spent renting films. Show the ones who spent more money first . 
 SELECT CONCAT(c.first_name, ' ' ,c.last_name) as Cliente , a.address as Direccion, 
 (SELECT COUNT(*) FROM rental r WHERE c.customer_id = r.customer_id) as PeliculasAlquiladas, 
 (SELECT SUM(p.amount) FROM payment p WHERE c.customer_id = p.customer_id) as DineroTotalGastado  
 FROM customer c 
 JOIN address a on c.address_id = a.address_id 
 GROUP BY c.first_name, c.last_name, a.address, c.customer_id 
 ORDER BY DineroTotalGastado DESC; 
  
 #Which film categories have the larger film duration (comparing average)? Order by average in descending order 
 SELECT c.name , AVG(f.length) as PromedioDuracion 
 FROM film f JOIN film_category fc ON fc.film_id = f.film_id  
 JOIN category c ON fc.category_id = c.category_id 
 group by c.name 
 order by PromedioDuracion DESC; 
  
 #Show sales per film rating 
 SELECT f.rating, COUNT(p.payment_id) as Ventas 
 FROM film f 
 JOIN inventory i ON i.film_id = f.film_id 
 JOIN rental r ON r.inventory_id = i.inventory_id 
 JOIN payment p ON p.rental_id = r.rental_id  
 GROUP BY rating 
 ORDER BY Ventas DESC;

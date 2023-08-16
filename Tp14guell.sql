SELECT CONCAT(c.first_name, ' ', c.last_name) AS NombreCompleto, a.address, ci.city 
 FROM customer c 
 INNER JOIN address a USING (address_id) 
 INNER JOIN city ci USING (city_id) 
 INNER JOIN country co USING (country_id) 
 WHERE co.country = 'Argentina'; 
  
 #Write a query that shows the film title, language and rating. Rating shall be shown as the full text described here: https://en.wikipedia.org/wiki/Motion_picture_content_rating_system#United_States. Hint: use case. 
 SELECT f.title, l.name AS lenguaje, 
        CASE f.rating 
            WHEN 'G' THEN 'General Audiences' 
            WHEN 'PG' THEN 'Parental Guidance Suggested' 
            WHEN 'PG-13' THEN 'Parents Strongly Cautioned' 
            WHEN 'R' THEN 'Restricted' 
            WHEN 'NC-17' THEN 'Adults Only' 
            ELSE 'Not Rated' 
        END rating 
 FROM film f 
 INNER JOIN language l USING (language_id); 
  
 #Write a search query that shows all the films (title and release year) an actor was part of. Assume the actor comes from a text box introduced by hand from a web page. Make sure to "adjust" the input text to try to find the films as effectively as you think is possible. 
 SELECT CONCAT(ac.first_name,' ',ac.last_name)as Nombre, f.title, f.release_year 
 FROM film f 
     INNER JOIN film_actor USING(film_id) 
     INNER JOIN actor ac USING(actor_id) 
 WHERE 
     CONCAT(first_name, ' ', last_name) LIKE TRIM(UPPER('ED CHASE')); 
  
 select * from actor; 
  
 #Find all the rentals done in the months of May and June. Show the film title, customer name and if it was returned or not. There should be returned column with two possible values 'Yes' and 'No'. 
 SELECT f.title, CONCAT(c.first_name, ' ', c.last_name) AS Nombre, 
        CASE 
            WHEN r.return_date IS NULL THEN 'No' 
            ELSE 'Sí' 
        END Devuelto 
 FROM rental r 
 INNER JOIN inventory i USING (inventory_id) 
 INNER JOIN film f USING (film_id) 
 INNER JOIN customer c USING (customer_id) 
 WHERE MONTH(r.rental_date) IN (5, 6); 
  
 select MONTH(rental_date) from rental;
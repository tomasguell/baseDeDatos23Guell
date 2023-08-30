-- Consultas #1
-- Seleccionar direcciones con ciudades y países correspondientes para códigos postales específicos.
SELECT a.*, c.city, co.country
FROM address a
JOIN city c USING (city_id)
JOIN country co USING (country_id)
WHERE postal_code IN ('10000', '20000', '30000');  -- 0,01 sec

-- Seleccionar direcciones con ciudades y países correspondientes para códigos postales excluidos.
SELECT a.*, c.city, co.country
FROM address a
JOIN city c USING (city_id)
JOIN country co USING (country_id)
WHERE postal_code NOT IN ('10000', '20000', '30000');  -- 0,10 sec

-- Crear un índice en la columna postal_code para optimizar la búsqueda.
CREATE INDEX idx_postal_code ON address (postal_code); -- 2,40 sec

-- Consultas #2
-- Recuperar todos los datos de la tabla de actores.
select * from actor;

-- Filtrar actores por primer nombre 'THORA'.
SELECT * FROM actor WHERE first_name = 'THORA';

-- Filtrar actores por apellido 'TEMPLE'.
SELECT * FROM actor WHERE last_name = 'TEMPLE';

-- Consultas #3
-- Agregar un índice de texto completo en la columna title de la tabla film.
ALTER TABLE film
    ADD FULLTEXT (title);

-- Buscar películas que contienen 'HARRY' utilizando LIKE.
SELECT * FROM film WHERE title LIKE '%HARRY%'; -- 0,33 sec

-- Buscar películas que contienen 'HARRY' utilizando MATCH AGAINST.
SELECT * FROM film WHERE MATCH (title) AGAINST ('HARRY'); -- 0,00 sec

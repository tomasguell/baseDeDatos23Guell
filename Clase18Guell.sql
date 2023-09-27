-- Activa la base de datos sakila en el servidor con la dirección IP 127.0.0.1 y el puerto 3306.
	
# Función: obtener_copias_de_pelicula_en_tienda
# Esta función devuelve la cantidad de copias de una película en una tienda en la base de datos sakila-db.
# Se puede pasar tanto el ID de la película como el nombre de la película y el ID de la tienda.
SELECT f.title
FROM inventory inv
INNER JOIN film f ON inv.film_id = f.film_id
INNER JOIN store s ON inv.store_id = s.store_id
WHERE s.store_id = 1;

SELECT COUNT(*) AS cantidad_copias
FROM inventory inv
INNER JOIN film f ON inv.film_id = f.film_id
INNER JOIN store s ON inv.store_id = s.store_id
WHERE (f.film_id = 1 OR f.title = 'AGENT TRUMAN')
  AND s.store_id = 1;


# Procedimiento almacenado: ObtenerClientesEnPais
# Este procedimiento tiene un parámetro de salida que contiene una lista de nombres de clientes, 
# separados por ";", que viven en un país específico. 
# Se utiliza un cursor para lograr esto sin utilizar funciones de agregación como CONCAT_WS.

-- Consulta para obtener información sobre los países.
SELECT * FROM country;

DELIMITER //
DROP PROCEDURE IF EXISTS ObtenerClientesEnPais;
CREATE PROCEDURE ObtenerClientesEnPais(IN p_pais VARCHAR(50), OUT p_lista_clientes VARCHAR(1000))
BEGIN
    DECLARE hecho INT DEFAULT 0;
    DECLARE nombre VARCHAR(255);
    DECLARE clientes_pais CURSOR FOR
        SELECT CONCAT(c.first_name, ' ', c.last_name)
        FROM customer c
        INNER JOIN address a ON c.address_id = a.address_id
        INNER JOIN city ci ON a.city_id = ci.city_id
        INNER JOIN country co ON ci.country_id = co.country_id
        WHERE co.country = p_pais;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET hecho = 1;
    
    SET p_lista_clientes = '';

    OPEN clientes_pais;
    
    FETCH clientes_pais INTO nombre;
    
    WHILE NOT hecho DO
        IF p_lista_clientes = '' THEN
            SET p_lista_clientes = nombre;
        ELSE
            SET p_lista_clientes = CONCAT(p_lista_clientes, ';', nombre);
        END IF;
        
        FETCH clientes_pais INTO nombre;
    END WHILE;
    
    CLOSE clientes_pais;
END //
DELIMITER ;

-- Llamada al procedimiento para obtener la lista de clientes en Argentina.
CALL ObtenerClientesEnPais('Argentina', @lista_clientes);
SELECT @lista_clientes;


# Revisión de la función inventory_in_stock y el procedimiento film_in_stock con ejemplos de uso.

-- Función: inventory_in_stock
-- Esta función SQL toma dos parámetros, film_id (ID de la película) y store_id (ID de la tienda), 
-- y devuelve un valor booleano que indica si una película está en stock en una tienda específica.

-- Ejemplo de Uso:
-- Comprueba si la película con ID 1 está en stock en la tienda con ID 1.
SELECT inventory_in_stock(1, 1);

-- Esta consulta devolverá TRUE si la película está en stock y FALSE si no lo está.


-- Procedimiento: film_in_stock
-- Este procedimiento se utiliza para verificar si una película específica está en stock en una tienda específica 
-- y, si es así, muestra la información de la película y el inventario.

-- Ejemplo de Uso:
-- Verifica y muestra información sobre la película con ID 1 en la tienda con ID 1.
CALL film_in_stock(1, 1);

-- Este llamado al procedimiento mostrará la información de la película y del inventario si está disponible, 
-- o mostrará un mensaje indicando que la película no está disponible en esa tienda si no está en stock.

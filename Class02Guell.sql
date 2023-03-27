drop table if exists imdb;
CREATE DATABASE imdb;
USE imdb;

CREATE TABLE film (
  film_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255),
  description VARCHAR(255),
  release_year INT
  
);

CREATE TABLE actor (
  actor_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)

);

CREATE TABLE film_actor (
  film_actor INT AUTO_INCREMENT PRIMARY KEY,
  actor_id INT,
  film_id INT,
  FOREIGN KEY (actor_id) REFERENCES actor(actor_id),
  FOREIGN KEY (film_id) REFERENCES film(film_id)
);

INSERT INTO actor (first_name, last_name) VALUES
('Leo', 'Dicaprio'),('scarlett ', 'johanson');

INSERT INTO film (title, description, release_year) VALUES
('catch me if you can', 'una peli de escape', 1999);

INSERT INTO film_actor (actor_id, film_id) VALUES
(1, 1);

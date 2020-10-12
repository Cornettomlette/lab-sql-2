/*Instructions
Select all the actors with the first name ‘Scarlett’.
Select all the actors with the last name ‘Johansson’.
How many films (movies) are available for rent?
How many films have been rented?
What is the shortest and longest rental period?
What are the shortest and longest movie duration? Name the values max_duration and min_duration.
What's the average movie duration?
What's the average movie duration expressed in format (hours, minutes)?
How many movies longer than 3 hours?
Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
What's the length of the longest film title?*/

USE sakila;

-- 1) Select all the actors with the first name ‘Scarlett’.
SELECT * FROM actor
WHERE first_name = 'Scarlett';

-- 2) Select all the actors with the last name ‘Johansson’.
SELECT * FROM actor
WHERE last_name = 'Johansson';

-- 3) How many films (movies) are available for rent?
SELECT COUNT(film_id) FROM film;

-- 4) How many films have been rented?
SELECT COUNT(rental_id) FROM rental;

-- 5) What is the shortest and longest rental period?
SHOW FIELDS FROM rental;  -- checked if datatype of rental_date and return_date is datetime
SELECT MIN(DATEDIFF(return_date, rental_date)) as shortest_rental, MAX(DATEDIFF(return_date, rental_date)) as longest_rental  FROM rental;
--       I got the rental period measured in days
--       Another way to check rental duration is to get it from "film"table:
SELECT MIN(rental_duration) as shortest_rental, MAX(rental_duration) as longest_rental FROM film;

-- 6) What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT  MIN(length) as min_duration, MAX(length) as max_duration FROM film;

-- 7) What's the average movie duration?
SELECT ROUND(AVG(length)) as average_duration FROM film;

-- 8) What's the average movie duration expressed in format (hours, minutes)?
SELECT CONCAT(FLOOR(ROUND(AVG(length))/60),'h ',MOD(ROUND(AVG(length)),60),'m') AS average_duration_hs_ms FROM film;

-- 9) How many movies longer than 3 hours? (3 hours = 60*3 = 180 minutes)
SELECT COUNT(film_id) FROM film
WHERE length > 180;

-- 10) Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.
SELECT * FROM customer;
SELECT CONCAT(SUBSTR(first_name,1,1), LOWER(SUBSTR(first_name, 2)), ' ', last_name, ' - ', LOWER(email)) as formatted_name_email from customer;

-- 11) What's the length of the longest film title?
SELECT MAX(LENGTH(title)) FROM film;

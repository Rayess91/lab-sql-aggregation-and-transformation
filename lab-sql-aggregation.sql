USE sakila;
#1. You need to use SQL built-in functions to gain insights relating to the duration of movies:
#1.1 Determine the shortest and longest movie durations and name the values as max_duration and min_duration.

SELECT MAX(length) AS max_duration FROM film;
SELECT MIN(length) AS min_duration FROM film;

#1.2. Express the average movie duration in hours and minutes. Don't use decimals.
SELECT concat(AVG(length) DIV 60, 'H',ROUND(AVG(length) % 60), 'M') AS average_duration FROM film; 

#2. You need to gain insights related to rental dates:
#2.1 Calculate the number of days that the company has been operating.
SELECT datediff(MAX(rental_date), MIN(rental_date)) AS Nr_operation_days FROM rental;

#2.2 Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results.
SELECT * FROM rental;
SELECT *, DAYNAME(rental_date) AS Weekday FROM rental;
SELECT *, MONTHNAME(rental_date) AS Month_of_rental FROM rental;

#2.3 Bonus: Retrieve rental information and add an additional column called DAY_TYPE with values 'weekend' or 'workday', depending on the day of the week.
SELECT *,CASE WHEN DAYNAME(rental_date) = 'Saturday' 
OR DAYNAME(rental_date) = 'Sunday' THEN 'weekend'
ELSE 'workday' END AS DAY_TYPE
FROM rental;

#3.You need to ensure that customers can easily access information about the movie collection. To achieve this, retrieve the film titles and their rental duration. If any rental duration value is NULL, replace it with the string 'Not Available'. Sort the results of the film title in ascending order.alter
SELECT * FROM film;
SELECT title,
IFNULL(rental_duration, 'Not Available') as rent_duration
FROM film
ORDER BY title;


#4. Bonus: (Task not clear)
SELECT * FROM customer;
SELECT concat(first_name, last_name,LEFT(email,3 )), first_name, email  FROM customer
ORDER BY last_name;

#Challenge 2
#1- 
SELECT * FROM film;
#1.1 total number of films that have been released.
SELECT COUNT(release_year) FROM film;
#1.2. The number of films for each rating #1.3 sorting.
SELECT rating, COUNT(*) AS count
FROM film
GROUP BY rating
ORDER BY count DESC;
#2.1 The mean film duration for each rating,
SELECT rating, ROUND(AVG(length), 2) AS AVG_duration
FROM film
GROUP BY rating
ORDER BY AVG_duration DESC;
#2.2 Identify which ratings have a mean duration of over two hours in order to help select films for customers who prefer longer movies.
SELECT rating FROM film
GROUP BY rating
HAVING AVG(length) > 120;

#Bonus. determine which last names are not repeated in the table actor
SELECT last_name FROM actor
GROUP BY last_name
HAVING COUNT(*) = 1;







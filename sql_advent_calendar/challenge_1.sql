-- A ski resort company want to know which customers rented ski equipment for more than one type of activity (e.g., skiing and snowboarding). 
-- List the customer names and the number of distinct activities they rented equipment for.

SELECT customer_name FROM (
SELECT customer_name, count(DISTINCT activity) as activity_count FROM rentals
GROUP BY customer_name)
where activity_count > 1

--Write a query to output a list of product ID where the total price for the sale is more than $400. Sort the results in ascending order of the product ID.

SELECT DISTINCT product_id
FROM sales
WHERE total_price > 400
ORDER BY product_id ASC;

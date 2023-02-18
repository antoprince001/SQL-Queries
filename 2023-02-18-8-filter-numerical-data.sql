-- Write a query to retrieve sales information for product ID 392 where more than 1 item has been sold in each sale. 

SELECT *
FROM sales 
WHERE product_id=392 and quantity>1;



-- Write a query to retrieve sales information for product ID 392 where more than 1 item has been sold in each sale. 

SELECT sales_id, delivery_order_id,unit_price, quantity, total_price 
FROM sales 
WHERE product_id=392;

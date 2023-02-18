-- Write a query to output the sales information for denim (product_name) shirts (product_type).

SELECT * FROM sales 
WHERE product_id in 
( SELECT product_id from products WHERE
  product_name = 'Denim' and product_type='Shirt'
)

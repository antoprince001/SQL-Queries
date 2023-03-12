-- A Microsoft Azure Supercloud customer is a company which buys at least 1 product from each product category.

-- Write a query to report the company ID which is a Supercloud customer.

WITH category_contracts AS (
SELECT C.customer_id, P.product_id, P.product_category
FROM customer_contracts C INNER JOIN products P
USING (product_id)
),
prod_category_count AS (
SELECT  COUNT( DISTINCT product_category)
FROM products
)
SELECT customer_id
FROM category_contracts
GROUP BY customer_id	
HAVING COUNT( DISTINCT product_category) = (SELECT * FROM prod_category_count LIMIT 1)

;

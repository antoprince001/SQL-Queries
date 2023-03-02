-- Assume you are given the table containing information on Amazon customers and their spending on products in various categories.

-- Identify the top two highest-grossing products within each category in 2022. Output the category, product, and total spend.

WITH spend_category AS (
SELECT 
  category, 
  product,
  SUM(spend) as total_spend
FROM product_spend
WHERE extract(year from transaction_date) = 2022
GROUP BY category, product
),

top_spend AS (
SELECT *,
RANK() OVER (
PARTITION BY category
ORDER BY total_spend DESC
) AS row_n
FROM spend_category
)
SELECT category, product,total_spend
FROM top_spend
WHERE row_n <= 2
ORDER BY category, row_n;

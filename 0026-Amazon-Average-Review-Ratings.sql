-- Given the reviews table, write a query to get the average stars for each product every month.

-- The output should include the month in numerical value, product id, and average star rating rounded to two decimal places. Sort the output based on month followed by the product id.

SELECT EXTRACT(month FROM submit_date) as mth,product_id as product,ROUND(AVG(stars),2) FROM reviews
GROUP BY product,mth 
ORDER BY mth, product;

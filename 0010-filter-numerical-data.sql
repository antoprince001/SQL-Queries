-- Write a query to find the sales information with sales ID 535, 742 and 134.

SELECT * FROM sales
WHERE sales_id in ( 535,742,134 );

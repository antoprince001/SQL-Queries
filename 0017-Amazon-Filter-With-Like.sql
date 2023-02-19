-- The branch manager is looking for a male customer whose name ends with "son" and he's 20 years old. Write a query to find for this customer's details.

SELECT * FROM customers 
WHERE age = 20 and LOWER(customer_name) LIKE '%son';

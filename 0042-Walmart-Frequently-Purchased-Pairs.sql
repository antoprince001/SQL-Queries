-- Assume you are given the following tables on Walmart transactions and products. Find the number of unique product combinations that are purchased in the same transaction.

-- For example, if there are 2 transactions where apples and bananas are bought, and another transaction where bananas and soy milk are bought, my output would be 2 to represent the 2 unique combinations.


SELECT COUNT(DISTINCT CONCAT(A.product_id,B.product_id)) as unique_pairs
FROM transactions A, transactions B 
WHERE A.transaction_id =  B.transaction_id AND
A.product_id > B.product_id

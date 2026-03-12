-- Write a solution to find all customers who never order anything.

SELECT name as Customers
FROM 
Customers where id not in 
(
    SELECT DISTINCT customerId from Orders
)

SELECT c.name AS Customers
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customerId = c.id
);


SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o
    ON c.id = o.customerId
WHERE o.id IS NULL;

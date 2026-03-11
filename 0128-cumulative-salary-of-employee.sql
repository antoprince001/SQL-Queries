-- Write a solution to calculate the cumulative salary summary for every employee in a single unified table.

SELECT 
    id,
    month,
    SUM(salary) OVER (
        PARTITION BY id
        ORDER BY month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS salary
FROM employee
WHERE (id, month) NOT IN (
    SELECT id, MAX(month)
    FROM employee
    GROUP BY id
)
ORDER BY id, month DESC;


WITH cte AS (
    SELECT *,
           ROW_NUMBER() OVER(PARTITION BY id ORDER BY month DESC) AS rn
    FROM employee
)
SELECT 
    id,
    month,
    SUM(salary) OVER(
        PARTITION BY id
        ORDER BY month
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS salary
FROM cte
WHERE rn > 1
ORDER BY id, month DESC;

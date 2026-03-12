-- Write a solution to find employees who have the highest salary in each of the departments.

WITH TOP_SALARIED AS (
SELECT 
*,
RANK() OVER (PARTITION BY departmentId ORDER BY Salary DESC) as salary_rank 
FROM employee e
) 
SELECT 
d.name as Department,
e.name as Employee,
e.salary as Salary
FROM TOP_SALARIED e
INNER JOIN department d
ON e.departmentId = d.id AND e.salary_rank = 1;

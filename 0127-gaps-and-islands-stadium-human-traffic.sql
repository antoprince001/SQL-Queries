--Write a solution to display the records with three or more rows with consecutive id's, and the number of people is greater than or equal to 100 for each.
-- Gaps and Islands


SELECT id,
visit_date,
people
FROM (
SELECT
id,
visit_date,
people,
LAG(people, 2) OVER (ORDER BY id) as previous_previous_count,
LEAD(people, 2) OVER (ORDER BY id) as next_next_count,
LAG(people, 1) OVER (ORDER BY id) as previous_count,
LEAD(people, 1) OVER (ORDER BY id) as next_count
FROM 
Stadium)
WHERE (previous_previous_count >= 100
AND previous_count >= 100
AND people >= 100)
OR
(previous_count >= 100
AND people >= 100
AND next_count >= 100)
OR
(people >= 100
AND next_count >= 100
AND next_next_count >= 100)




WITH stadium_with_rnk AS
(
    SELECT id, visit_date, people, rnk, (id - rnk) AS island
    FROM (
        SELECT id, visit_date, people, RANK() OVER(ORDER BY id) AS rnk
        FROM Stadium
        WHERE people >= 100) AS t0
)
SELECT id, visit_date, people 
FROM stadium_with_rnk
WHERE island IN (SELECT island 
                 FROM stadium_with_rnk 
                 GROUP BY island 
                 HAVING COUNT(*) >= 3)
ORDER BY visit_date

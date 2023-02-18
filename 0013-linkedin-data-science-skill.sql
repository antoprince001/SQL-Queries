-- Given a table of candidates and their skills, you're tasked with finding the candidates best suited for an open Data Science job. You want to find candidates who are proficient in Python, Tableau, and PostgreSQL.

-- Write a query to list the candidates who possess all of the required skills for the job. Sort the output by candidate ID in ascending order.

WITH python_skill AS (
  SELECT * from candidates WHERE skill = 'Python'
),
tableau_skill AS (
  SELECT * from candidates WHERE skill = 'Tableau'
),
postgreSQL_skill AS (
  SELECT * from candidates WHERE skill = 'PostgreSQL'
)

select tableau_skill.candidate_id 
from python_skill inner join tableau_skill 
on python_skill.candidate_id = tableau_skill.candidate_id
inner join postgreSQL_skill 
on postgreSQL_skill.candidate_id = tableau_skill.candidate_id;



SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3
ORDER BY candidate_id;

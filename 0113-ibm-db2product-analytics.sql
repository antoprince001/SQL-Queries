-- IBM is analyzing how their employees are utilizing the Db2 database by tracking the SQL queries executed by their employees. The objective is to generate data to populate a histogram that shows the number of unique queries run by employees during the third quarter of 2023 (July to September). Additionally, it should count the number of employees who did not run any queries during this period.

-- Display the number of unique queries as histogram categories, along with the count of employees who executed that number of unique queries.
  
SELECT unique_queries, count(employee_id) FROM (

SELECT emp.employee_id, COUNT(q.query_id)  as unique_queries 
FROM employees emp left join queries q
on emp.employee_id = q.employee_id AND  q.query_starttime BETWEEN '07-01-2023 00:00:00' AND '09-30-2023 23:59:59'
group by emp.employee_id

) t
GROUP BY unique_queries
ORDER BY unique_queries

-- Write a query that calculates the difference between the highest salaries found in the marketing and engineering departments. Output just the absolute difference in salaries.

select abs(
(select  
max(salary) 
from db_employee de inner join db_dept dd on de.department_id = dd.id where department  =  'engineering')
-
(select  
max(salary) 
from db_employee de inner join db_dept dd on de.department_id = dd.id where department  =  'marketing')
) as salary_difference

with cte as (
    select department_id, max(salary) as salary
    from db_employee as e
    join db_dept as d
    on d.id = e.department_id
    where d.department in ('marketing', 'engineering')
    group by department_id
)

select max(salary)-min(salary) as salary_diff from cte

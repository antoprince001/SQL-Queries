Write an SQL query to calculate the bonus of each employee. The bonus of an employee is 100% of their salary 
if the ID of the employee is an odd number and the employee name does not start with the character 'M'. 
The bonus of an employee is 0 otherwise.

Solution:
select employee_id,salary as bonus from Employees where employee_id % 2 =  1 and name not like "M%"
union
select employee_id,0 from Employees where employee_id % 2 = 0 or name  like "M%"
order by employee_id;


select employee_id, if(employee_id%2=1 and name not like'M%', salary,0) as bonus
from Employees;

select employee_id, 
case 
    when employee_id%2 != 0 and name NOT LIKE 'M%' then salary
    else 0
end as bonus
from employees order by employee_id;


-- Compare each employee's salary with the average salary of the corresponding department.
-- Output the department, first name, and salary of employees along with the average salary of that department.

with department_avg as (select department, avg(salary) as "avg" from employee group by department)

select emp.department, emp.first_name, emp.salary, "avg" 
from employee emp inner join department_avg da on emp.department  = da.department order by department; 


SELECT 
        department, 
        first_name, 
        salary, 
        AVG(salary) over (PARTITION BY department) 
FROM employee;

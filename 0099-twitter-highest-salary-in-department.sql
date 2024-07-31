
-- Find the employee with the highest salary per department.
-- Output the department name, employee's first name along with the corresponding salary.

select department, first_name, salary  from 
employee where (department, salary) in
(select department, max(salary) as max_salary from employee
group by department)  

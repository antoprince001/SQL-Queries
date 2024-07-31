
-- Find the employee with the highest salary per department.
-- Output the department name, employee's first name along with the corresponding salary.

select department, first_name, salary  from 
employee where (department, salary) in
(select department, max(salary) as max_salary from employee
group by department)  

SELECT dept_salary.department, e.first_name, dept_salary.max_salary 
FROM 
    (SELECT department, max(salary) AS max_salary 
     FROM employee
     GROUP BY department) dept_salary 
JOIN employee e
ON e.department = dept_salary.department
AND e.salary = dept_salary.max_salary;

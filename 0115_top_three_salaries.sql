# As part of an ongoing analysis of salary distribution within the company, your manager has requested a report identifying high earners in each department. A 'high earner' within a department is defined as an employee with a salary ranking among the top three salaries within that department.
# You're tasked with identifying these high earners across all departments. Write a query to display the employee's name along with their department name and salary. In case of duplicates, sort the results of department name in ascending order, then by salary in descending order. If multiple employees have the same salary, then order them alphabetically.


SELECT department_name, name, salary
FROM (
SELECT emp.*, dept.department_name, 
dense_rank() over(partition by emp.department_id ORDER BY salary desc)
FROM employee emp 
INNER JOIN department dept
ON emp.department_id = dept.department_id
) t 
WHERE t.dense_rank <= 3
ORDER BY department_name, salary desc, name

# Imagine you're an HR analyst at a tech company tasked with analyzing employee salaries. Your manager is keen on understanding the pay distribution and asks you to determine the second highest salary among all employees.

# It's possible that multiple employees may share the same second highest salary. In case of duplicate, display the salary only once.


SELECT salary FROM (
SELECT salary, dense_rank() over (ORDER BY salary desc) AS salary_order
FROM employee
) t
WHERE t.salary_order = 2;

# since handling duplicates, dense_rank over row_number. DENSE_RANK() assigns the same rank to identical values and the next rank follows but in RANK(), it will skip the next rank number.

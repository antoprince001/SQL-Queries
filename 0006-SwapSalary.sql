Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement and no intermediate temporary tables.

Note that you must write a single update statement, do not write any select statement for this problem.

The query result format is in the following example.

 update Salary
set sex = if(sex = 'm', 'f', 'm');


Approach: Using UPDATE and CASE...WHEN [Accepted]
Algorithm

To dynamically set a value to a column, we can use UPDATE statement together when CASE...WHEN... flow control statement.

MySQL

UPDATE salary
SET
    sex = CASE sex
        WHEN 'm' THEN 'f'
        ELSE 'm'
    END;

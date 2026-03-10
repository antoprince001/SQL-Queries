-- Write a solution to delete all duplicate emails, keeping only one unique email with the smallest id.


DELETE FROM Person 
WHERE ID NOT IN (
SELECT ID FROM (
    SELECT 
        email,
        MIN(id) AS ID
    FROM Person
    GROUP BY email
)
)

DELETE FROM Person p
USING Person d
WHERE
    p.email = d.email
    AND p.id > d.id;


DELETE FROM Person
WHERE id IN (
    SELECT id
    FROM (
        SELECT 
            id,
            ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) as rn
        FROM Person
    ) t
    WHERE rn > 1
);

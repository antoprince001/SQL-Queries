-- UnitedHealth has a program called Advocate4Me, which allows members to call an advocate and receive support for their health care needs – whether that's behavioural, clinical, well-being, health care financing, benefits, claims or pharmacy help.

-- Write a query to find how many UHG members made 3 or more calls. case_id column uniquely identifies each call made.

WITH policy_callers AS (
SELECT policy_holder_id, COUNT(policy_holder_id) as calls
FROM callers
GROUP BY policy_holder_id
)

SELECT COUNT(policy_holder_id) 
FROM policy_callers
WHERE calls >= 3;

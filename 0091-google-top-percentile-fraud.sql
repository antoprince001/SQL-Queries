-- ABC Corp is a mid-sized insurer in the US and in the recent past their fraudulent claims have increased significantly for their personal auto insurance portfolio. They have developed a ML based predictive model to identify propensity of fraudulent claims. Now, they assign highly experienced claim adjusters for top 5 percentile of claims identified by the model.
-- Your objective is to identify the top 5 percentile of claims from each state. Your output should be policy number, state, claim cost, and fraud score.

WITH percentiles AS
(
  SELECT state,percentile_cont(0.05) 
  within GROUP (
   ORDER BY fraud_score DESC) AS percentile
   FROM fraud_score
   GROUP BY state
)

SELECT * from fraud_score f
where fraud_score >= (SELECT percentile from percentiles where state = f.state)


WITH percentiles AS
  (SELECT state,
          percentile_cont(0.05) within GROUP (
                                              ORDER BY fraud_score DESC) AS percentile
   FROM fraud_score
   GROUP BY state)
SELECT policy_num,
       f.state,
       claim_cost,
       fraud_score
FROM fraud_score f
JOIN percentiles p ON f.state = p.state
WHERE fraud_score >= percentile

-- join over sub query

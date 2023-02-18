-- A phone call is considered an international call when the person calling is in a different country than the person receiving the call.

-- What percentage of phone calls are international? Round the result to 1 decimal.

WITH caller_info AS(
  
  SELECT phone_calls.caller_id,receiver_id, call_time,country_id AS caller_country
  FROM phone_calls inner join phone_info 
  ON phone_calls.caller_id = phone_info.caller_id
),
receiver_info AS(
  
  SELECT phone_calls.caller_id,receiver_id, call_time,country_id AS receiver_country
  FROM phone_calls inner join phone_info 
  ON phone_calls.receiver_id = phone_info.caller_id
)
SELECT ROUND(100.0*
sum(CASE WHEN caller_country <> receiver_country THEN 1 ELSE 0 END)/
sum(CASE WHEN true THEN 1 END)
,1) 
AS international_calls_pct from caller_info inner join receiver_info
ON (caller_info.caller_id = receiver_info.caller_id AND
caller_info.receiver_id = receiver_info.receiver_id AND
caller_info.call_time = receiver_info.call_time) ;


SELECT 
  ROUND(
    100.0 * SUM(CASE
      WHEN caller.country_id <> receiver.country_id THEN 1 ELSE NULL END)
    /COUNT(*) ,1) AS international_call_pct
FROM phone_calls AS calls
LEFT JOIN phone_info AS caller
  ON calls.caller_id = caller.caller_id
LEFT JOIN phone_info AS receiver
  ON calls.receiver_id = receiver.caller_id;
  
  
WITH international_calls AS (
SELECT 
  caller.caller_id, 
  caller.country_id,
  receiver.caller_id, 
  receiver.country_id
FROM phone_calls AS calls
LEFT JOIN phone_info AS caller
  ON calls.caller_id = caller.caller_id
LEFT JOIN phone_info AS receiver
  ON calls.receiver_id = receiver.caller_id
WHERE caller.country_id <> receiver.country_id
)

SELECT 
  ROUND(
    100.0 * COUNT(*)
  / (SELECT COUNT(*) FROM phone_calls),1) AS international_call_pct
FROM international_calls;

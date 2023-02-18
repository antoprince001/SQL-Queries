-- Assume you have an events table on app analytics. Write a query to get the app’s click-through rate (CTR %) in 2022. Output the results in percentages rounded to 2 decimal places.


WITH no_of_impressions AS (
  SELECT app_id,count(*) as impressions from events WHERE event_type='impression' AND
  timestamp >= '2022-01-01' 
  AND timestamp < '2023-01-01'
  group by app_id, event_type 
  
),
no_of_clicks AS (
  SELECT app_id,count(*) as clicks from events WHERE event_type='click' AND
  timestamp >= '2022-01-01' 
  AND timestamp < '2023-01-01'
  group by app_id, event_type
)

SELECT app_id, ROUND(100.0*clicks/impressions, 2) from no_of_impressions inner join no_of_clicks using(app_id);


WITH no_of_impressions AS (
  SELECT app_id,count(*) as impressions from events WHERE event_type='impression' group by app_id, event_type
),
no_of_clicks AS (
  SELECT app_id,count(*) as clicks from events WHERE event_type='click' group by app_id, event_type
)

SELECT app_id, CAST(100.0*clicks/impressions AS DECIMAL) from no_of_impressions inner join no_of_clicks using(app_id);



SELECT
  app_id,
  ROUND(100.0 *
    SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) /
    SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END), 2)  AS ctr_rate
FROM events
WHERE timestamp >= '2022-01-01' 
  AND timestamp < '2023-01-01'
GROUP BY app_id;


SELECT
  app_id,
  ROUND(100.0 *
    COUNT(CASE WHEN event_type = 'click' THEN 1 ELSE NULL END) /
    COUNT(CASE WHEN event_type = 'impression' THEN 1 ELSE NULL END), 2)  AS ctr_rate
FROM events
WHERE timestamp >= '2022-01-01' 
  AND timestamp < '2023-01-01'
GROUP BY app_id;



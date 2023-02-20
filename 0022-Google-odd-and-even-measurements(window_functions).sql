-- Assume you are given the table containing measurement values obtained from a Google sensor over several days. Measurements are taken several times within a given day.

-- Write a query to obtain the sum of the odd-numbered and even-numbered measurements on a particular day, in two different columns. Refer to the Example Output below for the output format.


WITH window_measurements AS (SELECT 
  CAST(measurement_time AS DATE) AS measurement_day, 
  measurement_value, 
  ROW_NUMBER() OVER (
    PARTITION BY CAST(measurement_time AS DATE) 
    ORDER BY measurement_time) AS measurement_num 
FROM measurements),
even_measurements AS (
SELECT measurement_day, sum(measurement_value) AS even_sum FROM window_measurements
WHERE measurement_num%2 = 0
GROUP BY measurement_day
),
odd_measurements AS (
SELECT measurement_day, sum(measurement_value) AS odd_sum FROM window_measurements
WHERE measurement_num%2 <> 0
GROUP BY measurement_day
)

SELECT odd_measurements.measurement_day, odd_sum, even_sum from even_measurements inner JOIN
odd_measurements using(measurement_day) ORDER BY odd_measurements.measurement_day;

WITH ranked_measurements AS (
  SELECT 
    CAST(measurement_time AS DATE) AS measurement_day, 
    measurement_value, 
    ROW_NUMBER() OVER (
      PARTITION BY CAST(measurement_time AS DATE) 
      ORDER BY measurement_time) AS measurement_num 
  FROM measurements
) 

SELECT 
  measurement_day, 
  SUM(
    CASE WHEN measurement_num % 2 != 0 THEN measurement_value 
      ELSE 0 END) AS odd_sum, 
  SUM(
  CASE WHEN measurement_num % 2 = 0 THEN measurement_value 
    ELSE 0 END) AS even_sum 
FROM ranked_measurements
GROUP BY measurement_day;


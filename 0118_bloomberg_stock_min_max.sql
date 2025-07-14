-- The Bloomberg terminal is the go-to resource for financial professionals, offering convenient access to a wide array of financial datasets. As a Data Analyst at Bloomberg, you have access to historical data on stock performance.

-- Currently, you're analyzing the highest and lowest open prices for each FAANG stock by month over the years.

-- For each FAANG stock, display the ticker symbol, the month and year ('Mon-YYYY') with the corresponding highest and lowest open prices (refer to the Example Output format). Ensure that the results are sorted by ticker symbol.

SELECT t.ticker, 
TO_CHAR(t.date, 'Mon-YYYY') as highest_mth,
highest_open,
TO_CHAR(t2.date, 'Mon-YYYY') as lowest_mth,
lowest_open
FROM (
SELECT ticker,
max(open) as highest_open,
min(open) as lowest_open
FROM stock_prices
GROUP BY ticker
) gt join stock_prices t  
on t.ticker = gt.ticker and t.open = gt.highest_open
join stock_prices t2  
on t2.ticker = gt.ticker and t2.open = gt.lowest_open
ORDER BY t.ticker

WITH highest_prices AS (
  SELECT 
    ticker,
    TO_CHAR(date, 'Mon-YYYY') AS highest_mth,
    MAX(open) AS highest_open,
    ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY open DESC) AS row_num
  FROM stock_prices
  GROUP BY ticker, TO_CHAR(date, 'Mon-YYYY'), open
),
lowest_prices AS (
  SELECT 
    ticker,
    TO_CHAR(date, 'Mon-YYYY') AS lowest_mth,
    MIN(open) AS lowest_open,
    ROW_NUMBER() OVER (PARTITION BY ticker ORDER BY open) AS row_num
  FROM stock_prices
  GROUP BY ticker, TO_CHAR(date, 'Mon-YYYY'), open
)

SELECT
  highest.ticker,
  highest.highest_mth,
  highest.highest_open,
  lowest.lowest_mth,
  lowest.lowest_open
FROM highest_prices as highest
INNER JOIN lowest_prices AS lowest
  ON highest.ticker = lowest.ticker
  AND highest.row_num = 1 -- Highest open price
  AND lowest.row_num = 1 -- Lowest open price
ORDER BY highest.ticker;

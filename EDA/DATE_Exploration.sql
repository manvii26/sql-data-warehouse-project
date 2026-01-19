-- DATE exploration

-- Identify the earliest and latest dates (boundaries).
-- How many years of sales areavailable

SELECT MIN(order_date) AS first_order,
MAX(order_date) AS last_order,
DATEDIFF(YEAR, MIN(order_date),MAX(order_date)) AS year_sales
FROM gold.fact_sales

-- Find the youngest and oldest customer

SELECT MIN(birthdate) AS oldest_customer,
MAX(birthdate) AS youngest_cutomer,
DATEDIFF(YEAR, MIN(birthdate), MAX(birthdate)) AS age_range,

DATEDIFF(YEAR, MIN(birthdate), GETDATE()) AS oldest_age,
DATEDIFF(YEAR, MAX(birthdate), GETDATE()) AS oldest_age

FROM gold.dim_customers



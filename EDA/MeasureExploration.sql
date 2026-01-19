-- Measures Exploration

-- calculate the key metric of the business
-- highest level of aggregation | lowest level of details


-- Find the total sales
-- Find how many items are sold
-- Find the average selling price
-- Find the total number of orders
-- Find the total number of products
-- Find the total number of customers
-- Find the total number of customers that has placed an order

SELECT SUM(sales_amount) AS totalSales_amount
FROM gold.fact_sales

SELECT SUM(quantity) AS total_quantity_sold
FROM gold.fact_sales

SELECT AVG(price) AS avg_selling_price
FROM gold.fact_sales


SELECT COUNT( order_number) AS total_orders
FROM gold.fact_sales
SELECT COUNT( DISTINCT order_number) AS total_distinct_orders
FROM gold.fact_sales


SELECT COUNT(product_name) AS total_products
FROM gold.dim_products
SELECT COUNT(DISTINCT product_key) AS total_distinct_products
FROM gold.dim_products

SELECT COUNT(customer_key) AS total_customer
FROM gold.dim_customers

SELECT COUNT(DISTINCT customer_key) AS customer_placed_orders
FROM gold.fact_sales


-- Generate a report that shows all metrics of the business

SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 'Total Quantity', SUM(quantity) 
FROM gold.fact_sales

UNION ALL 

SELECT 'Average Price', AVG(price) 
FROM gold.fact_sales

UNION ALL

SELECT 'Total Num of Orders', COUNT(DISTINCT product_key) 
FROM gold.dim_products

UNION ALL 

SELECT 'Total Num of Products', COUNT(product_name)
FROM gold.dim_products

UNION ALL

SELECT 'Total num Of customers', COUNT(customer_key)
FROM gold.dim_customers


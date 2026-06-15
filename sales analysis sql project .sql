# Sales Analysis SQL Queries

CREATE TABLE superstore(
row_id INT,
order_id VARCHAR(50),
order_date DATE,
ship_date DATE,
ship_mode VARCHAR(50),
customer_id VARCHAR(50),
segment VARCHAR(50),
country VARCHAR(50),
city VARCHAR(100),
state_name VARCHAR(100),
region VARCHAR(50),
product_id VARCHAR(50),
category VARCHAR(50),
sub_category VARCHAR(50),
product_name TEXT,
sales NUMERIC,
quantity INT,
discount NUMERIC,
profit NUMERIC,
profit_flag VARCHAR(20),
profit_margin NUMERIC,
sales_outliers VARCHAR(20),
profit_outliers VARCHAR(20)
);

SELECT *
FROM superstore;

SELECT COUNT(*)
FROM superstore;

SELECT *
FROM superstore
LIMIT 5;

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'superstore';

SELECT SUM(sales) AS total_sales
FROM superstore;

SELECT ROUND(SUM(profit), 2) AS total_sales
FROM superstore;

SELECT COUNT(DISTINCT order_id) AS total_orders
FROM superstore
WHERE DATE_TRUNC('month', order_date) = '2016-11-01';

SELECT superstore.order_date, COUNT(DISTINCT order_id) AS total_orders
FROM superstore
WHERE DATE_TRUNC('year', order_date) = '2016-01-01'
GROUP BY 1
order by 2 DESC;

SELECT ss.order_id, COUNT(*)
FROM superstore ss
WHERE DATE_TRUNC('year', order_date) = '2016-01-01'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

SELECT DATE_TRUNC('month', order_date) AS month, COUNT(DISTINCT order_id) AS total_orders
FROM superstore
GROUP BY month
ORDER BY month;

SELECT DATE_TRUNC('year', order_date) AS year, COUNT(*) AS total_orders
FROM superstore
GROUP BY year
ORDER BY year;

SELECT DATE_TRUNC('day', order_date) AS day, superstore.order_id AS order_id, COUNT(*) AS total_orders 
FROM superstore
GROUP BY 1, 2
ORDER BY 1;

SELECT region, ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY 1
ORDER BY 2 DESC;

SELECT category, ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY 1
ORDER BY 2 DESC;

SELECT category, ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY 1
ORDER BY 2 DESC;

SELECT product_id,product_name, category, ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY 1, 2,3
ORDER BY 4 DESC
LIMIT 10;

SELECT product_id,product_name, category, ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY 1, 2,3
ORDER BY 4 DESC
LIMIT 10;

SELECT state_name, ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY 1
ORDER BY 2 DESC;

SELECT state_name, ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY 1
ORDER BY 2 DESC;

SELECT state_name, ROUND(SUM(profit), 2) AS total_loss
FROM superstore
GROUP BY 1
HAVING SUM(profit) < 0 
ORDER BY 2;

SELECT segment, ROUND(SUM(sales), 2) AS total_sales, ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;

SELECT DATE_TRUNC('month', order_date) AS month, ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY month
ORDER BY month;


SELECT DATE_TRUNC('month', order_date) AS month, ROUND(SUM(profit), 2) AS profit
FROM superstore
GROUP BY month
ORDER BY month;


SELECT superstore.category, ROUND(AVG(profit_margin)*100, 2) AS average_profit_margin
FROM superstore
GROUP BY category
ORDER BY average_profit_margin DESC;

SELECT discount, ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY discount
ORDER BY discount;

SELECT ship_mode, ROUND(AVG(ship_date - order_date), 2) AS avg_days
FROM superstore
GROUP BY 1
ORDER BY avg_days;


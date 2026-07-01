CREATE TABLE superstore (
    row_id INT,
    order_id VARCHAR(50),
    order_date DATE,
    ship_date DATE,
    ship_mode VARCHAR(50),
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postal_code VARCHAR(20),
    region VARCHAR(50),
    product_id VARCHAR(50),
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name TEXT,
    sales NUMERIC(10,2),
    quantity INT,
    discount NUMERIC(5,2),
    profit NUMERIC(10,2)
);

SELECT * FROM superstore

SELECT COUNT(*) FROM superstore
DROP TABLE IF EXISTS superstore;

SELECT *
FROM superstore
LIMIT 10;

SELECT order_date, ship_date
FROM superstore
LIMIT 5;

--Total Sales--
SELECT ROUND(SUM(sales),2) as total_sales
FROM superstore;

----Total Profit
SELECT ROUND(SUM(profit),2) as total_profit
FROM superstore;

--Total Orders
SELECT COUNT(DISTINCT order_id) as total_orders
FROM superstore;

--Average Order Value
SELECT ROUND(
 SUM(sales)/COUNT(DISTINCT order_id),2)as avg_order_value
 FROM superstore;

--Sales by category
SELECT category, ROUND(SUM(sales),2)as sales
FROM superstore
GROUP BY category
ORDER BY sales DESC;

--Profit by Category
SELECT category, ROUND(SUM(profit),2)as profit
FROM superstore
GROUP BY category
ORDER BY profit DESC;

--Top 10 Products by Sales
SELECT product_name, ROUND(SUM(sales),2)as sales
FROM superstore
GROUP BY product_name
ORDER BY sales DESC
LIMIT 10;

--Top 10 Customers
SELECT customer_name, ROUND(SUM(sales),2)as sales
FROM superstore
GROUP BY customer_name
ORDER BY sales DESC
LIMIT 10;

--Sales by Region
SELECT region, ROUND(SUM(sales),2)as sales
FROM superstore
GROUP BY region
ORDER BY sales DESC;

--Profit by Region
SELECT region, ROUND(SUM(profit),2)as profit
FROM superstore
GROUP BY region
ORDER BY profit DESC;

--Monthly Sales Trend
SELECT EXTRACT(month from order_date)as month_no,
ROUND(SUM(sales),2)as sales
FROM superstore
GROUP BY EXTRACT(month from order_date)
ORDER BY month_no ;

--Monthly Profit Trend
SELECT EXTRACT(month from order_date)as month_no,
ROUND(SUM(profit),2)as profit
FROM superstore
GROUP BY EXTRACT(month from order_date)
ORDER BY month_no ;

--Most Profitable Products
SELECT product_name, ROUND(SUM(profit),2)as profit
FROM superstore
GROUP BY product_name
ORDER BY profit DESC
LIMIT 10;

--Least Profitable Products
SELECT product_name, ROUND(SUM(profit),2)as profit
FROM superstore
GROUP BY product_name
ORDER BY profit ASC
LIMIT 10;

--Categories with Highest Discounts
SELECT category, ROUND(AVG(discount),2)as avg_discount
FROM superstore
GROUP BY category;

--Top States by Sales
SELECT state, ROUND(SUM(sales),2)as sales
FROM superstore
GROUP BY state
ORDER BY sales DESC
LIMIT 10;

--Top States by Profit
SELECT state, ROUND(SUM(profit),2)as profit
FROM superstore
GROUP BY state
ORDER BY profit DESC
LIMIT 10;

--Average Shipping Days
SELECT ROUND(A(ship_date - order_date),2)as avg_shipping_days
FROM superstore;

--Segment-wise Sales
SELECT segment, ROUND(SUM(sales),2)as sales
FROM superstore
GROUP BY segment
ORDER BY sales DESC;

--Segment-wise Profit
SELECT segment, ROUND(SUM(profit),2)as profit
FROM superstore
GROUP BY segment
ORDER BY profit DESC;

COPY superstore TO '/tmp/superstore_export.csv' WITH CSV HEADER;
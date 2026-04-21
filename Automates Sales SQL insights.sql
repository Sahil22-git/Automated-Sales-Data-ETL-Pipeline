CREATE DATABASE sales_pipeline;

USE sales_pipeline;

SELECT @@hostname;

SELECT * FROM sales_data LIMIT 10;

--  Monthly sales trend

SELECT
    `Order Year`,
    `Order Month`,
    SUM(Sales) AS total_sales
FROM sales_data
GROUP BY `Order Year`, `Order Month`
ORDER BY `Order Year`, `Order Month`;

Top 5 customers

SELECT
    `Customer Name`,
    SUM(Sales) AS total_spent
FROM sales_data
GROUP BY `Customer Name`
ORDER BY total_spent DESC
LIMIT 5;

-- Sales by region

SELECT
    Region,
    SUM(Sales) AS regional_sales
FROM sales_data
GROUP BY Region;


-- Top 10 Best-Selling Products

SELECT
    `Product Name`,
    SUM(Sales) AS total_sales
FROM sales_data
GROUP BY `Product Name`
ORDER BY total_sales DESC
LIMIT 10;

-- Yearly Sales Growth

SELECT
    `Order Year`,
    SUM(Sales) AS yearly_sales
FROM sales_data
GROUP BY `Order Year`
ORDER BY `Order Year`;

-- Average Shipping Time by Region

-- Operational performance insight

SELECT
    Region,
    AVG(`Shipping Days`) AS avg_shipping_days
FROM sales_data
GROUP BY Region;

-- Sales by Customer Segment

-- Business segmentation analysis

SELECT
    Segment,
    SUM(Sales) AS segment_sales
FROM sales_data
GROUP BY Segment;

-- Top 5 Cities by Revenue

-- Geographic performance

SELECT
    City,
    SUM(Sales) AS city_sales
FROM sales_data
GROUP BY City
ORDER BY city_sales DESC
LIMIT 5;

-- Orders with Long Shipping Delays

-- Data quality / anomaly detection

SELECT
    `Order ID`,
    `Customer Name`,
    `Shipping Days`
FROM sales_data
WHERE `Shipping Days` > 7
ORDER BY `Shipping Days` DESC;

-- Category Performance Ranking

SELECT
    Category,
    SUM(Sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(Sales) DESC) AS sales_rank
FROM sales_data
GROUP BY Category;


-- Running Total Sales

SELECT
    `Order Date`,
    SUM(Sales) OVER (ORDER BY `Order Date`) AS running_total
FROM sales_data;

-- Best Customer in Each Region

SELECT *
FROM (
    SELECT
        Region,
        `Customer Name`,
        SUM(Sales) AS total_sales,
        RANK() OVER (
            PARTITION BY Region
            ORDER BY SUM(Sales) DESC
        ) AS rnk
    FROM sales_data
    GROUP BY Region, `Customer Name`
) ranked
WHERE rnk = 1;




-- Monthly Sales Trend per Region

SELECT
    Region,
    `Order Year`,
    `Order Month`,
    SUM(Sales) AS monthly_sales
FROM sales_data
GROUP BY Region, `Order Year`, `Order Month`
ORDER BY Region, `Order Year`, `Order Month`;


SELECT 
    SUM(Sales) AS total_sales,
    AVG(`Shipping Days`) AS avg_days,
    MAX(`Shipping Days`) AS max_days
FROM sales_data;

SELECT COUNT(*) FROM sales_data;

SELECT COUNT(DISTINCT `Order ID`) FROM sales_data;

CREATE TABLE sales_data_clean AS
SELECT DISTINCT * FROM sales_data;

SELECT SUM(Sales) FROM sales_data_clean;

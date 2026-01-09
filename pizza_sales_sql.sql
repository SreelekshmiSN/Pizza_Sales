SELECT * FROM pizza_sales;
-- Find the total revenue
SELECT Sum(total_price)AS TotalRevenue
from pizza_sales;
-- Average order value
SELECT SUM(total_price)/COUNT(DISTINCT order_id) AS Averageorder_value from pizza_sales ;
-- Total pizza sold
SELECT sum(quantity) AS Total_pizza_sold from pizza_sales;
-- Total order placed
SELECT COUNT(DISTINCT order_id) AS Total_order_placed from pizza_sales;
-- Average pizza per order
SELECT cast(SUM(quantity) AS DECIMAL(10,2))/CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2))
AS Pizza_per_order FROM pizza_sales;


-- Daily trend for total orders
SELECT 
    DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d')) AS Day,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY Day
ORDER BY total_orders DESC;

-- Monthly Trend

SELECT 
    MONTHNAME(STR_TO_DATE(order_date, '%Y-%m-%d')) AS Month,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY 
    MONTH(STR_TO_DATE(order_date, '%Y-%m-%d')),
    MONTHNAME(STR_TO_DATE(order_date, '%Y-%m-%d'))
ORDER BY 
    MONTH(STR_TO_DATE(order_date, '%Y-%m-%d'));
    
-- Percentage of sales by pizza cateegory
SELECT pizza_category,SUM(total_price) AS Total_sales,SUM(total_price)*100 / (SELECT SUM(total_price) from pizza_sales) AS PCT
from pizza_sales
GROUP BY pizza_category;

-- Best Revenue pizza
SELECT pizza_name,SUM(total_price) AS Total_Revenue from pizza_sales
GROUP BY pizza_name ORDER BY Total_Revenue DESC LIMIT 5;


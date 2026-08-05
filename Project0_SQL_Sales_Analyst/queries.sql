-- ============================================================
-- SQL Sales Analyst — Mini Project 0 Queries
-- Database Engine: SQLite
-- Table Name: train
-- ============================================================

-- 1. Distinct Product Categories
SELECT DISTINCT Category 
FROM train;

-- 2. Top 5 Highest-Value Single Transactions
SELECT City, `Customer Name`, Sales 
FROM train 
ORDER BY Sales DESC 
LIMIT 5;

-- 3. Order Count by Shipping Mode
SELECT `Ship Mode`, COUNT(DISTINCT `Order ID`) AS Order_Count 
FROM train 
GROUP BY `Ship Mode`;

-- 4. Regional Sales Breakdown
SELECT Region, SUM(Sales) AS Total_Sales 
FROM train 
GROUP BY Region 
ORDER BY Total_Sales DESC;

-- 5. Sales Breakdown by Category and Sub-Category
SELECT Category, `Sub-Category`, SUM(Sales) AS Total_Sales 
FROM train 
GROUP BY Category, `Sub-Category` 
ORDER BY Category, Total_Sales DESC;

-- 6. High-Value Customers (> $10,000 Total Spent)
SELECT `Customer Name`, SUM(Sales) AS Total_Sales 
FROM train 
GROUP BY `Customer Name` 
HAVING Total_Sales > 10000 
ORDER BY Total_Sales DESC;

-- 7. Yearly Sales Trend Analysis
SELECT SUBSTR(`Order Date`, 7, 4) AS Year, SUM(Sales) AS Total_Sales 
FROM train 
GROUP BY Year 
ORDER BY Year ASC;

-- 8. Percentage Revenue Share per Region
SELECT Region, 
       SUM(Sales) AS Regional_Sales,
       ROUND(SUM(Sales) * 100.0 / (SELECT SUM(Sales) FROM train), 2) AS Market_Share_Pct 
FROM train 
GROUP BY Region;

-- 9. Top 3 Selling Products per Region (Window Function CTE)
WITH RankedProducts AS (
    SELECT Region, 
           `Product Name`, 
           SUM(Sales) AS Total_Sales,
           ROW_NUMBER() OVER(PARTITION BY Region ORDER BY SUM(Sales) DESC) AS Rank
    FROM train 
    GROUP BY Region, `Product Name`
)
SELECT Region, `Product Name`, Total_Sales 
FROM RankedProducts 
WHERE Rank <= 3;

-- 10. Customer Segmentation into Sales Quartiles (NTILE Windowing)
SELECT `Customer Name`, 
       SUM(Sales) AS Total_Sales,
       NTILE(4) OVER (ORDER BY SUM(Sales) DESC) AS Sales_Quartile
FROM train 
GROUP BY `Customer Name`;

-- Country Sales Analysis

USE gta6_analysis;

-- View Complete Dataset
SELECT *
FROM country_sales;

-- Top 5 Countries by Copies Sold
SELECT
    Country,
    Copies_Sold_Million
FROM country_sales
ORDER BY Copies_Sold_Million DESC
LIMIT 5;

-- Top 5 Countries by Revenue
SELECT
    Country,
    Revenue_INR_Crore
FROM country_sales
ORDER BY Revenue_INR_Crore DESC
LIMIT 5;

-- Revenue by Region
SELECT
    Region,
    SUM(Revenue_INR_Crore) AS Total_Revenue
FROM country_sales
GROUP BY Region
ORDER BY Total_Revenue DESC;

-- Copies Sold by Region
SELECT
    Region,
    SUM(Copies_Sold_Million) AS Total_Copies_Sold
FROM country_sales
GROUP BY Region
ORDER BY Total_Copies_Sold DESC;

-- Average Market Share by Region
SELECT
    Region,
    ROUND(AVG(Market_Share_Percent),2) AS Avg_Market_Share
FROM country_sales
GROUP BY Region
ORDER BY Avg_Market_Share DESC;

-- Country with Highest Market Share
SELECT
    Country,
    Market_Share_Percent
FROM country_sales
ORDER BY Market_Share_Percent DESC
LIMIT 1;

-- Total Global Copies Sold
SELECT
    SUM(Copies_Sold_Million) AS Total_Global_Copies
FROM country_sales;

-- Total Global Revenue
SELECT
    SUM(Revenue_INR_Crore) AS Total_Global_Revenue
FROM country_sales;

-- End of Country Sales Analysis
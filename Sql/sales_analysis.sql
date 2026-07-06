-- GTA VI Data Analysis Project
-- Module 3 : GTA V Sales Analysis

-- Objective
-- Analyze GTA V historical sales and revenue performance.


-- Question 1 : View Complete Dataset

SELECT *
FROM gta5_sales;


-- Question 2 : Total Copies Sold

SELECT
    MAX(copies_sold_million) AS total_copies_sold_million
FROM gta5_sales;


-- Question 3 : Total Revenue Generated

SELECT
    MAX(revenue_inr_crore) AS total_revenue_inr_crore
FROM gta5_sales;


-- Question 4 : Year with Highest Revenue

SELECT
    year,
    revenue_inr_crore
FROM gta5_sales
ORDER BY revenue_inr_crore DESC
LIMIT 1;


-- Question 5 : Top 5 Revenue Years

SELECT
    year,
    revenue_inr_crore
FROM gta5_sales
ORDER BY revenue_inr_crore DESC
LIMIT 5;


-- Question 6 : Sales Timeline

SELECT
    year,
    copies_sold_million
FROM gta5_sales
ORDER BY year;


-- Question 7 : Revenue Timeline

SELECT
    year,
    revenue_inr_crore
FROM gta5_sales
ORDER BY year;


-- Question 8 : Revenue Category

SELECT
    year,
    revenue_inr_crore,
    CASE
        WHEN revenue_inr_crore >= 70000 THEN 'Very High'
        WHEN revenue_inr_crore >= 50000 THEN 'High'
        WHEN revenue_inr_crore >= 30000 THEN 'Medium'
        ELSE 'Low'
    END AS revenue_category
FROM gta5_sales;


-- Question 9 : Revenue Rank

SELECT
    year,
    revenue_inr_crore,
    RANK() OVER(ORDER BY revenue_inr_crore DESC) AS revenue_rank
FROM gta5_sales;


-- Question 10 : Running Total Revenue

SELECT
    year,
    revenue_inr_crore,
    SUM(revenue_inr_crore)
    OVER(ORDER BY year) AS running_total
FROM gta5_sales;


-- Question 11 : Average Revenue

SELECT
    ROUND(AVG(revenue_inr_crore),2) AS average_revenue
FROM gta5_sales;


-- Question 12 : Average Copies Sold

SELECT
    ROUND(AVG(copies_sold_million),2) AS average_copies_sold
FROM gta5_sales;


-- End of GTA V Sales Analysis
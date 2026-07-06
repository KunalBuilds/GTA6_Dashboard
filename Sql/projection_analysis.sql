-- GTA VI Data Analysis Project
-- Module 4 : GTA VI Sales Projection Analysis

-- Objective
-- Analyze projected GTA VI sales under different launch scenarios.


-- Question 1 : View Complete Dataset

SELECT *
FROM gta6_projection;


-- Question 2 : Highest Projected Revenue

SELECT
    scenario,
    expected_revenue_inr_crore
FROM gta6_projection
ORDER BY expected_revenue_inr_crore DESC;


-- Question 3 : Highest Expected Copies Sold

SELECT
    scenario,
    expected_copies_sold_million
FROM gta6_projection
ORDER BY expected_copies_sold_million DESC;


-- Question 4 : Average Projected Revenue

SELECT
    ROUND(AVG(expected_revenue_inr_crore),2) AS average_projected_revenue
FROM gta6_projection;


-- Question 5 : Average Expected Copies Sold

SELECT
    ROUND(AVG(expected_copies_sold_million),2) AS average_expected_sales
FROM gta6_projection;


-- Question 6 : Revenue Category

SELECT
    scenario,
    expected_revenue_inr_crore,

    CASE

        WHEN expected_revenue_inr_crore >= 25000 THEN 'Excellent'

        WHEN expected_revenue_inr_crore >= 20000 THEN 'Very Good'

        ELSE 'Good'

    END AS revenue_category

FROM gta6_projection;


-- Question 7 : Revenue Ranking

SELECT
    scenario,
    expected_revenue_inr_crore,

    RANK() OVER(
        ORDER BY expected_revenue_inr_crore DESC
    ) AS revenue_rank

FROM gta6_projection;


-- Question 8 : Compare Selling Price

SELECT
    scenario,
    average_selling_price_inr
FROM gta6_projection;


-- Question 9 : Launch Year

SELECT
    scenario,
    launch_year
FROM gta6_projection;


-- Question 10 : Scenario Summary

SELECT
    scenario,
    expected_copies_sold_million,
    expected_revenue_inr_crore,
    average_selling_price_inr
FROM gta6_projection
ORDER BY expected_revenue_inr_crore DESC;


-- End of GTA VI Projection Analysis
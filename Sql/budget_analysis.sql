-- Budget Analysis Queries
-- Objectives: Compare GTA V vs GTA VI estimated development, marketing, and total budgets.

USE gta6_analysis;

-- 1. View Complete Budget Dataset
SELECT *
FROM budget;

-- 2. Compare Total Budget (USD and INR)
SELECT
    Game,
    Total_Budget_USD_Million,
    Total_Budget_INR_Crore
FROM budget;

-- 3. Calculate Budget Development-to-Marketing Split Ratio
SELECT
    Game,
    Development_Budget_USD_Million,
    Marketing_Budget_USD_Million,
    ROUND(Development_Budget_USD_Million * 100.0 / Total_Budget_USD_Million, 2) AS Dev_Budget_Share_Percent,
    ROUND(Marketing_Budget_USD_Million * 100.0 / Total_Budget_USD_Million, 2) AS Mkt_Budget_Share_Percent
FROM budget;

-- 4. Calculate Budget Growth Factor (GTA VI Budget vs GTA V)
SELECT
    (SELECT Total_Budget_USD_Million FROM budget WHERE Game = 'GTA VI') / 
    (SELECT Total_Budget_USD_Million FROM budget WHERE Game = 'GTA V') AS USD_Budget_Growth_Multiplier,
    (SELECT Total_Budget_INR_Crore FROM budget WHERE Game = 'GTA VI') / 
    (SELECT Total_Budget_INR_Crore FROM budget WHERE Game = 'GTA V') AS INR_Budget_Growth_Multiplier;

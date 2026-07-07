-- Pre-orders and Day One Booking Analysis
-- Objectives: Compare copies sold and revenue generated through pre-orders and launch day.

USE gta6_analysis;

-- 1. View Complete Preorders Dataset
SELECT *
FROM preorders;

-- 2. Compare Preorders and Day One Copies Sold (Millions)
SELECT
    Game,
    Preorders_Million,
    Launch_Day_Sales_Million,
    (Launch_Day_Sales_Million - Preorders_Million) AS Day_One_Organic_Sales_Million
FROM preorders;

-- 3. Compare Preorder and Day One Revenue (INR Crore)
SELECT
    Game,
    Preorders_Million,
    Preorder_Revenue_INR_Crore,
    -- Compute average implied pre-order price in INR
    ROUND((Preorder_Revenue_INR_Crore * 10.0) / Preorders_Million, 0) AS Implied_Preorder_Selling_Price_INR
FROM preorders;

-- 4. Calculate Expected Growth in Pre-orders for GTA VI vs GTA V
SELECT
    (SELECT Preorders_Million FROM preorders WHERE Game = 'GTA VI') / 
    (SELECT Preorders_Million FROM preorders WHERE Game = 'GTA V') AS Preorders_Growth_Multiplier,
    (SELECT Launch_Day_Sales_Million FROM preorders WHERE Game = 'GTA VI') / 
    (SELECT Launch_Day_Sales_Million FROM preorders WHERE Game = 'GTA V') AS Launch_Day_Copies_Growth_Multiplier;

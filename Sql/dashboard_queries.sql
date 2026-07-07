-- GTA V vs GTA VI Intelligence Dashboard queries
-- This script contains queries that support the KPI cards, charts, and visualizations on the interactive dashboard.

USE gta6_analysis;

-- ═══════════════════════════════════════════════════════════════
-- SECTION 1: HYPE & ENGAGEMENT TAB
-- ═══════════════════════════════════════════════════════════════

-- 1. KPI: GTA VI YouTube Trailer Views
SELECT 
    Views / 1000000.0 AS Trailer_Views_Million
FROM youtube_data
WHERE Game = 'GTA VI';

-- 2. KPI: GTA VI Peak Search Interest (from Google Trends)
SELECT 
    MAX(VI_Interest) AS Peak_Search_Interest_Index,
    (SELECT Date FROM google_trends WHERE VI_Interest = (SELECT MAX(VI_Interest) FROM google_trends)) AS Peak_Week
FROM google_trends;

-- 3. KPI: Social Media Multiplier (Overall Social Media Ratio GTA VI / GTA V)
SELECT 
    Platform,
    Value AS GTA_VI_Value,
    (SELECT Value FROM social_media WHERE Platform = s.Platform AND Game = 'GTA V') AS GTA_V_Value,
    ROUND(Value / (SELECT Value FROM social_media WHERE Platform = s.Platform AND Game = 'GTA V'), 2) AS Social_Buzz_Multiplier
FROM social_media s
WHERE Game = 'GTA VI';

-- 4. Chart: Trailer Views, Likes & Comments Comparison
SELECT 
    Game,
    Views,
    Likes,
    Comments,
    ROUND((Likes + Comments) * 100.0 / Views, 2) AS Engagement_Rate_Percent
FROM youtube_data;

-- 5. Chart: Weekly Google Trends Interest (Filter range or view all)
SELECT 
    Date,
    V_Interest AS GTA_V_Interest,
    VI_Interest AS GTA_VI_Interest
FROM google_trends
ORDER BY Date;


-- ═══════════════════════════════════════════════════════════════
-- SECTION 2: FINANCIALS & BUDGETS TAB
-- ═══════════════════════════════════════════════════════════════

-- 6. KPI: GTA V Total Sales (Million Copies)
SELECT 
    Copies_Sold_Million
FROM gta5_sales
WHERE Year = 2025; -- Cumulative up to recent historical estimates

-- 7. KPI: GTA V Cumulative Revenue (INR Crore)
SELECT 
    Revenue_INR_Crore
FROM gta5_sales
WHERE Year = 2025;

-- 8. KPI: GTA VI Total Estimated Budget (INR Crore)
SELECT 
    Total_Budget_INR_Crore
FROM budget
WHERE Game = 'GTA VI';

-- 9. Chart: Budget Breakdown (Development vs. Marketing)
SELECT 
    Game,
    Development_Budget_USD_Million,
    Marketing_Budget_USD_Million,
    Total_Budget_USD_Million
FROM budget;

-- 10. Chart: Pre-Orders and Launch Day Performance
SELECT 
    Game,
    Preorders_Million,
    Launch_Day_Sales_Million,
    Preorder_Revenue_INR_Crore
FROM preorders;


-- ═══════════════════════════════════════════════════════════════
-- SECTION 3: PROJECTIONS & FORECASTS TAB
-- ═══════════════════════════════════════════════════════════════

-- 11. KPI: GTA VI First Year Projected Sales & Revenue (Scenario Switching)
-- Match the 3 scenarios: Conservative, Expected, Optimistic
SELECT 
    Scenario,
    Expected_Copies_Sold_Million,
    Expected_Revenue_INR_Crore,
    Remarks
FROM gta6_projection;

-- 12. Chart: Top 10 Countries by Projected Copies Sold
SELECT 
    Country,
    Region,
    Copies_Sold_Million,
    Revenue_INR_Crore,
    Market_Share_Percent
FROM country_sales
ORDER BY Copies_Sold_Million DESC
LIMIT 10;

-- 13. Map: Regional Shares
SELECT 
    Region,
    SUM(Copies_Sold_Million) AS Total_Projected_Copies_Million,
    SUM(Revenue_INR_Crore) AS Total_Projected_Revenue_INR_Crore,
    ROUND(AVG(Market_Share_Percent), 2) AS Avg_Market_Share_Percent
FROM country_sales
GROUP BY Region
ORDER BY Total_Projected_Copies_Million DESC;

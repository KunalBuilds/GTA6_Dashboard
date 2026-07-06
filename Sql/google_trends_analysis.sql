-- GTA VI Data Analysis Project
-- Module 2 : Google Trends Analysis

-- Objective
-- Compare worldwide Google search interest between GTA V and GTA VI.


-- Question 1 : View Complete Dataset

SELECT *
FROM google_trends;


-- Question 2 : Highest Search Interest for GTA V

SELECT
    MAX(`Grand Theft Auto V`) AS highest_gta_v_interest
FROM google_trends;


-- Question 3 : Highest Search Interest for GTA VI

SELECT
    MAX(`Grand Theft Auto VI`) AS highest_gta_vi_interest
FROM google_trends;


-- Question 4 : Average Search Interest

SELECT
    ROUND(AVG(`Grand Theft Auto V`),2) AS avg_gta_v,
    ROUND(AVG(`Grand Theft Auto VI`),2) AS avg_gta_vi
FROM google_trends;


-- Question 5 : Total Search Interest

SELECT
    SUM(`Grand Theft Auto V`) AS total_gta_v,
    SUM(`Grand Theft Auto VI`) AS total_gta_vi
FROM google_trends;


-- Question 6 : Week with Highest GTA VI Interest

SELECT *
FROM google_trends
ORDER BY `Grand Theft Auto VI` DESC
LIMIT 1;


-- Question 7 : Week with Highest GTA V Interest

SELECT *
FROM google_trends
ORDER BY `Grand Theft Auto V` DESC
LIMIT 1;


-- Question 8 : Difference in Search Interest

SELECT
    date,
    (`Grand Theft Auto VI` - `Grand Theft Auto V`) AS interest_difference
FROM google_trends;


-- Question 9 : Weeks Where GTA VI Was More Popular

SELECT *
FROM google_trends
WHERE `Grand Theft Auto VI` > `Grand Theft Auto V`;


-- Question 10 : Weeks Where GTA V Was More Popular

SELECT *
FROM google_trends
WHERE `Grand Theft Auto V` > `Grand Theft Auto VI`;


-- Question 11 : GTA VI Search Interest Above 90

SELECT *
FROM google_trends
WHERE `Grand Theft Auto VI` >= 90;


-- Question 12 : Ranking by GTA VI Search Interest

SELECT
    date,
    `Grand Theft Auto VI`,
    RANK() OVER(ORDER BY `Grand Theft Auto VI` DESC) AS search_rank
FROM google_trends;


-- End of Google Trends Analysis
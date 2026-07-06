-- GTA VI Data Analysis Project
-- Module 1 : YouTube Trailer Analysis


-- Question 1 : View Complete YouTube Dataset

SELECT *
FROM youtube_data;


-- Question 2 : Which trailer has the highest number of views?

SELECT
    game,
    views
FROM youtube_data
ORDER BY views DESC;


-- Question 3 : Which trailer has the highest number of likes?

SELECT
    game,
    likes
FROM youtube_data
ORDER BY likes DESC;


-- Question 4 : Which trailer has the highest number of comments?

SELECT
    game,
    comments
FROM youtube_data
ORDER BY comments DESC;


-- Question 5 : Calculate Total Engagement

SELECT
    game,
    likes,
    comments,
    (likes + comments) AS total_engagement
FROM youtube_data;


-- Question 6 : Display Trailer Release Date

SELECT
    game,
    published_date
FROM youtube_data;


-- Question 7 : Display Trailer Duration

SELECT
    game,
    duration
FROM youtube_data;


-- Question 8 : Display Upload Channel

SELECT
    game,
    channel
FROM youtube_data;


-- Question 9 : Complete Details of the Most Viewed Trailer

SELECT *
FROM youtube_data
ORDER BY views DESC
LIMIT 1;


-- Question 10 : Complete Summary Report

SELECT
    game,
    views,
    likes,
    comments,
    (likes + comments) AS total_engagement,
    published_date,
    duration
FROM youtube_data;


-- Question 11 : Difference in Views Between GTA VI and GTA V

SELECT
    MAX(views) - MIN(views) AS views_difference
FROM youtube_data;


-- Question 12 : Difference in Likes Between GTA VI and GTA V

SELECT
    MAX(likes) - MIN(likes) AS likes_difference
FROM youtube_data;


-- Question 13 : Difference in Comments Between GTA VI and GTA V

SELECT
    MAX(comments) - MIN(comments) AS comments_difference
FROM youtube_data;


-- Question 14 : Rank Trailers by Views

SELECT
    game,
    views,
    RANK() OVER (ORDER BY views DESC) AS view_rank
FROM youtube_data;


-- Question 15 : Rank Trailers by Likes

SELECT
    game,
    likes,
    RANK() OVER (ORDER BY likes DESC) AS like_rank
FROM youtube_data;


-- Question 16 : Rank Trailers by Comments

SELECT
    game,
    comments,
    RANK() OVER (ORDER BY comments DESC) AS comment_rank
FROM youtube_data;


-- Question 17 : View to Like Ratio

SELECT
    game,
    ROUND(views * 1.0 / likes, 2) AS view_like_ratio
FROM youtube_data;


-- Question 18 : Like Percentage

SELECT
    game,
    ROUND((likes * 100.0 / views), 2) AS like_percentage
FROM youtube_data;


-- Question 19 : Comment Percentage

SELECT
    game,
    ROUND((comments * 100.0 / views), 2) AS comment_percentage
FROM youtube_data;


-- Question 20 : Engagement Percentage

SELECT
    game,
    ROUND(((likes + comments) * 100.0 / views), 2) AS engagement_percentage
FROM youtube_data;


-- End of YouTube Analysis
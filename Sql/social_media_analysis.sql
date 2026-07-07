-- Social Media Engagement Analysis
-- Objectives: Compare fan community size and hashtag popularity across major platforms.

USE gta6_analysis;

-- 1. View Complete Social Media Dataset
SELECT *
FROM social_media;

-- 2. Compare Reddit Community Size
SELECT
    Game,
    Value AS Subscribers_Million
FROM social_media
WHERE Platform = 'Reddit' AND Metric = 'Subscribers';

-- 3. Compare Twitter/X Trailer Likes
SELECT
    Game,
    Value AS Trailer_Likes_Million
FROM social_media
WHERE Platform = 'X (Twitter)' AND Metric = 'Trailer Likes';

-- 4. Compare Instagram Reels Popularity
SELECT
    Game,
    Value AS Reels_Views_Billion
FROM social_media
WHERE Platform = 'Instagram Reels' AND Metric = 'Reels Views';

-- Explanation:
-- This is the same question as problem #3 in the SQL Chapter of Ace the Data Science Interview!

-- Assume you're given the table on user viewership categorised by device type where the three types are laptop, tablet, and phone.

-- Write a query that calculates the total viewership for laptops and mobile devices where mobile is defined as the
--  sum of tablet and phone viewership. Output the total viewership for laptops as laptop_reviews and the total viewership 
--  for mobile devices as mobile_views.

-- Table:
-- user_id	  device_type	view_time
-- 123	      tablet    	01/02/2022 00:00:00
-- 125	      laptop	    01/07/2022 00:00:00
-- 128	      laptop	    02/09/2022 00:00:00


-- Solution:
-- SELECT 
--   SUM(CASE WHEN device_type ='laptop' THEN 1 ELSE 0 END) AS laptop_views,
--   SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views
-- FROM viewership
-- ;



SELECT 
  COUNT(*) FILTER (WHERE device_type = 'laptop') AS laptop_views,
  COUNT(*) FILTER (WHERE device_type IN ('tablet', 'phone'))  AS mobile_views 
FROM viewership;


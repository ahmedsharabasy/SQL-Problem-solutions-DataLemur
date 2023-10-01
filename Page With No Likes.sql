-- Explanation:
-- Assume you're given two tables containing data about Facebook Pages and their respective likes (as in "Like a Facebook Page").
-- Write a query to return the IDs of the Facebook pages that have zero likes. 
-- The output should be sorted in ascending order based on the page IDs.


-- Table 1:
-- page_id	page_name
-- 20001	SQL Solutions
-- 20045	Brain Exercises
-- 20701	Tips for Data Analysts


-- Table 2:
-- user_id	page_id	   liked_date
-- 111	20001	       04/08/2022 00:00:00
-- 121	20045	       03/12/2022 00:00:00
-- 156	20001	       07/25/2022 00:00:00


-- Example Output:
-- page_id
-- 20701


-- Solution:
SELECT page_id 
FROM pages
WHERE page_id NOT IN (
SELECT page_id 
FROM page_likes
)
;

-- SELECT page_id 
-- FROM pages as p
-- LEFT JOIN page_likes as pl
-- ON p.page_id = pl.page_id
-- WHERE pl.page_id IS NULL
-- ;

-- SELECT page_id 
-- FROM pages
-- WHERE NOT EXISTS (
-- SELECT page_id 
-- FROM page_likes
-- WHERE pages.page_id = page_likes.page_id
-- );

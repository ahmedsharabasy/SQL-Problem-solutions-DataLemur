-- Explanation:
-- Based on the example output, there are two users who posted only one tweet in 2022,
-- and one user who posted two tweets in 2022. The query groups the users by the 
-- number of tweets they posted and displays the number of users in each group.

-- Table:
-- tweet_id	user_id	 msg	                                                            tweet_date
-- 214252  111	     Am considering taking Tesla private at $420. Funding secured.    	12/30/2021 00:00:00
-- 739252   111   	 Despite the constant negative press covfefe	                    01/01/2022 00:00:00
-- 846402  	111	     Following @NickSinghTech on Twitter changed my life!             	02/14/2022 00:00:00
-- 241425  	254	     If the salary is so competitive why won’t you tell me what it is?	03/01/2022 00:00:00
-- 231574  	148	     I no longer have a manager. I can't be managed	                    03/23/2022 00:00:00

-- Example Output:
-- tweet_bucket 	users_num
-- 1	            2
-- 2            	1


-- Solution:
SELECT tweet_bucket ,COUNT(user_id) as users_num
FROM ( 
SELECT COUNT(tweet_id) as tweet_bucket , user_id
FROM tweets
where tweet_date BETWEEN '2022-1-1' and '2022-12-31'
GROUP BY user_id) as tweets_count
GROUP BY tweet_bucket;

------------


WITH Histgram_tweets_CTE AS(
SELECT COUNT(tweet_id) as tweet_bucket , user_id
FROM tweets
where tweet_date BETWEEN '2022-1-1' and '2022-12-31'
GROUP BY user_id)
SELECT tweet_bucket ,COUNT(user_id) as users_num
FROM Histgram_tweets_CTE
GROUP BY tweet_bucket;

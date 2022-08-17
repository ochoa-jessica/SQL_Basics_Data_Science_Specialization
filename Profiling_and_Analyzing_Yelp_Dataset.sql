--Profiling and Analyzing the Yelp Dataset Coursera Worksheet
--Jessica J Ochoa 

--This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.
--In th
--For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
--In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.

-- Part 1: Yelp Dataset Profiling and Understanding
-- 1. Profile the data by finding the total number of records for each of the tables below:

SELECT COUNT(*) AS total_records
FROM attribute;

SELECT COUNT(*) AS total_records
FROM business;

SELECT COUNT(*) AS total_records
FROM category;

SELECT COUNT(*) AS total_records
FROM checkin;

SELECT COUNT(*) AS total_records
FROM elite_years;

SELECT COUNT(*) AS total_records
FROM friend;

SELECT COUNT(*) AS total_records
FROM hours;

SELECT COUNT(*) AS total_records
FROM photo;

SELECT COUNT(*) AS total_records
FROM review;

SELECT COUNT(*) AS total_records
FROM tip;

SELECT COUNT(*) AS total_records
FROM user;

--i. Attribute table = 10000
--ii. Business table = 10000
--iii. Category table = 10000
--iv. Checkin table = 10000
--v. elite_years table = 10000 
--vi. friend table = 10000 
--vii. hours table = 10000 
--viii. photo table = 10000 
--ix. review table = 10000 
--x. tip table = 10000 
--xi. user table = 10000

--2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

SELECT COUNT(DISTINCT id) as total_records
FROM business; 

SELECT COUNT(DISTINCT business_id) as total_records
FROM hours;

SELECT COUNT(DISTINCT business_id) as total_records
FROM category;

SELECT COUNT(DISTINCT business_id) as total_records
FROM attribute;

SELECT COUNT(DISTINCT id)  AS total_records
FROM review;

SELECT COUNT(DISTINCT business_id)  AS total_records
FROM checkin;

SELECT COUNT(DISTINCT id)  AS total_records
FROM photo;

SELECT COUNT(DISTINCT user_id)  AS total_records
FROM tip;

SELECT COUNT(DISTINCT id)  AS total_records
FROM user;

SELECT COUNT(DISTINCT user_id)  AS total_records
FROM friend;

SELECT COUNT(DISTINCT user_id)  AS total_records
FROM elite_years;

--i. Business = 10000
--ii. Hours = 1562 
--iii. Category = 2643
--iv. Attribute =  1115 
--v. Review = 10000 
--vi. Checkin = 493
--vii. Photo = 10000 
--viii. Tip = 537
--ix. User = 10000
--x. Friend = 11
--xi. Elite_years = 2780

--3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

--SQL code used to arrive at answer:
SELECT COUNT(*)
FROM user
WHERE id IS NULL OR  
name IS NULL OR  
review_count IS NULL OR  
yelping_since IS NULL OR  
useful IS NULL OR  
funny IS NULL OR  
cool IS NULL OR  
fans IS NULL OR  
average_stars IS NULL OR  
compliment_hot IS NULL OR  
compliment_more IS NULL OR  
compliment_profile IS NULL OR  
compliment_cute IS NULL OR  
compliment_list IS NULL OR  
compliment_note IS NULL OR  
compliment_plain IS NULL OR  
compliment_cool IS NULL OR  
compliment_funny IS NULL OR  
compliment_writer IS NULL OR  
compliment_photos IS NULL;
--Answer: no

--4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

--i. Table: Review, Column: Stars

	SELECT 
        MIN(stars), 
        MAX(stars), 
        AVG(stars)
	FROM review;
	
    --min: 1	max: 5	avg: 3.7082
	
--ii. Table: Business, Column: Stars

	SELECT 
        MIN(stars), 
        MAX(stars), 
        AVG(stars)
	FROM business;

	--min: 1.0	 max: 5.0 avg: 3.6549	
	
--iii. Table: Tip, Column: Likes

    SELECT 
        MIN(likes), 
        MAX(likes), 
        AVG(likes)
	FROM tip;
	
	--min: 0	max: 2	avg: 0.0144	
	
--iv. Table: Checkin, Column: Count

	SELECT 
        MIN(count), 
        MAX(count), 
        AVG(count)
	FROM checkin;

	--min: 1	max: 53	avg: 1.9414
	
--v. Table: User, Column: Review_count

	SELECT 
        MIN(review_count), 
        MAX(review_count), 
        AVG(review_count)
	FROM user;

	--min: 0	max: 2000 avg: 24.2995

--5. List the cities with the most reviews in descending order:

--SQL code used to arrive at answer:

SELECT city, SUM(review_count) AS total_reviews
FROM business 
GROUP BY city
ORDER BY total_reviews DESC;

--Copy and Paste the Result Below:
--+-----------------+---------------+
--| city            | total_reviews |
--+-----------------+---------------+
--| Las Vegas       |         82854 |
--| Phoenix         |         34503 |
--| Toronto         |         24113 |
--| Scottsdale      |         20614 |
--| Charlotte       |         12523 |
--| Henderson       |         10871 |
--| Tempe           |         10504 |
--| Pittsburgh      |          9798 |
--| Montréal        |          9448 |
--| Chandler        |          8112 |
--| Mesa            |          6875 |
--| Gilbert         |          6380 |
--| Cleveland       |          5593 |
--| Madison         |          5265 |
--| Glendale        |          4406 |
--| Mississauga     |          3814 |
--| Edinburgh       |          2792 |
--| Peoria          |          2624 |
--| North Las Vegas |          2438 |
--| Markham         |          2352 |
--| Champaign       |          2029 |
--| Stuttgart       |          1849 |
--| Surprise        |          1520 |
--| Lakewood        |          1465 |
--| Goodyear        |          1155 |
--+-----------------+---------------+

--6. Find the distribution of star ratings to the business in the following cities:

--i. Avon

    --SQL code used to arrive at answer:

    SELECT 
        stars, 
        SUM(review_count) AS count
    FROM business
    WHERE city = 'Avon'
    GROUP BY stars;

    --Copy and Paste the Resulting Table Below (2 columns – star rating and count):
    
    --+-------+-------+
    --| stars | count |
    --+-------+-------+
    --|   1.5 |    10 |
    --|   2.5 |     6 |
    --|   3.5 |    88 |
    --|   4.0 |    21 |
    --|   4.5 |    31 |
    --|   5.0 |     3 |
    --+-------+-------+

--ii. Beachwood

    --SQL code used to arrive at answer:

    SELECT 
        stars, 
        SUM(review_count) AS count
    FROM business
    WHERE city = 'Beachwood'
    GROUP BY stars;

    --Copy and Paste the Resulting Table Below (2 columns – star rating and count):
    
    --+-------+-------+
    --| stars | count |
    --+-------+-------+
    --|   2.0 |     8 |
    --|   2.5 |     3 |
    --|   3.0 |    11 |
    --|   3.5 |     6 |
    --|   4.0 |    69 |
    --|   4.5 |    17 |
    --|   5.0 |    23 |
    --+-------+-------+

-- 7. Find the top 3 users based on their total number of reviews:

--SQL code used to arrive at answer:

SELECT 
    name,
    SUM(review_count) AS total_num_reviews
FROM user
GROUP BY id
ORDER BY total_num_reviews DESC
LIMIT 3;
		
--Copy and Paste the Result Below:

--+--------+-------------------+
--| name   | total_num_reviews |
--+--------+-------------------+
--| Gerald |              2000 |
--| Sara   |              1629 |
--| Yuri   |              1339 |
--+--------+-------------------+

-- 8. Does posing more reviews correlate with more fans?

-- Based on the SQL query result in the table below, we can see Gerald with a total of 2000 	  reviews has 253 fans, that is an average of 7 fans per review. On the other hand, Sara with a total of 1629 reviews has 50 fans, that us an average of 32 fans per review. Therefore, we can conclude that posing more reviews does not correlate with more fans.	

--SQL code used to arrive at answer:
SELECT 
    name, 
    SUM(review_count) AS total_review, 
    fans, 
    SUM(review_count)/fans AS avg_review_per_fan
FROM user
GROUP BY id
ORDER BY total_review DESC;

--Copy and Paste the Result Below:
--+-----------+--------------+------+--------------------+
--| name      | total_review | fans | avg_review_per_fan |
--+-----------+--------------+------+--------------------+
--| Gerald    |         2000 |  253 |                  7 |
--| Sara      |         1629 |   50 |                 32 |
--| Yuri      |         1339 |   76 |                 17 |
--| .Hon      |         1246 |  101 |                 12 |
--| William   |         1215 |  126 |                  9 |
--| Harald    |         1153 |  311 |                  3 |
--| eric      |         1116 |   16 |                 69 |
--| Roanna    |         1039 |  104 |                  9 |
--| Mimi      |          968 |  497 |                  1 |
--| Christine |          930 |  173 |                  5 |
--| Ed        |          904 |   38 |                 23 |
--| Nicole    |          864 |   43 |                 20 |
--| Fran      |          862 |  124 |                  6 |
--| Mark      |          861 |  115 |                  7 |
--| Christina |          842 |   85 |                  9 |
--| Dominic   |          836 |   37 |                 22 |
--| Lissa     |          834 |  120 |                  6 |
--| Lisa      |          813 |  159 |                  5 |
--| Alison    |          775 |   61 |                 12 |
--| Sui       |          754 |   78 |                  9 |
--| Tim       |          702 |   35 |                 20 |
--| L         |          696 |   10 |                 69 |
--| Angela    |          694 |  101 |                  6 |
--| Crissy    |          676 |   25 |                 27 |
--| Lyn       |          675 |   45 |                 15 |
--+-----------+--------------+------+--------------------+

-- 9. Are there more reviews with the word "love" or with the word "hate" in them?

--Answer:
--+---------------+------------------------------+
--| user_reaction | total_reviews_user_reactions |
--+---------------+------------------------------+
--| Others        |                         8042 |
--| Love          |                         1780 |
--| Hate          |                          178 |
--+---------------+------------------------------+

--SQL code used to arrive at answer:

SELECT user_reaction, 
COUNT(*) AS total_reviews_user_reactions
FROM (
    	SELECT 
    		CASE WHEN text LIKE '%love%' THEN "Love"
        		     WHEN text LIKE '%hate%' THEN "Hate"
         	     ELSE "Others"
         	     END user_reaction
    		FROM review
      )
GROUP BY user_reaction
ORDER BY total_reviews_user_reactions DESC;

-- 10. Find the top 10 users with the most fans:

--SQL code used to arrive at answer:

SELECT name,
SUM(fans) AS total_fans
FROM user
GROUP BY id
ORDER BY total_fans DESC
LIMIT 10;
	
--Copy and Paste the Result Below:
--+-----------+------------+
--| name      | total_fans |
--+-----------+------------+
--| Amy       |        503 |
--| Mimi      |        497 |
--| Harald    |        311 |
--| Gerald    |        253 |
--| Christine |        173 |
--| Lisa      |        159 |
--| Cat       |        133 |
--| William   |        126 |
--| Fran      |        124 |
--| Lissa     |        120 |
--+-----------+------------+

--Part 2: Inferences and Analysis

-- 1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.

--i. Do the two groups you chose to analyze have a different distribution of hours?
--	Food, Phoenix. The 2-3 star group opens earlier, while the 4-5 star group opens leter.

--ii. Do the two groups you chose to analyze have a different number of reviews?
--    The 2-3 star group has less reviews then the 4-5 star group.
         
--iii. Are you able to infer anything from the location data provided between these two groups? Explain.
--	No I wasn't able to because my sample size was too small. 

--SQL code used to arrive at answer:
SELECT business.name
		,business.city
		,category.category
		,business.stars
		,hours.hours
		,business.review_count
FROM ( 
        business INNER JOIN category ON business.id = category.business_id
	)
INNER JOIN hours ON hours.business_id = business.id
WHERE business.city = 'Phoenix'
		AND category.category LIKE 'Food%'
GROUP BY business.stars;

--Copy and Paste the Result Below:

--+----------------------------------------+---------+----------+-------+----------------------+--------------+
--| name                                   | city    | category | stars | hours                | review_count |
--+----------------------------------------+---------+----------+-------+----------------------+--------------+
--| Starbucks                              | Phoenix | Food     |   3.0 | Saturday|5:00-20:00  |           52 |
--| Bootleggers Modern American Smokehouse | Phoenix | Food     |   4.0 | Saturday|11:00-22:00 |          431 |
--+----------------------------------------+---------+----------+-------+----------------------+--------------+

-- 2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.

--i. Difference 1: Total review is significantly higher for businesses that are still open vs. businesses that were closed.
   
--ii. Difference 2: The average stars given were very close to each other 3.68 vs. 3.52. Hence, we can assume that the business which are closed was not entirely based on poor services or poor quality.
                
--SQL code used for analysis:

SELECT CASE 
           WHEN b.is_open = 1 THEN "Still Open"
           WHEN b.is_open = 0 THEN "Closed"
           END status,
COUNT(distinct b.id) AS company_count,
SUM(b.review_count) AS total_review,
ROUND(AVG(b.review_count), 2) AS avg_review,
ROUND(AVG(b.stars), 2) AS avg_stars
FROM business b
GROUP BY b.is_open
ORDER BY status DESC;

--Copy and Paste the Result Below:

--+------------+---------------+--------------+------------+-----------+
--| status     | company_count | total_review | avg_review | avg_stars |
--+------------+---------------+--------------+------------+-----------+
--| Still Open |          8480 |       269300 |      31.76 |      3.68 |
--| Closed     |          1520 |        35261 |       23.2 |      3.52 |
--+------------+---------------+--------------+------------+-----------+

--3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

--Ideas for analysis include: clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
	
--i. Indicate the type of analysis you chose to do:
--Identifying most successful businesses in Phoenix based on business category and average stars given by the consumers.
         
--ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
--In order to conduct analysis, we will need data such as business id, stars, review count from the business table and category from category table. On the other hand, we will need to count the companies within each category, the average star rating given by the consumers to assess their performance, and total reviews given to identify if the data is relevant and ensure it's not biased. Lastly, we're only going to check categories with an average of 3.5 or more stars to reduce any irrelevant data.
                           
                  
--iii. Output of your finished dataset:

--+---------+------------------------+------------------+-----------+---------------+
--| city    | category               | num_of_companies | avg_stars | total_reviews |
--+---------+------------------------+------------------+-----------+---------------+
--| Phoenix | Active Life            |                1 |       5.0 |             9 |
--| Phoenix | American (New)         |                1 |       3.5 |            63 |
--| Phoenix | American (Traditional) |                3 |      3.83 |           498 |
--| Phoenix | Auto Detailing         |                1 |       5.0 |            40 |
--| Phoenix | Automotive             |                1 |       5.0 |            40 |
--| Phoenix | Barbeque               |                1 |       4.0 |           431 |
--| Phoenix | Bars                   |                2 |       3.5 |           491 |
--| Phoenix | Beauty & Spas          |                2 |       4.5 |            22 |
--| Phoenix | Breakfast & Brunch     |                1 |       4.0 |           188 |
--| Phoenix | Car Wash               |                1 |       5.0 |            40 |
--+---------+------------------------+------------------+-----------+---------------+

--iv. Provide the SQL code you used to create your final dataset:
	
	SELECT 
    		b.city,
    		c.category,
    		COUNT(DISTINCT b.id) AS num_of_companies,
    		ROUND(AVG(b.stars), 2) AS avg_stars,
    		SUM(b.review_count) AS total_reviews
	FROM business b
	INNER JOIN category c ON b.id = c.business_id
	WHERE b.city = 'Phoenix' 
	GROUP BY b.city, c.category
	HAVING avg_stars >= 3.5 
	ORDER BY  avg_stars AND num_of_companies DESC
	LIMIT 10;
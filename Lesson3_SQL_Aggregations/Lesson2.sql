/*Questions: MIN, MAX, & AVERAGE
Use the SQL environment below to assist with answering the following questions. Whether you get stuck or you just want to double
check your solutions, my answers can be found at the top of the next concept.
When was the earliest order ever placed? You only need to return the date.*/
SELECT MIN(occurred_at) earliest_order_placed
FROM orders;

/*Try performing the same query as in question 1 without using an aggregation function.*/
SELECT occurred_at AS earliest_order_placed
FROM orders
ORDER BY occurred_at
LIMIT 1;

/*When did the most recent (latest) web_event occur?*/

SELECT MAX(occurred_at) latest_web_event
FROM web_events;

/*Try to perform the result of the previous query without using an aggregation function.*/
SELECT occurred_at AS latest_web_event
FROM web_events
ORDER BY occurred_at DESC
LIMIT 1;

/*Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean amount 
of each paper type purchased per order. Your final answer should have 6 values - one for each paper 
type for the average number of sales, as well as the average amount.*/
SELECT AVG(standard_amt_usd) mean_standard_usd, AVG(gloss_amt_usd) mean_gloss_usd, AVG(poster_amt_usd) mean_poster_usd, AVG(standard_qty) mean_standard,  
       AVG(gloss_qty) mean_gloss, AVG(poster_qty) mean_poster 
FROM orders;

/*Via the video, you might be interested in how to calculate the MEDIAN. Though this is more advanced than what we have covered 
so far try finding - what is the MEDIAN total_usd spent on all orders?*/
SELECT *
FROM (SELECT total_amt_usd
      FROM orders
      ORDER BY total_amt_usd
      LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;

/*Since there are 6912 orders - we want the average of the 3457 and 3456 order amounts when ordered. This is the 
average of 2483.16 and 2482.55. This gives the median of 2482.855. This obviously isn't an ideal way to compute. 
If we obtain new orders, we would have to change the limit. SQL didn't even calculate the median for us. The 
above used a SUBQUERY, but you could use any method to find the two necessary values, and then you just need 
the average of them.*/
/*Questions: GROUP BY Part II
Use the SQL environment below to assist with answering the following questions. Whether you get stuck or you just want to double check
 your solutions, my answers can be found at the top of the next concept.*/

/*1. For each account, determine the average amount of each type of paper they purchased across their orders. Your result should have 
four columns - one for the account name and one for the average quantity purchased for each of the paper types for each account.*/

SELECT a.name, AVG(o.standard_qty) avg_standard, AVG(o.poster_qty) avg_poster, AVG(o.gloss_qty) avg_gloss
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.name;

/*For each account, determine the average amount spent per order on each paper type. Your result should have four columns - one for 
the account name and one for the average amount spent on each paper type.*/

SELECT a.name, AVG(o.standard_amt_usd) avg_stand_amt, AVG(o.gloss_amt_usd) avg_gloss_amt, AVG(o.poster_amt_usd) avg_poster_amt
FROM orders o
JOIN accounts a
ON a.id = o.account_id
GROUP BY a.name;

/*Determine the number of times a particular channel was used in the web_events table for each sales rep. Your final table should 
have three columns - the name of the sales rep, the channel, and the number of occurrences. Order your table with the highest number 
of occurrences first.*/

SELECT s.name, w.channel, Count(*) AS number_events
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name, w.channel
ORDER BY number_events DESC;

/*Determine the number of times a particular channel was used in the web_events table for each region. Your final table should 
have three columns - the region name, the channel, and the number of occurrences. Order your table with the highest number of 
occurrences first.*/

SELECT r.name, w.channel, Count(*) AS number_events
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id
GROUP BY r.name, w.channel
ORDER BY number_events DESC;
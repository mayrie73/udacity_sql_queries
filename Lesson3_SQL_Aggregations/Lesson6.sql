/*Questions: HAVING
Use the SQL environment below to assist with answering the following questions. Whether you 
get stuck or you just want to double check your solutions, my answers can be found at the top 
of the next concept.
/*How many of the sales reps have more than 5 accounts that they manage?
ANSWER = 34*/

SELECT s.name, s.id, COUNT(*) num_accounts
FROM sales_reps s
JOIN accounts a 
ON a.sales_rep_id = s.id
GROUP BY s.name, s.id
HAVING COUNT(*) > 5
ORDER BY num_accounts;

/*How many accounts have more than 20 orders?
ANSWER = 120 */

SELECT a.id, a.name, COUNT(*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING COUNT(*) > 20
ORDER BY num_orders;

/*Which account has the most orders?
ANSWER = ID. 3411, Name: Leucadia National, num_orders: 71 */

SELECT a.id, a.name, COUNT(*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name 
ORDER BY num_orders DESC
LIMIT 1;

/*Which accounts spent more than 30,000 usd total across all orders?*/

SELECT a.id, a.name, SUM(total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name 
HAVING SUM(total_amt_usd) > 30000
ORDER BY total_spent;

/*Which accounts spent less than 1,000 usd total across all orders?*/

SELECT a.id, a.name, SUM(total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name 
HAVING SUM(total_amt_usd) < 1000
ORDER BY total_spent;

/*Which account has spent the most with us?*/
SELECT a.id, a.name, sum(total_amt_usd) total_spent
FROM accounts a 
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent DESC
Limit 1;

/*Which account has spent the least with us?*/

SELECT a.id, a.name, SUM(total_amt_usd) total_spent
FROM accounts a 
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent 
Limit 1;

/*Which accounts used facebook as a channel to contact customers more than 6 times?*/

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a 
JOIN web_events w
ON w.account_id = a.id
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6 AND w.channel = 'facebook'
ORDER BY use_of_channel;


/*Which account used facebook most as a channel? */

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a 
JOIN web_events w
ON w.account_id = a.id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 1;

/*Which channel was most frequently used by most accounts?*/

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a 
JOIN web_events w
ON w.account_id = a.id
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 10; 
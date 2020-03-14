/*Questions: Working With DATEs
Use the SQL environment below to assist with answering the following questions. Whether you get stuck or you just want to double 
check your solutions, my answers can be found at the top of the next concept.*/

/*Find the sales in terms of total dollars for all orders in each year, ordered from greatest to least. Do you notice any trends 
in the yearly sales totals?*/

SELECT DATE_PART('year', occurred_at) AS order_year, SUM(total_amt_usd) total_spent
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

/*Which month did Parch & Posey have the greatest sales in terms of total dollars? Are all months evenly represented by the dataset?*/

SELECT DATE_PART('month', occurred_at) AS order_month, SUM(total_amt_usd) total_spent
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC;

/*Which year did Parch & Posey have the greatest sales in terms of total number of orders? Are all years evenly represented by the dataset?*/

SELECT DATE_PART('year', occurred_at) AS order_year, COUNT(*) total_sales
FROM orders
GROUP BY 1
ORDER BY 2 DESC;

/*Which month did Parch & Posey have the greatest sales in terms of total number of orders? Are all months evenly represented by the dataset?*/

SELECT DATE_PART('month', occurred_at) AS order_month, COUNT(*) total_sales
FROM orders
WHERE occurred_at BETWEEN '2014-01-01'AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC;

/*In which month of which year did Walmart spend the most on gloss paper in terms of dollars?*/

SELECT a.name, DATE_TRUNC('month', occurred_at) AS order_date, SUM(o.gloss_amt_usd) total_gloss_usd
FROM orders o
JOIN accounts a
ON a.id = o.account_id
WHERE a.name = 'Walmart'
GROUP BY a.name, DATE_TRUNC('month', occurred_at)
ORDER BY total_gloss_usd DESC
LIMIT 1;


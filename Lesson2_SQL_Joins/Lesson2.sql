/*Provide a table for all web_events associated with account name of Walmart. There should be three columns. Be sure to include the 
primary_poc, time of the event, and the channel for each event. Additionally, you might choose to add a fourth column to assure only 
Walmart events were chosen.*/

SELECT accounts.primary_poc, web_events.occurred_at, web_events_channel, accounts.name
FROM web_events 
JOIN accounts
ON web_events.account_id = accounts.id
WHERE accounts.name ='Walmart';

SELECT a.primary_poc, w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id =a.id
WHERE a.name = 'Walmart';
/*Provide a table that provides the region for each sales_rep along with their associated accounts. Your final table should include 
three columns: the region name, the sales rep name, and the account name. Sort the accounts alphabetically (A-Z) according to account 
name.*/

SELECT region.name region, sales_reps.name reps, accounts.name account
FROM sales_reps
JOIN region
ON sales_reps.region_id = region.id
JOIN accounts
ON sales_reps.id = accounts.sales_rep_id
ORDER BY account.name;

Select r.name region, s.name reps, a.name account
FROM sales_reps s 
JOIN region r
ON s.region.region_id = r.id
JOIN accounts a
ON s.id = a.sales_rep_id
ORDER BY a.name;


/*Provide the name for each region for every order, as well as the account name and the unit price they paid (total_amt_usd/total) 
for the order. Your final table should have 3 columns: region name, account name, and unit price. A few accounts have 0 for total, 
so I divided by (total + 0.01) to assure not dividing by zero.*/

SELECT region.name region, accounts.name account, orders.total_amt_usd/(orders.total + 0.01) unit_price
FROM region
JOIN sales_reps
ON sales_reps.region_id = region.id
JOIN accounts
ON sales_reps.id = accounts.sales_rep_id
JOIN orders
ON accounts.id = orders.account_id;

SELECT r.name region, a.name account, o.total_amt_usd/(o.total +0.01) unit_price
FROM region r 
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN orders o
ON a.id = o.account_id;

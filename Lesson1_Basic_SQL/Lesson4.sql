/*Pulls the first 5 rows and all columns from the orders table that have a dollar amount of gloss_amt_usd greater than or equal 
to 1000.*/

SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
LIMIT 5;

/* Write a query that Pulls the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500.*/

SELECT * 
FROM orders
WHERE total_amt_usd < 500 
LIMIT 10;

/* When using the WHERE statements, we do not need to ORDER BY unless we want to actually order our data. Our condition will work without
having to do any sorting of the data.*/
mk
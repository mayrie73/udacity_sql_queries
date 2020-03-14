/*Aggregation Questions
Use the SQL environment below to find the solution for each of the following questions. If you get stuck or want to check your 
answers, you can find the answers at the top of the next concept.
Find the total amount of poster_qty paper ordered in the orders table.*/

SELECT sum(poster_qty) total_poster_sales
FROM orders;

/*Find the total amount of standard_qty paper ordered in the orders table.*/
SELECT sum(standard_qty) total_standard_sales
FROM orders;

/*Find the total dollar amount of sales using the total_amt_usd in the orders table.*/

Select sum(total_amt_usd) total_dollar_sales
FROM orders;

/*Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each order in the orders table. This should give a 
dollar amount for each order in the table.*/

SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
FROM orders; 

/*Find the standard_amt_usd per unit of standard_qty paper. Your solution should use both an aggregation and a mathematical operator.*/

SELECT sum(standard_amt_usd)/sum(standard_qty) AS standard_price_per_unit
FROM orders;
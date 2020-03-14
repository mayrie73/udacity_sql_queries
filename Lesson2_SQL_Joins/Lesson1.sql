/*Below we see an example of a query using a JOIN statement. Let's discuss what the different clauses of this query mean.*/

SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = account_id;

/*As we've learned, the SELECT clause indicates which column(s) of data you'd like to see in the output (For Example, orders.* 
gives us all the columns in orders table in the output). The FROM clause indicates the first table from which we're pulling data, 
and the JOIN indicates the second table. The ON clause specifies the column on which you'd like to merge the two tables together.

What to Notice We are able to pull data from two tables: orders & accounts
Above, we are only pulling data from the orders table since in the SELECT statement we only reference columns from the orders table.
The ON statement holds the two columns that get linked across the two tables. This will be the focus in the next concepts.
Additional Information
If we wanted to only pull individual elements from either the orders or accounts table, we can do this by using the exact same 
information in the FROM and ON statements. However, in your SELECT statement, you will need to know how to specify tables and columns 
in the SELECT statement:
The table name is always before the period.
The column you want from that table is always after the period.
For example, if we want to pull only the account name and the dates in which that account placed an order, but none of the other 
columns, we can do this with the following query:*/

SELECT accounts.name, orders.occurred_at
FROM orders
JOIN accounts
ON orders.account_id =accounts.id;

/*This query only pulls two columns, not all the information in these two tables. Alternatively, the below query pulls all the columns 
from both the accounts and orders table.*/

SELECT * 
FROM orders
JOIN accounts
ON orders.account_id = account.id

/*And the first query you can pull all the information from only the orders table.*/

SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = account.id;
/*Quiz Questions
Try pulling all the data from the accounts table, and all the data from the orders table.*/

SELECT orders.*, accounts.*
FROM orders
JOIN accounts 
ON orders.account_id = accounts.id;

/*Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website and the primary_poc 
from the accounts table.*/
SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.website, accounts.primary_poc
FROM orders
JOIN accounts 
ON orders.account_id = accounts.id;


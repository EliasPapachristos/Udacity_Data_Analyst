/* 10 earliest orders in the orders table */
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 10


/* top 5 orders in terms of largest total_amt_usd */
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5


/* lowest 20 orders in terms of smallest total_amt_usd */
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd
LIMIT 20


/* Write a query that displays the order ID, account ID,
and total dollar amount for all the orders, sorted first
by the account ID (in ascending order),
and then by the total dollar amount (in descending order) */
SELECT account_id, total_amt_usd
FROM demo.orders
ORDER BY account_id, total_amt_usd DESC



/* Now write a query that again displays order ID, account ID,
and total dollar amount for each order,
but this time sorted first by total dollar amount (in descending order),
and then by account ID (in ascending order */
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id

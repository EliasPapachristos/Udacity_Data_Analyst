/* Provide a table that provides the region for each sales_rep along with their
associated accounts. This time only for the Midwest region. Your final table
should include three columns: the region name, the sales rep name, and the
account name. Sort the accounts alphabetically (A-Z) according to account name. */
SELECT r.name region, s.name rep, a.name account
FROM sales_reps AS s
JOIN region AS r
ON s.region_id = r.id
JOIN accounts AS a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest'
ORDER BY a.name;


/* Provide a table that provides the region for each sales_rep along with
their associated accounts. This time only for accounts where the sales rep has
a first name starting with S and in the Midwest region. Your final table should
include three columns: the region name, the sales rep name, and the account
name. Sort the accounts alphabetically (A-Z) according to account name. */
SELECT r.name region, s.name rep, a.name account
FROM sales_reps AS s
JOIN region AS r
ON s.region_id = r.id
JOIN accounts AS a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest' AND s.name LIKE 'S%'
ORDER BY a.name;


/* Provide a table that provides the region for each sales_rep along with their
associated accounts. This time only for accounts where the sales rep has a last
name starting with K and in the Midwest region. Your final table should include
three columns: the region name, the sales rep name, and the account name. Sort
the accounts alphabetically (A-Z) according to account name. */
SELECT r.name region, s.name rep, a.name account
FROM sales_reps AS s
JOIN region AS r
ON s.region_id = r.id
JOIN accounts AS a
ON a.sales_rep_id = s.id
WHERE r.name = 'Midwest' AND s.name LIKE 'K%'
ORDER BY a.name;


/* Provide the name for each region for every order, as well as the account
name and the unit price they paid (total_amt_usd/total) for the order. However,
 you should only provide the results if the standard order quantity exceeds
 100. Your final table should have 3 columns: region name, account name, and
 unit price. In order to avoid a division by zero error, adding .01 to the
 denominator here is helpful total_amt_usd/(total+0.01). */
 SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
 FROM region AS r
 JOIN sales_reps AS s
 ON s.region_id = r.id
 JOIN accounts AS a
 ON a.sales_rep_id = s.id
 JOIN orders AS o
 ON o.account_id = a.id
 WHERE o.standard_qty > 100;



/* Provide the name for each region for every order, as well as the account
name and the unit price they paid (total_amt_usd/total) for the order. However,
you should only provide the results if the standard order quantity exceeds 100
and the poster order quantity exceeds 50. Your final table should have 3 columns:
region name, account name, and unit price. Sort for the smallest unit price
first. In order to avoid a division by zero error, adding .01 to the denominator
here is helpful (total_amt_usd/(total+0.01). */
SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
FROM region AS r
JOIN sales_reps AS s
ON s.region_id = r.id
JOIN accounts AS a
ON a.sales_rep_id = s.id
JOIN orders AS o
ON o.account_id = a.id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price;


/* Provide the name for each region for every order, as well as the account
name and the unit price they paid (total_amt_usd/total) for the order. However,
 you should only provide the results if the standard order quantity exceeds 100
  and the poster order quantity exceeds 50. Your final table should have 3
  columns: region name, account name, and unit price. Sort for the largest unit
   price first. */
SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
FROM region AS r
JOIN sales_reps AS s
ON s.region_id = r.id
JOIN accounts AS a
ON a.sales_rep_id = s.id
JOIN orders AS o
ON o.account_id = a.id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price DESC;


/* Find all the orders that occurred in 2015. Your final table should have 4
columns: occurred_at, account name, order total, and order total_amt_usd. */
SELECT DISTINCT a.name, w.channel
FROM accounts AS a
JOIN web_events AS w
ON a.id = w.account_id
WHERE a.id = '1001';


/* Find all the orders that occurred in 2015. Your final table should have 4
columns: occurred_at, account name, order total, and order total_amt_usd. */
SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
FROM accounts AS a
JOIN orders AS o
ON o.account_id = a.id
WHERE o.occurred_at BETWEEN '01-01-2015' AND '01-01-2016'
ORDER BY o.occurred_at DESC;

/* Which account (by name) placed the earliest order? Your solution should
have the account name and the date of the order. */
SELECT a.name, o.occurred_at
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
ORDER BY occurred_at
LIMIT 5;


/* Find the total sales in usd for each account. You should include two columns
- the total sales for each company's orders in usd and the company name. */
SELECT a.name, SUM(total_amt_usd) total_sales
FROM orders AS o
JOIN accounts AS a
ON a.id = o.account_id
GROUP BY a.name;



/* Via what channel did the most recent (latest) web_event occur, which account
was associated with this web_event? Your query should return only three values
- the date, channel, and account name. */
SELECT w.occurred_at, w.channel, a.name
FROM web_events AS w
JOIN accounts AS a
ON w.account_id = a.id
ORDER BY w.occurred_at DESC
LIMIT 5;



/* Find the total number of times each type of channel from the web_events was
used. Your final table should have two columns - the channel and the number of
times the channel was used. */
SELECT w.channel, COUNT(*)
FROM web_events AS w
GROUP BY w.channel



/* Who was the primary contact associated with the earliest web_event? */
SELECT a.primary_poc
FROM web_events AS w
JOIN accounts AS a
ON a.id = w.account_id
ORDER BY w.occurred_at
LIMIT 5;



/* What was the smallest order placed by each account in terms of total usd.
Provide only two columns - the account name and the total usd. Order from
smallest dollar amounts to largest. */
SELECT a.name, MIN(total_amt_usd) smallest_order
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY a.name
ORDER BY smallest_order;


/* Find the number of sales reps in each region. Your final table should have
two columns - the region and the number of sales_reps. Order from fewest reps
to most reps. */
SELECT r.name, COUNT(*) num_reps
FROM region AS r
JOIN sales_reps AS s
ON r.id = s.region_id
GROUP BY r.name
ORDER BY num_reps;

/* Group By Part II */
SELECT account_id,
       channel,
       COUNT(id) AS events
FROM web_events_full
GROUP BY account_id, channel
ORDER BY account_id, events DESC


/* For each account, determine the average amount of each type of paper
they purchased across their orders. Your result should have four
columns - one for the account name and one for the average quantity
purchased for each of the paper types for each account. */
SELECT a.name, AVG(o.standard_qty) AS avg_stand, AVG(o.gloss_qty) AS avg_gloss, AVG(o.poster_qty) AS avg_post
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY a.name;




/* For each account, determine the average amount spent per order on
each paper type. Your result should have four columns - one for
the account name and one for the average amount spent on each paper
type. */
SELECT a.name, AVG(o.standard_amt_usd) AS avg_stand, AVG(o.gloss_amt_usd) AS avg_gloss, AVG(o.poster_amt_usd) AS avg_post
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY a.name;



/* Determine the number of times a particular channel was used in the
web_events table for each sales rep. Your final table should have
three columns - the name of the sales rep, the channel, and the number
of occurrences. Order your table with the highest number of
occurrences first. */
SELECT s.name, w.channel, COUNT(*) AS num_events
FROM accounts AS a
JOIN web_events AS w
ON a.id = w.account_id
JOIN sales_reps AS s
ON s.id = a.sales_rep_id
GROUP BY s.name, w.channel
ORDER BY num_events DESC;



/* Determine the number of times a particular channel was used in the
web_events table for each region. Your final table should have three
columns - the region name, the channel, and the number of occurrences.
Order your table with the highest number of occurrences first. */
SELECT r.name, w.channel, COUNT(*) AS num_events
FROM accounts AS a
JOIN web_events AS w
ON a.id = w.account_id
JOIN sales_reps AS s
ON s.id = a.sales_rep_id
JOIN region AS r
ON r.id = s.region_id
GROUP BY r.name, w.channel
ORDER BY num_events DESC;

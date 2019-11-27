SELECT account_id,
       SUM(total_amt_usd) AS sum_total_amt_usd
FROM orders
GROUP BY 1
HAVING SUM(total_amt_usd) >= 250000


/* How many of the sales reps have more than 5 accounts that they
manage? */
SELECT s.id, s.name, COUNT(*) AS num_accounts
FROM accounts AS a
JOIN sales_reps AS s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
HAVING COUNT(*) > 5
ORDER BY num_accounts;


/* How many accounts have more than 20 orders? */
SELECT a.id, a.name, COUNT(*) AS num_orders
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING COUNT(*) > 20
ORDER BY num_orders;


/* Which account has the most orders? */
SELECT a.id, a.name, COUNT(*) AS num_orders
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY num_orders DESC
LIMIT 5;


/* Which accounts spent more than 30,000 usd total across all orders? */
SELECT a.id, a.name, SUM(o.total_amt_usd) AS total_spent
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) > 30000
ORDER BY total_spent;


/* Which accounts spent less than 1,000 usd total across all orders? */
SELECT a.id, a.name, SUM(o.total_amt_usd) AS total_spent
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) < 1000
ORDER BY total_spent;


/* Which account has spent the most with us? */
SELECT a.id, a.name, SUM(o.total_amt_usd) AS total_spent
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent DESC
LIMIT 5;


/* Which account has spent the least with us? */
SELECT a.id, a.name, SUM(o.total_amt_usd) AS total_spent
FROM accounts AS a
JOIN orders AS o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent
LIMIT 5;


/* Which accounts used facebook as a channel to contact customers
more than 6 times? */
SELECT a.id, a.name, w.channel, COUNT(*) AS use_of_channel
FROM accounts AS a
JOIN web_events AS w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6 AND w.channel = 'facebook'
ORDER BY use_of_channel;


/* Which account used facebook most as a channel? */
SELECT a.id, a.name, w.channel, COUNT(*) AS use_of_channel
FROM accounts AS a
JOIN web_events AS w
ON a.id = w.account_id
WHERE w.channel = 'facebook'
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 5;


/* Which channel was most frequently used by most accounts? */
SELECT a.id, a.name, w.channel, COUNT(*) AS use_of_channel
FROM accounts AS a
JOIN web_events AS w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 5;

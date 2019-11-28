/* The WITH statement is often called a Common Table Expression or CTE.
Though these expressions serve the exact same purpose as subqueries,
they are more common in practice, as they tend to be cleaner for a
future reader to follow the logic. */
WITH events AS (
          SELECT DATE_TRUNC('day',occurred_at) AS day,
                        channel,
                        COUNT(*) AS events
          FROM web_events
          GROUP BY 1,2)

SELECT channel, AVG(events) AS average_events
FROM events
GROUP BY channel
ORDER BY 2 DESC



/* We can add more and more tables using the WITH statement in the
same way. */
WITH table1 AS (
          SELECT *
          FROM web_events),

     table2 AS (
          SELECT *
          FROM accounts)


SELECT *
FROM table1
JOIN table2
ON table1.account_id = table2.id



/* Provide the name of the sales_rep in each region with the largest
amount of total_amt_usd sales.
 */
 WITH t1 AS (
   SELECT s.name AS rep_name, r.name AS region_name, SUM(o.total_amt_usd) AS total_amt
    FROM sales_reps AS s
    JOIN accounts AS a
    ON a.sales_rep_id = s.id
    JOIN orders AS o
    ON o.account_id = a.id
    JOIN region AS r
    ON r.id = s.region_id
    GROUP BY 1,2
    ORDER BY 3 DESC),
 t2 AS (
    SELECT region_name, MAX(total_amt) AS total_amt
    FROM t1
    GROUP BY 1)
 SELECT t1.rep_name, t1.region_name, t1.total_amt
 FROM t1
 JOIN t2
 ON t1.region_name = t2.region_name AND t1.total_amt = t2.total_amt

/* For the region with the largest sales total_amt_usd, how many total
orders were placed?
 */
 WITH t1 AS (
    SELECT r.name AS region_name, SUM(o.total_amt_usd) AS total_amt
    FROM sales_reps AS s
    JOIN accounts AS a
    ON a.sales_rep_id = s.id
    JOIN orders AS o
    ON o.account_id = a.id
    JOIN region AS r
    ON r.id = s.region_id
    GROUP BY r.name),
 t2 AS (
    SELECT MAX(total_amt)
    FROM t1)
 SELECT r.name, COUNT(o.total) AS total_orders
 FROM sales_reps AS s
 JOIN accounts AS a
 ON a.sales_rep_id = s.id
 JOIN orders AS o
 ON o.account_id = a.id
 JOIN region AS r
 ON r.id = s.region_id
 GROUP BY r.name
 HAVING SUM(o.total_amt_usd) = (SELECT * FROM t2)

/* How many accounts had more total purchases than the account name
which has bought the most standard_qty paper throughout their lifetime
as a customer? */
WITH t1 AS (
  SELECT a.name AS account_name, SUM(o.standard_qty) AS total_std, SUM(o.total) AS total
  FROM accounts AS a
  JOIN orders AS o
  ON o.account_id = a.id
  GROUP BY 1
  ORDER BY 2 DESC
  LIMIT 1),
t2 AS (
  SELECT a.name
  FROM orders AS o
  JOIN accounts AS a
  ON a.id = o.account_id
  GROUP BY 1
  HAVING SUM(o.total) > (SELECT total FROM t1))
SELECT COUNT(*)
FROM t2

/* For the customer that spent the most (in total over their lifetime
as a customer) total_amt_usd, how many web_events did they have for
each channel? */
WITH t1 AS (
   SELECT a.id, a.name, SUM(o.total_amt_usd) AS tot_spent
   FROM orders AS o
   JOIN accounts AS a
   ON a.id = o.account_id
   GROUP BY a.id, a.name
   ORDER BY 3 DESC
   LIMIT 1)
SELECT a.name, w.channel, COUNT(*)
FROM accounts AS a
JOIN web_events AS w
ON a.id = w.account_id AND a.id =  (SELECT id FROM t1)
GROUP BY 1, 2
ORDER BY 3 DESC

/* What is the lifetime average amount spent in terms of total_amt_usd
for the top 10 total spending accounts? */
WITH t1 AS (
   SELECT a.id, a.name, SUM(o.total_amt_usd) AS tot_spent
   FROM orders AS o
   JOIN accounts AS a
   ON a.id = o.account_id
   GROUP BY a.id, a.name
   ORDER BY 3 DESC
   LIMIT 10)
SELECT AVG(tot_spent)
FROM t1

/* What is the lifetime average amount spent in terms of total_amt_usd,
including only the companies that spent more per order, on average,
than the average of all orders. */
WITH t1 AS (
   SELECT AVG(o.total_amt_usd) AS avg_all
   FROM orders AS o
   JOIN accounts AS a
   ON a.id = o.account_id),
t2 AS (
   SELECT o.account_id, AVG(o.total_amt_usd) AS avg_amt
   FROM orders o
   GROUP BY 1
   HAVING AVG(o.total_amt_usd) > (SELECT * FROM t1))
SELECT AVG(avg_amt)
FROM t2

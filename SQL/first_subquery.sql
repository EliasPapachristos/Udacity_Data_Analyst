/* First the Inner query runs and then the Outter */

SELECT channel,
       AVG(event_count) AS avg_event_count
FROM
(SELECT DATE_TRUNC('day', occurred_at) AS day,
        channel,
        COUNT(*) AS event_count
FROM web_events_full
GROUP BY 1, 2
) AS sub
GROUP BY 1
ORDER BY 2 DESC


/*
Step by Step
Find the number of events that occurr for each day for each channel
*/
SELECT DATE_TRUNC('day',occurred_at) AS day,
   channel, COUNT(*) AS events
FROM web_events
GROUP BY 1,2
ORDER BY 3 DESC


/*
Now create a subquery that simply provides
all of the data from your 1st query
*/
SELECT *
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
           channel, COUNT(*) AS events
     FROM web_events
     GROUP BY 1,2
     ORDER BY 3 DESC) AS sub

/*
Now find the average number of events for each channel. Since you broke
out by day earlier, this is giving you anaverage per day.
*/
SELECT channel, AVG(events) AS average_events
FROM (SELECT DATE_TRUNC('day',occurred_at) AS day,
             channel, COUNT(*) AS events
      FROM web_events
      GROUP BY 1,2) AS sub
GROUP BY channel
ORDER BY 2 DESC


/*
 if you are only returning a single value, you might use that value
 in a logical statement like WHERE, HAVING, or even SELECT - the value
 could be nested within a CASE statement.
*/
SELECT *
FROM orders
WHERE DATE_TRUNC('month', occurred_at) =
    (SELECT DATE_TRUNC('month', MIN(occurred_at)) AS min_month
      FROM orders)
ORDER BY occurred_at



/*
Use DATE_TRUNC to pull month level information about the first order
ever placed in the orders table
*/
SELECT DATE_TRUNC('month', MIN(occurred_at))
FROM orders


/*
Use the results of the previous query to find only the orders that
took place in the same month and year as the first order, and then
pull the average for each type of paper qty in this month.
*/
SELECT AVG(standard_qty) AS avg_std, AVG(gloss_qty) AS avg_gls, AVG(poster_qty) AS avg_pst
FROM orders
WHERE DATE_TRUNC('month', occurred_at) =
     (SELECT DATE_TRUNC('month', MIN(occurred_at)) FROM orders)

SELECT SUM(total_amt_usd)
FROM orders
WHERE DATE_TRUNC('month', occurred_at) =
      (SELECT DATE_TRUNC('month', MIN(occurred_at)) FROM orders)


/* Above is the ERD for the database again - it might come in handy
as you tackle the quizzes below. You should write your solution
as a subquery or subqueries, not by finding one solution and copying
the output. The importance of this is that it allows your query to
be dynamic in answering the question - even if the data changes,
you still arrive at the right answer.


Provide the name of the sales_rep in each region with the largest
amount of total_amt_usd sales.
*/
SELECT t3.rep_name, t3.region_name, t3.total_amt
FROM(SELECT region_name, MAX(total_amt) AS total_amt
     FROM(SELECT s.name AS rep_name, r.name AS region_name, SUM(o.total_amt_usd) AS total_amt
             FROM sales_reps AS s
             JOIN accounts AS a
             ON a.sales_rep_id = s.id
             JOIN orders AS o
             ON o.account_id = a.id
             JOIN region AS r
             ON r.id = s.region_id
             GROUP BY 1, 2) AS t1
     GROUP BY 1) AS t2
JOIN (SELECT s.name AS rep_name, r.name AS region_name, SUM(o.total_amt_usd) AS total_amt
     FROM sales_reps AS s
     JOIN accounts AS a
     ON a.sales_rep_id = s.id
     JOIN orders AS o
     ON o.account_id = a.id
     JOIN region AS r
     ON r.id = s.region_id
     GROUP BY 1,2
     ORDER BY 3 DESC) AS t3
ON t3.region_name = t2.region_name AND t3.total_amt = t2.total_amt


/* For the region with the largest (sum) of sales total_amt_usd,
how many total (count) orders were placed? */
SELECT r.name, COUNT(o.total) AS total_orders
FROM sales_reps AS s
JOIN accounts AS a
ON a.sales_rep_id = s.id
JOIN orders AS o
ON o.account_id = a.id
JOIN region AS r
ON r.id = s.region_id
GROUP BY r.name
HAVING SUM(o.total_amt_usd) = (
      SELECT MAX(total_amt)
      FROM (SELECT r.name AS region_name, SUM(o.total_amt_usd) AS total_amt
              FROM sales_reps AS s
              JOIN accounts AS a
              ON a.sales_rep_id = s.id
              JOIN orders AS o
              ON o.account_id = a.id
              JOIN region AS r
              ON r.id = s.region_id
              GROUP BY r.name) AS sub)


/* How many accounts had more total purchases than the account name
which has bought the most standard_qty paper throughout their
lifetime as a customer? */
SELECT COUNT(*)
FROM (SELECT a.name
       FROM orders AS o
       JOIN accounts AS a
       ON a.id = o.account_id
       GROUP BY 1
       HAVING SUM(o.total) > (SELECT total
                   FROM (SELECT a.name AS act_name, SUM(o.standard_qty) AS tot_std, SUM(o.total) AS total
                         FROM accounts AS a
                         JOIN orders AS o
                         ON o.account_id = a.id
                         GROUP BY 1
                         ORDER BY 2 DESC
                         LIMIT 1) AS inner_tab)
             ) AS counter_tab


/* For the customer that spent the most (in total over their lifetime
as a customer) total_amt_usd, how many web_events did they have
for each channel?
*/
 SELECT a.name, w.channel, COUNT(*)
 FROM accounts AS a
 JOIN web_events AS w
 ON a.id = w.account_id AND a.id =  (SELECT id
                      FROM (SELECT a.id, a.name, SUM(o.total_amt_usd) AS tot_spent
                            FROM orders AS o
                            JOIN accounts AS a
                            ON a.id = o.account_id
                            GROUP BY a.id, a.name
                            ORDER BY 3 DESC
                            LIMIT 1) AS inner_table)
 GROUP BY 1, 2
 ORDER BY 3 DESC


/* What is the lifetime average amount spent in terms of total_amt_usd
for the top 10 total spending accounts? */
SELECT AVG(tot_spent)
FROM (SELECT a.id, a.name, SUM(o.total_amt_usd) AS tot_spent
      FROM orders AS o
      JOIN accounts AS a
      ON a.id = o.account_id
      GROUP BY a.id, a.name
      ORDER BY 3 DESC
       LIMIT 10) AS temp


/* What is the lifetime average amount spent in terms of total_amt_usd,
including only the companies that spent more per order, on average,
than the average of all orders. */
SELECT AVG(avg_amt)
FROM (SELECT o.account_id, AVG(o.total_amt_usd) AS avg_amt
    FROM orders AS o
    GROUP BY 1
    HAVING AVG(o.total_amt_usd) > (SELECT AVG(o.total_amt_usd) AS avg_all
                                   FROM orders o)) AS temp_table

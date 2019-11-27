SELECT DATE_PART('dow', occurred_at) AS day_of_week,
       SUM(total) AS total_qty
FROM orders
GROUP BY 1
ORDER BY 2 DESC


/* Find the sales in terms of total dollars for all orders in each year,
ordered from greatest to least. Do you notice any trends in the yearly
sales totals? */
SELECT DATE_PART('year', occurred_at) AS ord_year,  SUM(total_amt_usd) AS total_spent
FROM orders
GROUP BY 1
ORDER BY 2 DESC;


/* Which month did Parch & Posey have the greatest sales in terms of
total dollars? Are all months evenly represented by the dataset? */
SELECT DATE_PART('month', occurred_at) AS ord_month, SUM(total_amt_usd) AS total_spent
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC;


/* Which year did Parch & Posey have the greatest sales in terms of
total number of orders? Are all years evenly represented by the
dataset? */
SELECT DATE_PART('year', occurred_at) AS ord_year,  COUNT(*) AS total_sales
FROM orders
GROUP BY 1
ORDER BY 2 DESC;


/* Which month did Parch & Posey have the greatest sales in terms of
total number of orders? Are all months evenly represented by the
dataset? */
SELECT DATE_PART('month', occurred_at) AS ord_month, COUNT(*) AS total_sales
FROM orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
GROUP BY 1
ORDER BY 2 DESC;


/* In which month of which year did Walmart spend the most on gloss
paper in terms of dollars? */
SELECT DATE_TRUNC('month', o.occurred_at) AS ord_date, SUM(o.gloss_amt_usd) AS tot_spent
FROM orders AS o
JOIN accounts AS a
ON a.id = o.account_id
WHERE a.name = 'Walmart'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

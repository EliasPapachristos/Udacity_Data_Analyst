SELECT first_name,
       last_name,
       city_state,
       POSITION(',', IN city_state) AS comma_position, /*one way*/
       STRPOS(city_state, ',') AS substr_comma_position, /*2nd way*/
       LOWER(city_state) AS lowercase,
       UPPER(city_state) AS uppercase,
       LEFT(city_state, POSITION(',' IN city_state) -1 ) AS city
FROM customer_data



/* Use the accounts table to create first and last name columns that
hold the first and last names for the primary_poc. */
SELECT LEFT(primary_poc, STRPOS(primary_poc, ' ') -1 ) AS first_name,
       RIGHT(primary_poc, LENGTH(primary_poc) - STRPOS(primary_poc, ' ')) AS last_name
FROM accounts


/* ow see if you can do the same thing for every rep name in the
sales_reps table. Again provide first and last name columns. */
SELECT LEFT(name, STRPOS(name, ' ') -1 ) AS first_name,
       RIGHT(name, LENGTH(name) - STRPOS(name, ' ')) AS last_name
FROM sales_reps

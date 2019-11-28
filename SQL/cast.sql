SELECT *,
        DATE_PART('month', TO_DATE(month, 'month')) AS clean_month,
        year || '-' || DATE_PART('month', TO_DATE(month, 'month')) || '-' || day AS concatenated_date,
        CAST(year || '-' || DATE_PART('month', TO_DATE(month, 'month')) || '-' || day AS date) AS formatted_date, /*with CAST*/
        (year || '-' || DATE_PART('month', TO_DATE(month, 'month')) || '-' || day) :: date AS formatted_date_alt /*instead of CAST*/
FROM ad_clicks



SELECT *
FROM sf_crime_data
LIMIT 10

SELECT date orig_date,
       (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2)) AS new_date
FROM sf_crime_data

SELECT date orig_date, 
       (SUBSTR(date, 7, 4) || '-' || LEFT(date, 2) || '-' || SUBSTR(date, 4, 2)) :: DATE AS new_date
FROM sf_crime_data

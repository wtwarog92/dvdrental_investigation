WITH table1 AS (SELECT
CONCAT(DATE_PART('year', r.rental_date), '-',DATE_PART('month',     r.rental_date)) year_month,
SUM(p.amount) total_sale,
COUNT(r.*) rental_no
FROM rental r
JOIN payment p
ON p.rental_id = r.rental_id
GROUP BY 1)
SELECT year_month, total_sale, SUM(total_sale) OVER (ORDER BY year_month) AS running_monthly_sale, rental_no, SUM(rental_no) OVER (ORDER BY year_month) AS running_rental_monthly_sum
FROM table1 t1;

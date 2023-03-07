WITH category_rental_data AS (SELECT r.rental_id , r.rental_date, c.name category
  FROM category c
  JOIN film_category fc
  ON c.category_id = fc.category_id
  JOIN film f
  ON fc.film_id = f.film_id
  JOIN inventory i
  ON i.film_id = f.film_id
  JOIN rental r
  ON i.inventory_id = r.inventory_id)

SELECT CONCAT(DATE_PART('year', t1.rental_date), '-',DATE_PART('month', t1.rental_date)) month_year, t1.category, COUNT(*) rent_count
FROM category_rental_data t1
WHERE t1.category = 'Family' OR t1.category = 'Foreign' OR t1.category = 'Horror'
GROUP BY 1,2;
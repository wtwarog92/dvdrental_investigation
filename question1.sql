WITH customer_top10_data AS (SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name), SUM(p.amount)
  FROM rental r
  LEFT JOIN payment p
  ON p.rental_id = r.rental_id
  JOIN customer c
  ON r.customer_id = c.customer_id
  GROUP BY 1, 2
  ORDER BY 3 DESC
  LIMIT 10),

category_data AS (SELECT r.rental_id , r.customer_id, c.name category
  FROM category c
  JOIN film_category fc
  ON c.category_id = fc.category_id
  JOIN film f
  ON fc.film_id = f.film_id
  JOIN inventory i
  ON i.film_id = f.film_id
  JOIN rental r
  ON i.inventory_id = r.inventory_id)

SELECT t2.category, COUNT(*)
FROM category_data t2
JOIN customer_top10_data t1
ON t2.customer_id = t1.customer_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;
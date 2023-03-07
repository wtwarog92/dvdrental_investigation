SELECT i.inventory_id, f.title, i.store_id, COUNT(*)
FROM inventory i
JOIN film f
ON i.film_id = f.film_id
JOIN rental r
ON i.inventory_id = r.inventory_id
GROUP BY 1,2,3
ORDER BY 4 DESC
-- Error: Models that are in multiple categories
SELECT
	category,
	model
FROM
	car
WHERE
	model in(
		SELECT
			c.model FROM car AS c
		GROUP BY
			c.model
		HAVING
			COUNT(DISTINCT c.category) > 1)
GROUP BY
	category,
	model
ORDER BY
	model;

SELECT
	category,
	model,
	numberplate
FROM
	car
WHERE
	numberplate in(
		SELECT
			c.numberplate FROM car AS c
		GROUP BY
			c.numberplate
		HAVING
			COUNT(*) > 1)
ORDER BY
	numberplate;
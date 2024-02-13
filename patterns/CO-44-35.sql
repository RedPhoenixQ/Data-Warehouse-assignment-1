-- CO-44-35 is fast
SELECT
	AVG(speed),
	numberplate
FROM
	speeds
	JOIN car USING (carid)
WHERE
    model = 'OpelAstra-FX'
GROUP BY
	numberplate
ORDER BY
	AVG DESC;
-- no change per year
SELECT
	AVG(speed),
	"year"
FROM
	speeds
	JOIN car USING (carid)
	JOIN timetbl USING (timid)
WHERE
    numberplate = 'CO-44-35'
GROUP BY
	"year"
ORDER BY
	"year";
-- no (significant) change per country
SELECT
	AVG(speed),
	country
FROM
	speeds
	JOIN car USING (carid)
	JOIN "location" USING (locid)
WHERE
    numberplate = 'CO-44-35'
GROUP BY
	country;
SELECT
	STDDEV_POP(speed),
	AVG(speed),
	"year"
FROM
	speeds
	JOIN timetbl USING (timid)
	JOIN "location" USING (locid)
	JOIN car USING (carid)
GROUP BY
	"year";

-- REPORT EX 1
-- 'Ystad' has lower avg and high stddev
SELECT
	STDDEV_POP(speed),
	AVG(speed),
	COUNT(*),
	region,
	city
FROM
	speeds
	JOIN "location" USING (locid)
WHERE
	region = 'Skane'
GROUP BY
	region,
	city
ORDER BY
	AVG;


SELECT
	STDDEV_POP(speed),
	AVG(speed),
	COUNT(*),
	"year"
FROM
	speeds
	JOIN "location" USING (locid)
	JOIN timetbl USING (timid)
WHERE
	city = 'Ystad'
GROUP BY
	"year"
ORDER BY
	AVG;

SELECT
	STDDEV_POP(speed),
	AVG(speed),
	COUNT(*),
	category
FROM
	speeds
	JOIN "location" USING (locid)
	JOIN car USING (carid)
WHERE
	city = 'Ystad'
GROUP BY
	category
ORDER BY
	AVG;

-- REPORT EX 2
-- 'CO-44-35' is much faster
SELECT
	STDDEV_POP(speed),
	AVG(speed),
	COUNT(*),
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

SELECT
    STDDEV_POP(speed),
    AVG(speed),
    COUNT(*),
    country
FROM
    speeds
    JOIN car USING (carid)
    JOIN "location" USING (locid)
WHERE
    numberplate = 'CO-44-35'
GROUP BY
    country
ORDER BY
    AVG DESC;

SELECT
    STDDEV_POP(speed),
    AVG(speed),
    COUNT(*),
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
    AVG DESC;
-- Netherlands has low avg speed
SELECT
	STDDEV_POP(speed),
	AVG(speed),
	country
FROM
	speeds
	JOIN "location" USING (locid)
GROUP BY
	country
ORDER BY
	country;

-- Noordbrabant has low avg speed
SELECT
	STDDEV_POP(speed),
	AVG(speed),
	region
FROM
	speeds
	JOIN "location" USING (locid)
WHERE
	country = 'NED'
GROUP BY
	region
ORDER BY
	region;

-- Category supersport has much higher avg speed and the highest stddev
SELECT
	STDDEV_POP(speed),
	AVG(speed),
	category
FROM
	speeds
	JOIN car USING (carid)
GROUP BY
	category
ORDER BY
	category;

-- Two individual cars have much higher avg speeds, OpelAstra-FX and SkodaOctavia-Si
SELECT
	STDDEV_POP(speed),
	AVG(speed) AS "avg",
	category,
	model,
	numberplate
FROM
	speeds
	JOIN timetbl USING (timid)
	JOIN "location" USING (locid)
	JOIN car USING (carid)
GROUP BY
	category,
	model,
	numberplate
ORDER BY
	"avg" DESC;

-- Ystad has lower avg speed
SELECT
	STDDEV_POP(SPEED),
	AVG(SPEED) AS "avg",
	region,
	city
FROM
	SPEEDS
	JOIN "location" USING (locid)
WHERE
	country = 'SWE'
GROUP BY
	region,
	city
ORDER BY
	"avg";

-- Ystad has lower avg speed
SELECT
	STDDEV_POP(SPEED),
	AVG(SPEED) AS "avg",
	region,
	city
FROM
	SPEEDS
	JOIN "location" USING (locid)
	JOIN timetbl USING (timid)
WHERE
	country = 'SWE'
GROUP BY
	region,
	city
ORDER BY
	"avg";
-- TODO: drill down on SkodaOctavia (time and location)

-- SkodaOctavia-Si has much higher avg and stddev
SELECT STDDEV_POP(SPEED),AVG(SPEED),MODEL
FROM SPEEDS,CAR
WHERE SPEEDS.CARID = CAR.CARID
AND CATEGORY = 'compact'
GROUP BY MODEL
ORDER BY MODEL;

-- A single car (UH-98-94) has a very high speed
-- No difference in other dimensions
SELECT
	STDDEV_POP(speed),
	AVG(speed) AS avg,
	category,
	model,
	numberplate
FROM
	speeds
	JOIN timetbl USING (timid)
	JOIN "location" USING (locid)
	JOIN car USING (carid)
WHERE
	model = 'SkodaOctavia-Si'
GROUP BY
	category,
	model,
	numberplate
ORDER BY
	avg DESC;

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


-- Compact has second highest stddev
SELECT STDDEV_POP(SPEED),AVG(SPEED),CATEGORY
FROM SPEEDS,CAR
WHERE SPEEDS.CARID = CAR.CARID
GROUP BY CATEGORY
ORDER BY CATEGORY;

-- No significant outlier over time, but high stddev
SELECT STDDEV_POP(SPEED),AVG(SPEED),YEAR,MONTH
FROM SPEEDS,CAR,TIMETBL
WHERE SPEEDS.CARID = CAR.CARID
AND SPEEDS.TIMID = TIMETBL.TIMID
AND MODEL = 'SkodaOctavia-Si'
GROUP BY YEAR,MONTH
ORDER BY YEAR,MONTH;


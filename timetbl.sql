-- NO: diff per year 
SELECT
	STDDEV_POP(speed),
	AVG(speed),
	"year"
FROM
	speeds
	JOIN timetbl USING (timid)
GROUP BY
	"year";

-- NO: diff per month
SELECT
	STDDEV_POP(speed),
	AVG(speed),
	COUNT(*),
	"year",
	"month"
FROM
	speeds
	JOIN timetbl USING (timid)
GROUP BY
	"year", "month";

-- NO: diff per month
SELECT
	STDDEV_POP(speed),
	AVG(speed),
	COUNT(*),
	"day"
FROM
	speeds
	JOIN timetbl USING (timid)
	WHERE "year" = '2017'
GROUP BY
	"day"
ORDER BY
	"day";

-- NO: diff major diff per day, large span in stddev, 7-ish days have very high counts
SELECT
	STDDEV_POP(speed),
	AVG(speed),
	COUNT(*),
	"year",
	"month",
	"day"
FROM
	speeds
	JOIN timetbl USING (timid)
	JOIN car USING (carid)
WHERE
	"day" in('2019-03-15', '2019-10-08', '2017-09-16', '2017-05-28', '2019-06-24', '2021-03-12', '2020-07-10')
GROUP BY
	"year",
	"month",
	"day",
	"second"
ORDER BY
	"count" DESC;
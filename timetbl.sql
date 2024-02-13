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

-- MAYBE: 7 first days have abnormaly high counts
SELECT
	STDDEV_POP(speed),
	AVG(speed),
	COUNT(*),
	"day"
FROM
	speeds
	JOIN timetbl USING (timid)
GROUP BY
	"day"
ORDER BY
	COUNT DESC;

SELECT
	STDDEV_POP(speed),
	AVG(speed),
	COUNT(*),
	"day"
FROM
	speeds
	JOIN timetbl USING (timid)
	JOIN "location" USING (locid)
GROUP BY
	"day", country
ORDER BY
	COUNT DESC;

-- YES: 7 seconds have over 200 measures the same second, normal is bellow 100
SELECT
    STDDEV_POP(speed),
    AVG(speed),
    COUNT(*),
    "second"
FROM
    speeds
    JOIN timetbl USING (timid)
WHERE
    "day" in(
        '2019-03-15',
        '2019-10-08',
        '2017-09-16',
        '2017-05-28',
        '2019-06-24',
        '2021-03-12',
        '2020-07-10'
    )
GROUP BY
    "second"
ORDER BY
    "count" DESC;
    
-- NO: Major difference between counts in categories
SELECT
    STDDEV_POP(speed),
    AVG(speed),
    COUNT(*),
    "second",
    category
FROM
    speeds
    JOIN timetbl USING (timid)
    JOIN car USING (carid)
WHERE
    "second" in(
        '2019-03-15 15:47:00',
        '2020-07-10 03:25:00',
        '2021-03-12 01:14:00',
        '2017-05-28 15:44:00',
        '2017-09-16 18:12:00',
        '2019-10-08 23:23:00',
        '2019-06-24 22:30:00'
    )
GROUP BY
    "second",
    category
ORDER BY
    "count" DESC;
    
-- MAYBE: Sweden has around half of all the measurements, pattern of country falling in participation by ~50% in order ['SWE', 'GER', 'NED', 'DEN']
SELECT
    STDDEV_POP(speed),
    AVG(speed),
    COUNT(*),
    "second",
    country
FROM
    speeds
    JOIN timetbl USING (timid)
    JOIN "location" USING (locid)
WHERE
    "second" in(
        '2019-03-15 15:47:00',
        '2020-07-10 03:25:00',
        '2021-03-12 01:14:00',
        '2017-05-28 15:44:00',
        '2017-09-16 18:12:00',
        '2019-10-08 23:23:00',
        '2019-06-24 22:30:00'
    )
GROUP BY
    "second",
    country
ORDER BY
    "count" DESC;
    
-- MAYBE: Only four regions are really above avg in count, ['Vastra Gotaland', 'NRW', 'Skane', 'Limburg'], also in decending order of participation
SELECT
    STDDEV_POP(speed),
    AVG(speed),
    COUNT(*),
    "second",
    country,
    region
FROM
    speeds
    JOIN timetbl USING (timid)
    JOIN "location" USING (locid)
WHERE
    "second" in(
        '2019-03-15 15:47:00',
        '2020-07-10 03:25:00',
        '2021-03-12 01:14:00',
        '2017-05-28 15:44:00',
        '2017-09-16 18:12:00',
        '2019-10-08 23:23:00',
        '2019-06-24 22:30:00'
    )
GROUP BY
    "second",
    country,
    region
ORDER BY
    "count" DESC;
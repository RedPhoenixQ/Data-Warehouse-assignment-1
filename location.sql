-- YES: 'NED' has lower avg
SELECT
    STDDEV_POP(speed),
    AVG(speed),
    country
FROM
    speeds
    JOIN LOCATION USING (locid)
GROUP BY
    country;

-- YES: 'Noordbrabant' has lower avg and bery low stddev
SELECT
    STDDEV_POP(speed),
    AVG(speed),
    country,
    region
FROM
    speeds
    JOIN LOCATION USING (locid)
WHERE
    country = 'NED'
GROUP BY
    country,
    region;
-- NO: diff per region in other countries
SELECT
    STDDEV_POP(speed),
    AVG(speed),
    country,
    region
FROM
    speeds
    JOIN LOCATION USING (locid)
WHERE
    country <> 'NED'
GROUP BY
    country,
    region;

-- YES: 'Ystad' has lower avg and high stddev
SELECT
    STDDEV_POP(speed),
    AVG(speed),
    country,
    region,
    city
FROM
    speeds
    JOIN LOCATION USING (locid)
WHERE
    country = 'SWE'
GROUP BY
    country,
    region,
    city;
-- NO: diff between other citys
SELECT
    STDDEV_POP(speed),
    AVG(speed),
    country,
    region,
    city
FROM
    speeds
    JOIN LOCATION USING (locid)
WHERE
    country <> 'SWE'
GROUP BY
    country,
    region,
    city;
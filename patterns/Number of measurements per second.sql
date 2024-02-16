SELECT
    COUNT(*),
    "second"
FROM
    speeds
    JOIN timetbl USING (timid)
GROUP BY
    "second"
ORDER BY
    COUNT DESC;

-- MAYBE: Sweden has around half of all the measurements, pattern of country falling in participation by ~50% in order ['SWE', 'GER', 'NED', 'DEN']
SELECT
    COUNT(*),
    "second",
    country
FROM
    speeds
    JOIN timetbl USING (timid)
    JOIN "location" USING (locid)
WHERE
    "second" in('2019-03-15 15:47:00', '2020-07-10 03:25:00', '2021-03-12 01:14:00', '2017-05-28 15:44:00', '2017-09-16 18:12:00', '2019-10-08 23:23:00', '2019-06-24 22:30:00')
GROUP BY
    "second",
    country
ORDER BY
    COUNT DESC;
    
-- MAYBE: Only four regions are really above avg in count, ['Vastra Gotaland', 'NRW', 'Skane', 'Limburg'], also in decending order of participation
SELECT
    COUNT(*),
    "second",
    country,
    region
FROM
    speeds
    JOIN timetbl USING (timid)
    JOIN "location" USING (locid)
WHERE
    "second" in('2019-03-15 15:47:00', '2020-07-10 03:25:00', '2021-03-12 01:14:00', '2017-05-28 15:44:00', '2017-09-16 18:12:00', '2019-10-08 23:23:00', '2019-06-24 22:30:00')
GROUP BY
    "second",
    country,
    region
ORDER BY
    "count" DESC;
-- All countries
SELECT
    AVG(speed),
    country
FROM
    speeds
    JOIN "location" USING (locid)
GROUP BY
    country;
-- Regions in Netherlands
SELECT
    AVG(speed),
    region
FROM
    speeds
    JOIN "location" USING (locid)
WHERE
    country = 'NED'
GROUP BY
    region;
-- Netherlands over time
-- SELECT
--     AVG(speed),
--     "year"
-- FROM
--     speeds
--     JOIN "location" USING (locid)
--     JOIN timetbl USING (timid)
-- WHERE
--     country = 'NED'
-- GROUP BY
--     "year",
--     country
-- ORDER BY
--     "year";
-- Netherlands histogram

WITH ranges AS (
    SELECT
        lpad((ten * 10)::text, 3, '0') || '-' || lpad((ten * 10 + 9)::text, 3, '0') AS "range",
        ten * 10 AS "min",
        ten * 10 + 9 AS "max",
    FROM
        generate_series(0, 22) AS t (ten)
)
SELECT
    r.range,
    count(speeds.*),
    country
FROM
    speeds
    RIGHT JOIN ranges r ON speed BETWEEN r. "min"
        AND r. "max"
    JOIN "location" USING (locid)
GROUP BY
    r. "range", country
ORDER BY
    country, r. "range";
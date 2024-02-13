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
-- Cities
SELECT
    AVG(speed),
    city
FROM
    speeds
    JOIN "location" USING (locid)
WHERE
    region = 'Noordbrabant'
GROUP BY
    city;
-- Categories
SELECT
    AVG(speed),
    category
FROM
    speeds
    JOIN "location" USING (locid)
    JOIN car USING (carid)
WHERE
    region = 'Noordbrabant'
GROUP BY
    category;
-- Ystad low speed
SELECT
    AVG(speed),
    city
FROM
    speeds
    JOIN "location" USING (locid)
WHERE
    region = 'Skane'
GROUP BY
    city
ORDER BY
    AVG;
-- Over time
SELECT
    AVG(speed),
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
    "year";
-- Over cars
SELECT
    AVG(speed),
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
    category;
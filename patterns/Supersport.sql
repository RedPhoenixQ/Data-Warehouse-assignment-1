-- Supersport is fast
SELECT
    AVG(speed),
    category
FROM
    speeds
    JOIN car USING (carid)
GROUP BY
    category;
-- Opel stands out
SELECT
    AVG(speed),
    model
FROM
    speeds
    JOIN car USING (carid)
WHERE
    category = 'supersport'
GROUP BY
    model;
-- No change over time
SELECT
    AVG(speed),
    "year"
FROM
    speeds
    JOIN car USING (carid)
    JOIN timetbl USING (timid)
WHERE
    category = 'supersport'
GROUP BY
    "year",
    category
ORDER BY
    "year";
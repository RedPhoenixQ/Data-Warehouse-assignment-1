-- SkodaOctavia high speed
SELECT
    AVG(speed),
    model
FROM
    speeds
    JOIN car USING (carid)
WHERE
    category = 'compact'
GROUP BY
    model
ORDER BY
    AVG DESC;
-- UH-98-94 high speed
SELECT
    AVG(speed),
    numberplate
FROM
    speeds
    JOIN car USING (carid)
WHERE
    model = 'SkodaOctavia-Si'
GROUP BY
    numberplate
ORDER BY
    AVG DESC;
-- No change over time
SELECT
    AVG(speed),
    "year"
FROM
    speeds
    JOIN car USING (carid)
    JOIN timetbl USING (timid)
WHERE
    model = 'SkodaOctavia-Si'
GROUP BY
    "year"
ORDER BY
    "year";
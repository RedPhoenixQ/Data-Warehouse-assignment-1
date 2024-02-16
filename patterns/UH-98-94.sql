-- UH-98-94 is fast
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
-- no change per year
SELECT
    AVG(speed),
    "year"
FROM
    speeds
    JOIN car USING (carid)
    JOIN timetbl USING (timid)
WHERE
    numberplate = 'UH-98-94'
GROUP BY
    "year"
ORDER BY
    "year";
-- no (significant) change per country
SELECT
    AVG(speed),
    country
FROM
    speeds
    JOIN car USING (carid)
    JOIN "location" USING (locid)
WHERE
    numberplate = 'UH-98-94'
GROUP BY
    country;
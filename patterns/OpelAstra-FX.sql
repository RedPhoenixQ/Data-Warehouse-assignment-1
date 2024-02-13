-- OpenAstra high speed (Lada is closer to global avg)
SELECT
    AVG(speed),
    model
FROM
    speeds
    JOIN car USING (carid)
WHERE
    category = 'supersport'
GROUP BY
    model
ORDER BY
    AVG DESC;
-- CO-44-35 high speed
SELECT
    AVG(speed),
    numberplate
FROM
    speeds
    JOIN car USING (carid)
WHERE
    model = 'OpelAstra-FX'
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
    model = 'OpelAstra-FX'
GROUP BY
    "year"
ORDER BY
    "year";
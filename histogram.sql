-- YES: Very few measurements in 70 -79 range, does not follow the pattern
WITH ranges AS (
    SELECT
        (ten * 10) :: text || '-' ||(ten * 10 + 9) :: text AS "range",
        ten * 10 AS "min",
        ten * 10 + 9 AS "max",
        ten as id
    FROM
        generate_series(0, 22) AS t(ten)
)
SELECT
    r.range,
    count(speeds.*)
FROM
    speeds
    RIGHT JOIN ranges r ON speed BETWEEN r."min"
    AND r."max"
GROUP BY
    r."range",
    r.id
ORDER BY
    r.id;
    
-- NO: diff per year
WITH ranges AS (
    SELECT
        (ten * 10) :: text || '-' ||(ten * 10 + 9) :: text AS "range",
        ten * 10 AS "min",
        ten * 10 + 9 AS "max",
        ten as id
    FROM
        generate_series(0, 22) AS t(ten)
)
SELECT
    r.range,
    count(speeds.*),
    "year"
FROM
    speeds
    RIGHT JOIN ranges r ON speed BETWEEN r."min"
    AND r."max"
    JOIN timetbl USING (timid)
GROUP BY
    r.id,
    r."range",
    "year"
ORDER BY
    "year",
    r.id;
    
-- NO: diff per category
WITH ranges AS (
    SELECT
        (ten * 10) :: text || '-' ||(ten * 10 + 9) :: text AS "range",
        ten * 10 AS "min",
        ten * 10 + 9 AS "max",
        ten as id
    FROM
        generate_series(0, 22) AS t(ten)
)
SELECT
    r.range,
    count(speeds.*),
    category
FROM
    speeds
    RIGHT JOIN ranges r ON speed BETWEEN r."min"
    AND r."max"
    JOIN car USING (carid)
GROUP BY
    r.id,
    r."range",
    category
ORDER BY
    category,
    r.id;
-- YES: Only Netherlands have high counts in ['30-39', '40-49', '50-59', '60-69'] ranges, but not in '70-79', which could explain why the total count is very low
WITH ranges AS (
    SELECT
        lpad((ten * 10) :: text, 3, '0') || '-' || lpad((ten * 10 + 9) :: text, 3, '0') AS "range",
        ten * 10 AS "min",
        ten * 10 + 9 AS "max"
    FROM
        generate_series(0, 22) AS t(ten)
)
SELECT
    r.range,
    count(speeds.*),
    country
FROM
    speeds
    RIGHT JOIN ranges r ON speed BETWEEN r."min"
    AND r."max"
    JOIN "location" USING (locid)
GROUP BY
    r."range",
    country
ORDER BY
    country,
    r."range";

-- NO: diff between years
WITH ranges AS (
    SELECT
        lpad((ten * 10) :: text, 3, '0') || '-' || lpad((ten * 10 + 9) :: text, 3, '0') AS "range",
        ten * 10 AS "min",
        ten * 10 + 9 AS "max",
    FROM
        generate_series(0, 22) AS t(ten)
)
SELECT
    r.range,
    count(speeds.*),
    "year"
FROM
    speeds
    RIGHT JOIN ranges r ON speed BETWEEN r."min"
    AND r."max"
    JOIN timetbl USING (timid)
GROUP BY
    r."range",
    "year"
ORDER BY
    "year",
    r."range";
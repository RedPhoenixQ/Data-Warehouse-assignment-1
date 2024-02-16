-- MAYBE: 7 first days have abnormaly high counts
SELECT
    COUNT(*),
    "day"
FROM
    speeds
    JOIN timetbl USING (timid)
GROUP BY
    "day"
ORDER BY
    COUNT DESC;


-- YES: 7 seconds have over 200 measures the same second, normal is bellow 100
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
    
-- NO: Major difference between counts in categories
SELECT
    COUNT(*),
    "day",
    category
FROM
    speeds
    JOIN timetbl USING (timid)
    JOIN car USING (carid)
WHERE
    "day" in('2019-03-15', '2019-10-08', '2017-09-16', '2017-05-28', '2019-06-24', '2021-03-12', '2020-07-10')
GROUP BY
    "day",
    category
ORDER BY
    COUNT DESC;
SELECT
    COUNT(*),
    category
FROM
    speeds
    JOIN car USING (carid)
GROUP BY
    category
ORDER BY
    COUNT DESC;
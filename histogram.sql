-- Very few measurements in 70-79 range, does not follow the pattern
WITH ranges AS (
    SELECT (ten*10)::text||'-'||(ten*10+9)::text AS range,
           ten*10 AS "min", ten*10+9 AS "max", ten as id
      FROM generate_series(0,22) AS t(ten))
SELECT r.range, count(speeds.*)
  FROM speeds
  RIGHT JOIN ranges r ON speed BETWEEN r.min AND r.max
 GROUP BY r.range, r.id
 ORDER BY r.id;
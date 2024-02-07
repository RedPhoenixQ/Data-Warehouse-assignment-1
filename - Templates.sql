SELECT
	STDDEV_POP(speed),
	AVG(speed),
	"year"
FROM
	speeds
	JOIN timetbl USING (timid)
	JOIN LOCATION USING (locid)
	JOIN car USING (carid)
GROUP BY
	"year";

-- REPORT
-- 1st query: Demonstrate deviation
-- 2nd query: Drill-down once to show the other level
-- 3rd query: Add another dimension
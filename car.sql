-- YES: 'supersport' has higher avg
-- MAYBE: big variations in counts, but that is expected
SELECT
	STDDEV_POP(speed),
	AVG(speed),
	COUNT(*),
	category
FROM
	speeds
	JOIN car USING (carid)
GROUP BY
	category;

-- YES: 'OpelAstra-FX' and 'SkodaOctavia-Si' have high avg and stddev for thier category
SELECT
	STDDEV_POP(speed),
	AVG(speed),
	category,
	model
FROM
	speeds
	JOIN car USING (carid)
GROUP BY
	category, model;

-- YES: 'supersport' has higher avg
SELECT
	STDDEV_POP(speed),
	AVG(speed),
	model
FROM
	speeds
	JOIN car USING (carid)
WHERE category = 'supersport'
GROUP BY
	model;

-- YES error: 'suv' does not have any suv modelles
SELECT
	STDDEV_POP(speed),
	AVG(speed),
	model
FROM
	speeds
	JOIN car USING (carid)
WHERE category = 'suv'
GROUP BY
	model;
	
-- YES: 'CO-44-35' ('OpelAstra-FX') and 'UH-98-94' ('SkodaOctavia-Si') have high avg
SELECT
	STDDEV_POP(speed),
	AVG(speed),
	category,
	model,
	numberplate
FROM
	speeds
	JOIN car USING (carid)
GROUP BY
	category, model, numberplate
ORDER BY
	"avg" DESC;
-- NO: diff in country or region for their region
SELECT
	STDDEV_POP(speed),
	AVG(speed),
	model,
	numberplate,
	region
FROM
	speeds
	JOIN car USING (carid)
	JOIN "location" USING (locid)
WHERE
	numberplate = 'CO-44-35'
	OR numberplate = 'UH-98-94'
GROUP BY
	model,
	numberplate,
	region
ORDER BY
	"avg" DESC;
-- NO: diff in year och month
SELECT
	STDDEV_POP(speed),
	AVG(speed),
	model,
	numberplate,
	"month"
FROM
	speeds
	JOIN car USING (carid)
	JOIN timetbl USING (timid)
WHERE
	numberplate = 'CO-44-35'
	OR numberplate = 'UH-98-94'
GROUP BY
	model,
	numberplate,
	"month"
ORDER BY
	"avg" DESC;
	
-- Error: Models that are in multiple categories
SELECT
    category,
    model
FROM
    car
WHERE
    model in(
        SELECT
            c.model FROM car AS c
        GROUP BY
            c.model
        HAVING
            COUNT(DISTINCT c.category) > 1)
GROUP BY
    category,
    model
ORDER BY
    model;
    
-- Error: Numberplates that have multiple cars
SELECT
    category,
    model,
    numberplate
FROM
    car
WHERE
    numberplate in(
        SELECT
            c.numberplate FROM car AS c
        GROUP BY
            c.numberplate
        HAVING
            COUNT(*) > 1)
ORDER BY
    numberplate;
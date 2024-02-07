-- YES: 'supersport' has higher avg
SELECT
	STDDEV_POP(speed),
	AVG(speed),
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
SELECT DISTINCT
    category,
    model
FROM
    car
ORDER BY
    category;

SELECT DISTINCT
    category,
    model
FROM
    car
WHERE
    category = 'suv';

SELECT DISTINCT
    category,
    model
FROM
    car
WHERE
    category = 'supersport';
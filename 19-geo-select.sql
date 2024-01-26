USE metro_cdmx;

-- Calculamos en metros con datos quemados
SELECT
ST_Distance_Sphere(
    POINT(-99.14912224, 19.42729875),
    POINT(-99.13303971, 19.42543703)
) AS distance;


-- Calculamos en kilometros con datos quemados
SELECT
ST_Distance_Sphere(
    POINT(-99.14912224, 19.42729875),
    POINT(-99.13303971, 19.42543703)
) / 1000 AS distance;

-- Calculamos en kilometros con consultas anidadas
SELECT
ST_Distance_Sphere(
    (
        SELECT `locations`.`location`
        FROM `locations`
        INNER JOIN `stations`
        ON `stations`.`id` = `locations`.`station_id`
        WHERE `stations`.`name` = "Balderas"
    ),
    (
        SELECT `locations`.`location`
        FROM `locations`
        INNER JOIN `stations`
        ON `stations`.`id` = `locations`.`station_id`
        WHERE `stations`.`name` = "Pino Suarez"
    )
) / 1000 AS distance;
-- consulta anidada
SELECT ROUND(ST_Distance_Sphere (
    (
        SELECT `locations`.`location` 
        FROM `locations` 
        WHERE `locations`.`station_id` = (
            SELECT `stations`.`id`
            FROM `stations`
            WHERE `stations`.`name` = "Talismán"
        )
    ),
	(
        SELECT `locations`.`location` 
        FROM `locations` 
        WHERE `locations`.`station_id` = (
            SELECT `stations`.`id`
            FROM `stations`
            WHERE `stations`.`name` = "Hospital General"
        )
    )
) / 1000, 2) AS Distance;
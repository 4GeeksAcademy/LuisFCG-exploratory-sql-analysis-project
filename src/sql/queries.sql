

SELECT * FROM regions;
SELECT * FROM species;
SELECT * FROM climate;
SELECT * FROM observations;


-- MISSION 1
-- Your query here;
--¿Cuáles son las primeras 10 observaciones registradas?;
SELECT * FROM observations
limit 10;

-- MISSION 2
-- Your query here;
--¿Qué identificadores de región (region_id) aparecen en los datos?;
SELECT DISTINCT region_id FROM observations;
 


-- MISSION 3
-- Your query here;
--¿Cuántas especies distintas (species_id) se han observado?;
SELECT COUNT(DISTINCT species_id) AS TOTAL_SPECIES
FROM observations;


-- MISSION 4
-- Your query here;
--¿Cuántas observaciones hay para la región con region_id = 2?;
SELECT COUNT(*)FROM Observations
WHERE region_id=2;


-- MISSION 5
-- Your query here;
--¿Cuántas observaciones se registraron el día 1998-08-08?;
SELECT COUNT(*)FROM Observations
WHERE observation_date = '1998-08-08';


-- MISSION 6
-- Your query here;
--¿Cuál es el region_id con más observaciones?;
SELECT region_id, COUNT(*) AS total_observations
FROM Observations
GROUP BY region_id
ORDER BY total_observations DESC
LIMIT 1;



-- MISSION 7
-- Your query here;
--¿Cuáles son los 5 species_id más frecuentes?;
SELECT species_id, COUNT(*) AS Most_frequent
FROM Observations
GROUP BY species_id
ORDER BY Most_frequent DESC
LIMIT 5;


-- MISSION 8
-- Your query here;
--¿Qué especies (species_id) tienen menos de 5 registros?;
SELECT species_id, COUNT(*) AS Less_Common
FROM Observations
GROUP BY species_id
HAVING COUNT(*) < 5;

--MISSION 9
--¿Qué observadores (observer) registraron más observaciones?;
SELECT observer, COUNT(*) AS More_observations
FROM Observations
GROUP BY observer
ORDER BY More_observations DESC;

--MISION 10
--Muestra el nombre de la región (regions.name) para cada observación;

SELECT Observations.id, regions.name AS Region_name
FROM Observations
JOIN regions ON Observations.region_id = regions.id;

--MISSION 11
--Muestra el nombre científico de cada especie registrada (species.scientific_name);
SELECT Observations.id, species.scientific_name AS Name_of_Species
FROM Observations
JOIN species ON Observations.species_id = species.id;

--MISSION 12
--¿Cuál es la especie más observada por cada región?;
SELECT regions.name AS Region_name, species.scientific_name AS Name_of_Species,
COUNT(*) AS total_observations
FROM Observations
JOIN regions ON Observations.region_id = regions.id
JOIN species ON Observations.species_id = species.id
GROUP BY regions.name, species.scientific_name
ORDER BY regions.name, total_observations DESC;
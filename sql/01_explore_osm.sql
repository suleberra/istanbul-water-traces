-- 01_explore_osm.sql
-- Purpose: inspect the OSM tables created by osm2pgsql
-- This script helps identify which tables/columns are useful for the street-name analysis.


-- Finding:
-- planet_osm_line contains street geometries and attributes.
-- planet_osm_roads is a generalized rendering subset and is not used.


-- List all the tables names created by osm2pgsql
SELECT table_name
  FROM information_schema.tables
 WHERE table_schema='public'
   AND table_type='BASE TABLE';

-- List all main tables row counts
SELECT 'planet_osm_point' AS table_name, COUNT(*) FROM planet_osm_point
UNION ALL
SELECT 'planet_osm_line', COUNT(*) FROM planet_osm_line
UNION ALL
SELECT 'planet_osm_polygon', COUNT(*) FROM planet_osm_polygon
UNION ALL
SELECT 'planet_osm_roads', COUNT(*) FROM planet_osm_roads;

-- List column names and data_types for all main tables, order them as they appear in the table
SELECT
	table_name,
    column_name,
    data_type
FROM
    information_schema.columns
WHERE
	table_schema = 'public'
	AND
    table_name IN (
		'planet_osm_point',
		'planet_osm_line',
		'planet_osm_polygon',
		'planet_osm_roads'
	)
ORDER BY
	table_name,
	ordinal_position;

-- See what streets/roads consist of multiple lines
SELECT
    name,
    COUNT(*) AS count
FROM planet_osm_line
WHERE highway IS NOT NULL
  AND name ILIKE '%dere%'
GROUP BY name
ORDER BY count DESC;

-- See if there is a consistency in the naming of the streets/roads
SELECT
    name,
    COUNT(*) AS count
FROM planet_osm_line
WHERE highway IS NOT NULL
  AND name ILIKE '%dere%'
GROUP BY name
ORDER BY name;

-- Show the administrative boundary of Istanbul(or another city)
SELECT * 
FROM public.planet_osm_polygon
WHERE boundary = 'administrative'
    AND name ILIKE '%İstanbul%';
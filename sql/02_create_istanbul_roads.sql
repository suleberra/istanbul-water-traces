-- 02_create_istanbul_roads.sql
-- Purpose: Create a view of roads that are in the boundaries of Istanbul.
-- This script creates a view of all the roads in Istanbul by using the administrative boundary polygon from osm.


-- Create a view for temporary insteption of the streets that are withing the administrative boundary of Istanbul
CREATE VIEW istanbul_roads AS
SELECT
    lines.osm_id AS id,
    boundaries.name AS boundary_name,
    boundaries.boundary,
    lines.osm_id,
    lines.name AS street_name,
    lines.highway,
    lines.way
FROM planet_osm_polygon AS boundaries
JOIN planet_osm_line AS lines
    ON ST_Intersects(boundaries.way, lines.way)
WHERE boundaries.name = 'İstanbul'
  AND lines.highway IS NOT NULL;
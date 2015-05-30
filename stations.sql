CREATE TABLE london_stations(
station character(80),
latitude float,
longitude float,
zone integer,
postcode character(10)
);



\copy london_stations FROM 'C:\\Users\\rsullivan\\python_sandbox\\cycle-save\\stations.csv'

ALTER TABLE london_stations ADD COLUMN gid serial PRIMARY KEY;

ALTER TABLE london_stations ADD COLUMN geom geometry (POINT, 4326);

UPDATE london_stations SET geom = ST_SetSRID(ST_MakePoint(longitude,latitude),4326);

CREATE INDEX idx_london_stations_geom ON london_stations USING GIST(geom);




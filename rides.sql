CREATE TABLE users_rides(
	id serial PRIMARY KEY,
	activity_id integer,
	start_latitude float,
	start_longitude float,
	end_latitude float,
	end_longitude float,
	start_station character(80),
	end_station character(80),
	start_zone integer,
	end_zone integer,
	start_date timestamp
);

# add some activity data
INSERT INTO users_rides (activity_id, start_latitude, start_longitude, end_latitude, end_longitude, start_date) VALUES(313122865, 51.53, -0.09, 51.44, -0.11, TIMESTAMP '2015-05-27T20:14:30Z');

#Create a geom_start and geom_end

ALTER TABLE users_rides ADD COLUMN geom_start geometry(POINT, 4326);

ALTER TABLE users_rides ADD COLUMN geom_end geometry(POINT, 4326);

#set the geom_start and geom_end values
UPDATE users_rides SET geom_start = ST_SetSRID(ST_MakePoint(start_longitude,start_latitude),4326);
# Query adapted from PostGis Essentials
# https://www.safaribooksonline.com/library/view/postgis-essentials/9781784395292/ch04s05.html

SELECT st.station, st.zone, ST_Distance(st.geom, ride.geom_start) * 69.00 AS distance 
FROM london_stations as st INNER JOIN users_rides as ride ON (ride.activity_id = 313122865)
WHERE ST_DWithin(st.geom, ride.geom_start, 1/69.00)
ORDER BY distance ASC LIMIT 1;

SELECT st.station, st.zone, ST_Distance(st.geom, ride.geom_end) * 69.00 AS distance 
FROM london_stations as st INNER JOIN users_rides as ride ON (ride.activity_id = 313122865)
WHERE ST_DWithin(st.geom, ride.geom_end, 1/69.00)
ORDER BY distance ASC LIMIT 1;
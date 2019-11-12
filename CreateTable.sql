-- stations table
Drop TABLE if exists stations
CREATE TABLE stations (
 station VARCHAR(12) primary key not NULL,
 name VARCHAR(50) not null,
 latitude float NOT NULL,
 longitude float not null,
 elevation float not null
);
-- import data from "Resources/hawaii_stations.csv"
select * from stations

-- measurements table
Drop TABLE if exists measurements
CREATE TABLE measurements (
 --id serial primary key NOT NULL,
 station VARCHAR(12) not NULL,
 date DATE NOT NULL,
 prcp float,
 tobs float not null
);
-- import data from "Resources/hawaii_measurements.csv"
select * from measurements

alter table measurements
	add constraint measurements_fk
		foreign key (station) references stations;

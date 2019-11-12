select max(date)-365 from measurements

select date,prcp from measurements where date > (select max(date)-365 from measurements)

select date,prcp from measurements where date > '2016-08-23'

--Design a query to show how many stations are available in this dataset?
select count(station) from stations

--What are the most active stations?
select m.station from measurements as m , stations as s
where m.station = s.station

select m.station, count(*) frequency 
from measurements m
where prcp is not null
group by m.station
order by frequency desc

--
select m.station, sum(tobs) 
from measurements m
where tobs is not null
group by m.station
order by 2 desc

--USC00519281
select a.dt, sum(a.prcp), avg(a.tobs) from 
(select extract(month from date) dt ,prcp, tobs from measurements
where  date > (select max(date)-365 from measurements 
) and station = 'USC00519281') a
group by a.dt
order by 3 desc

select date, tobs from measurements 
where station = 'USC00519281' and date between '2016-08-23' and '2017-08-23'
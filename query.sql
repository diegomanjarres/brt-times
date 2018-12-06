with
  dep as (select * from spottings where place= 'calle100'),
  arr as (select * from spottings where place= 'heroes')
SELECT distinct dep.mac as mac_address, dep.manufacturer, dep.time as depTime, arr.time as arrTime, arr.time - dep.time as travelTime
  FROM dep join arr
  on dep.mac= arr.mac
  where dep.time <= (select min(time) from spottings where mac = dep.mac and place='calle100')
  and arr.time <= (select min(time) from spottings where mac = arr.mac and place = 'heroes')
  and arr.time > dep.time
  order by dep.time asc


  with
  arr as (select * from spottings where place= 'calle100'),
  dep as (select * from spottings where place= 'heroes')
SELECT distinct dep.mac as mac_address, dep.manufacturer, dep.time as depTime, arr.time as arrTime, arr.time - dep.time as travelTime
  FROM dep join arr
  on dep.mac= arr.mac
  where dep.time <= (select min(time) from spottings where mac = dep.mac and place='heroes')
  and arr.time <= (select min(time) from spottings where mac = arr.mac and place = 'calle100')
  and arr.time > dep.time
  order by dep.time asc

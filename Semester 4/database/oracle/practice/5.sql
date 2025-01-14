drop table WEATHER;
create table WEATHER (
City         VARCHAR2(11),
Temperature  NUMBER,
Humidity     NUMBER,
Condition    VARCHAR2(9)
);

insert into WEATHER values ('LIMA',45,79,'RAIN');
insert into WEATHER values ('PARIS',81,62,'CLOUDY');
insert into WEATHER values ('MANCHESTER',66,98,'FOG');
insert into WEATHER values ('ATHENS',97,89,'SUNNY');
insert into WEATHER values ('ATHENS',79,89,'SUNNY');
insert into WEATHER values ('CHICAGO',66,88,'RAIN');
insert into WEATHER values ('SYDNEY',69,99,'SUNNY');
insert into WEATHER values ('SPARTA',74,63,'CLOUDY');

drop table LOCATION;
create table LOCATION (
City       VARCHAR2(25),
Country    VARCHAR2(25),
Continent  VARCHAR2(25),
Latitude   NUMBER,
NorthSouth CHAR(1),
Longitude  NUMBER,
EastWest   CHAR(1)
);

insert into LOCATION values (
  'ATHENS','GREECE','EUROPE',37.58,'N',23.43,'E');
insert into LOCATION values (
  'ATHENS','GREECE','GREECE',37.58,'N',23.43,'E');
insert into LOCATION values (
  'CHICAGO','UNITED STATES','NORTH AMERICA',41.53,'N',87.38,'W');
insert into LOCATION values (
  'CONAKRY','GUINEA','AFRICA',9.31,'N',13.43,'W');
insert into LOCATION values (
  'LIMA','PERU','SOUTH AMERICA',12.03,'S',77.03,'W');
insert into LOCATION values (
  'MADRAS','INDIA','INDIA',13.05,'N',80.17,'E');
insert into LOCATION values (
  'MANCHESTER','ENGLAND','EUROPE',53.30,'N',2.15,'W');
insert into LOCATION values (
  'MOSCOW','RUSSIA','EUROPE',55.45,'N',37.35,'E');
insert into LOCATION values (
  'PARIS','FRANCE','EUROPE',48.52,'N',2.20,'E');
insert into LOCATION values (
  'SHENYANG','CHINA','CHINA',41.48,'N',123.27,'E');
insert into LOCATION values (
  'ROME','ITALY','EUROPE',41.54,'N',12.29,'E');
insert into LOCATION values (
  'TOKYO','JAPAN','ASIA',35.42,'N',139.46,'E');
insert into LOCATION values (
  'SYDNEY','AUSTRALIA','AUSTRALIA',33.52,'S',151.13,'E');
insert into LOCATION values (
  'SPARTA','GREECE','EUROPE',37.05,'N',22.27,'E');
insert into LOCATION values (
  'MADRID','SPAIN','EUROPE',40.24,'N',3.41,'W');

--   end of template

DESCRIBE location;
DESCRIBE weather;

select * from LOCATION;
select * from WEATHER;

select weather.city,
       continent,
       temperature
  from location,
       weather
 where location.city = weather.city;
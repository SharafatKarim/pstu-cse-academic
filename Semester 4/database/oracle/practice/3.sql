rem *****************
rem The COMFORT Table
rem *****************

drop table COMFORT;
create table COMFORT (
City          VARCHAR2(13) NOT NULL,
SampleDate    DATE NOT NULL,
Noon          NUMBER(3,1),
Midnight      NUMBER(3,1),
Precipitation NUMBER
);

insert into COMFORT values ('SAN FRANCISCO',
   TO_DATE('21-MAR-2003','DD-MON-YYYY'),62.5,42.3,.5);
insert into COMFORT values ('SAN FRANCISCO',
   TO_DATE('22-JUN-2003','DD-MON-YYYY'),51.1,71.9,.1);
insert into COMFORT values ('SAN FRANCISCO',
   TO_DATE('23-SEP-2003','DD-MON-YYYY'),NULL,61.5,.1);
insert into COMFORT values ('SAN FRANCISCO',
   TO_DATE('22-DEC-2003','DD-MON-YYYY'),52.6,39.8,2.3);
insert into COMFORT values ('KEENE',
   TO_DATE('21-MAR-2003','DD-MON-YYYY'),39.9,-1.2,4.4);
insert into COMFORT values ('KEENE',
   TO_DATE('22-JUN-2003','DD-MON-YYYY'),85.1,66.7,1.3);
insert into COMFORT values ('KEENE',
   TO_DATE('23-SEP-2003','DD-MON-YYYY'),99.8,82.6,NULL);
insert into COMFORT values ('KEENE',
   TO_DATE('22-DEC-2003','DD-MON-YYYY'),-7.2,-1.2,3.9);


-- End of test data for the COMFORT table

---
---
---

-- Queries

select 'A' from comfort;
select * from comfort;

select city,
       sampledate,
       precipitation
  from comfort;

select city,
       sampledate,
       precipitation
  from comfort
 where precipitation is null;

select * from comfort
    where noon is not null;

select * from comfort
    where noon is not null AND
    city not in ('SAN FRANCISCO');

select * from comfort
    where noon is not null AND
    city in ('SAN FRANCISCO');
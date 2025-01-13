select *
  from newspaper;

select feature,
       section,
       page
  from newspaper
 where section = 'A'
    or section = 'B'
   and page > 2;

select feature,
       section,
       page
  from newspaper
 where page > 2
   and ( section = 'A'
    or section = 'B' );

select feature
  from newspaper
 where section = (
   select section
     from newspaper
    where feature = 'Doctor Is In'
);


-- following query is not correct
-- it'll throw an error

select *
  from newspaper
 where section = (
   select section
     from newspaper
    where page = 1
);

select *
  from newspaper
 where section < (
   select section
     from newspaper
    where feature = 'Doctor Is In'
);

select city,
       country
  from location;
select city,
       condition
  from weather;

select city
  from weather
 where condition = 'CLOUDY';

select city,
       country
  from location
 where city in ( 'PARIS',
                 'SPARTA' );

select city,
       country
  from location
 where city in (
   select city
     from weather
    where condition = 'CLOUDY'
);
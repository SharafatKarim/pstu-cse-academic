-- Trigger Management

 --   1. Create a table named BOOKSHELF_AUDIT, also create a table named BOOKSHELF 
 --   and Insert data into BOOKSHELF table where Rating will be one attribute. 
 --   Create a row-level BEFORE UPDATE trigger which will be executed only if the Rating value is updated to BOOKSHELF table. 											

-- Drop tables if it exists
drop table bookshelf_audit;
drop table bookshelf;
drop table bookshelft_stats;

-- Create the audit table to store changes in ratings
create table bookshelf_audit (
   title        varchar2(100),
   publisher    varchar2(20),
   categoryname varchar2(20),
   old_rating   varchar2(2),
   new_rating   varchar2(2),
   audit_date   date
);

-- Select all records from the audit table
select *
  from bookshelf_audit;

-- Create the main bookshelf table
create table bookshelf (
   title        varchar2(100),
   publisher    varchar2(20),
   categoryname varchar2(20),
   rating       varchar2(2)
);

-- Select all records from the bookshelf table
select *
  from bookshelf;

-- Create a row-level trigger to audit changes in the rating column
create or replace trigger bookshelf_bef_upd_row before
   update on bookshelf
   for each row
   when (( new.rating < old.rating ) OR ( new.rating > old.rating ))
begin
   insert into bookshelf_audit (
      title,
      publisher,
      categoryname,
      old_rating,
      new_rating,
      audit_date
   ) values ( :old.title,
              :old.publisher,
              :old.categoryname,
              :old.rating,
              :new.rating,
              sysdate );
end;
/

-- Test the trigger by inserting records into the bookshelf table
insert into bookshelf values ( 'The Hobbit',
                               'Houghton Mifflin',
                               'Fantasy',
                               'A' );

insert into bookshelf values ( 'The old man and the sea',
                               'Ernest Hemingway',
                               'Tragedy',
                               'A' );

commit;

-- Select all records from the bookshelf table
select *
  from bookshelf;

-- Update a record to trigger the row-level trigger
UPDATE bookshelf
   SET rating = 'A'
   where title = 'The old man and the sea';

-- Select all records from the audit table to verify the trigger
select *
    from bookshelf_audit;

-- Create another table to store statement-level trigger actions
CREATE TABLE bookshelft_stats (
   action       varchar2(20),
   action_date  date
);

-- Create a statement-level trigger to log update actions
CREATE OR REPLACE TRIGGER bookshelf_bef_upd_stmt
   BEFORE UPDATE ON bookshelf 
BEGIN
   INSERT INTO bookshelft_stats (
      action,
      action_date
   ) VALUES ( 'UPDATE',
              sysdate );
END;
/   

-- Update multiple rows to trigger both row-level and statement-level triggers
UPDATE bookshelf
   SET rating = 'A';

-- Select all records from the audit table to verify the row-level trigger
SELECT *
  FROM bookshelf_audit;

-- Select all records from the stats table to verify the statement-level trigger
select * 
  from bookshelft_stats;

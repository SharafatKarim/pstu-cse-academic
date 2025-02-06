-- audit db
drop table bookshelf_audit;
create table bookshelf_audit (
   title        varchar2(100),
   publisher    varchar2(20),
   categoryname varchar2(20),
   old_rating   varchar2(2),
   new_rating   varchar2(2),
   audit_date   date
);

select *
  from bookshelf_audit;

create table bookshelf (
   title        varchar2(100),
   publisher    varchar2(20),
   categoryname varchar2(20),
   rating       varchar2(2)
);
select *
  from bookshelf;

-- set triggers
-- create or replace trigger bookshelf_bef_upd_row before
--    update on bookshelf
--    for each row
--    when ( new.rating < old.rating )
-- begin
--    insert into bookshelf_audit (
--       title,
--       publisher,
--       categoryname,
--       old_rating,
--       new_rating,
--       audit_date
--    ) values ( :old.title,
--               :old.publisher,
--               :old.categoryname,
--               :old.rating,
--               :new.rating,
--               sysdate );
-- end;

-- test trigger
insert into bookshelf values ( 'The Hobbit',
                               'Houghton Mifflin',
                               'Fantasy',
                               'A' );

select *
  from bookshelf;

UPDATE bookshelf
   SET rating = 'B';
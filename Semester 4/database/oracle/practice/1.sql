DROP TABLE NEWSPAPER;

create table NEWSPAPER (
  Feature VARCHAR2(15) not null,
  Section CHAR(1),
  Page NUMBER
);

DESCRIBE NEWSPAPER;

INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Headline', 'A', 1.5);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Weather', 'A', 1);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Sports', 'B', 1);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Comics', 'B', 2);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Editorial', 'A', 2);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Business', 'C', 1);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Obituaries', 'C', 2);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Classifieds', 'C', 3);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Crossword', 'B', 3);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('TV Listings', 'A', 3);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Stocks', 'C', 4);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Horoscope', 'B', 4);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Births', 'C', 5);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Deaths', 'C', 5);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Anniversaries', 'C', 5);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Movies', 'A', 4);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Recipes', 'B', 5);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Travel', 'A', 5);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Fashion', 'A', 6);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Gardening', 'B', 6);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Health', 'C', 6);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Pets', 'C', 6);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Home', 'A', 7);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Automotive', 'B', 7);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Education', 'C', 7);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Technology', 'C', 7);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Science', 'A', 8);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Music', 'B', 8);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Dance', 'C', 8);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Theater', 'C', 8);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Art', 'A', 9);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Books', 'B', 9);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Food', 'C', 9);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Wine', 'C', 9);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Beer', 'A', 10);
INSERT INTO NEWSPAPER (Feature, Section, Page) VALUES ('Spirits', 'B', 10);

INSERT ALL 
  INTO NEWSPAPER (Feature, Section, Page) VALUES ('Headline', 'A', 1)
  INTO NEWSPAPER (Feature, Section, Page) VALUES ('Weather', 'A', 1)
  INTO NEWSPAPER (Feature, Section, Page) VALUES ('Sports', 'B', 1)
  INTO NEWSPAPER (Feature, Section, Page) VALUES ('Comics', 'B', 2)
  INTO NEWSPAPER (Feature, Section, Page) VALUES ('Editorial', 'A', 2)
  INTO NEWSPAPER (Feature, Section, Page) VALUES ('Business', 'C', 1)
  INTO NEWSPAPER (Feature, Section, Page) VALUES ('Obituaries', 'C', 2)
  INTO NEWSPAPER (Feature, Section, Page) VALUES ('Classifieds', 'C', 3)
  INTO NEWSPAPER (Feature, Section, Page) VALUES ('Crossword', 'B', 3)
  INTO NEWSPAPER (Feature, Section, Page) VALUES ('TV Listings', 'A', 3)
  INTO NEWSPAPER (Feature, Section, Page) VALUES ('Stocks', 'C', 4)
  INTO NEWSPAPER (Feature, Section, Page) VALUES ('Horoscope', 'B', 4)
  INTO NEWSPAPER (Feature, Section, Page) VALUES ('Births', 'C', 5)
SELECT 1 FROM DUAL;

SELECT * FROM NEWSPAPER;
SELECT PAGE, SECTION, FEATURE FROM NEWSPAPER;

SET FEEDBACK OFF;
SET FEEDBACK ON;
SET FEEDBACK OFF;
SET FEEDBACK 10;
SHOW FEEDBACK;

SET NUMWIDTH 10;
SET NUMWIDTH 5;  
SHOW NUMWIDTH;

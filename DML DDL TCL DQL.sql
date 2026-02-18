Commands:
--------------
1. DDL :[ Data Definition Language ]
----------
1. Create--To create a new database object 
2. Alter--To modify the structure of an existing database object
3. Rename--To rename a table or column.
4. Drop--To delete an object (like a table or database) permanently.
5. Truncate--To remove all rows from a table, but keep its structure for future use.

2. DML:[Data Manipulation Language]
-----------
1. Insert--To add new records (rows) into a table.
2. Update--To modify existing records in a table.
3. Delete--To remove specific rows from a table based on a condition.

3. TCL:[Transaction Control Language]
----------
1. Commit--To save all the changes made during the current transaction permanently in the database.
2. Rollback--To undo changes made during the current transaction if something goes wrong.
3. Save point--To set a point within a transaction to which you can roll back later, instead of rolling back the entire transaction.

4. DQL:[DATA QUERY LANGUAGE] 
-----------
1. Select--To retrieve data from one or more tables in a database




*************************************************************************
*************************************************************************
USE ORGANISATION;
1. Create :
---------------
Syntax:
----------
Create Table Tablename(Id Number primary key,
					Name Varchar(30));
create schema asif;
use asif;
EXAMPLE:
---------
CREATE TABLE STUDENT (
    ID INT primary key,
    Name VARCHAR(100),
    MARK INT
);
drop table student;
select * from student;

2.INSERT:
-----------
Syntax:
-------;
INSERT INTO STUDENT VALUES(2,3,1);
INSERT INTO STUDENT VALUES(2,'RAMESH');
INSERT INTO STUDENT VALUES(3,'SURESH',472);
INSERT INTO STUDENT VALUES(4,'POORNA',418);
commit;
2.ALTER:
----------
SYNTEX:
---------
Alter table STUDENT ADD COLUMN (RANKING INT);


ALTER TABLE STUDENT DROP COLUMN RANKING;


ALTER TABLE STUDENT
RENAME TO Toppers;


ALTER TABLE student RENAME COLUMN MARK TO MARKS;



3.RENAME:
---------
Syntax:
-------
RENAME TABLE  TOPPERS TO  STUDENT

SET SQL_SAFE_UPDATES=0;
select * from student;
4.UPDATE:
--------
SYNTAX:
---------;
SELECT * FROM toppers;

UPDATE STUDENT
SET MARKs = 444 WHERE NAME='POORNA';

SELECT * FROM STUDENT;

5.DELETE:
---------
SYNTAX:
---------;

Delete from STUDENT where name ='Poorna' ;

SELECT * FROM student;
TRUNCATE IT CANT ROLLBACK,DELETE ALL DATAS WITHOUT CHANGING TABLE STRUCTURE;
----------;

SELECT * FROM STUDENT;
TRUNCATE TABLE STUDENT;

7.COMMIT:
--------
SYNTEX:
-------
To save all the changes made during the current transaction permanently in the database.


UPDATE TOPPERS
SET MARKS = 444 WHERE NAME='POORNA'

COMMIT;

8.ROLLBACK:
-----------

To undo changes made during the current transaction if something goes wrong.

ROLLBACK;

9.SAVEPOINT;

Save point--To set a point within a transaction to which you can roll back later, instead of rolling back the entire transaction.

BEGIN;

UPDATE STUDENT SET MARKS = 425 WHERE ID = 3;
SAVEPOINT sp1

UPDATE STUDENT SET MARKS = 450 WHERE ID = 2;
ROLLBACK TO sp1;

COMMIT;


DROP schema org;










BESANT  - BES
123456

SUBSTR;

IT IS SUBSET OF THE STRING
IT HAS THREE PARAMETERS
1ST - INPUT
2ND - STARTING POSITION, CAN BE NEAGTIUVE
3RD - HOW MANY CHARCATERS NEEDED- OPTIONAL
WHEN 3RD PARAMTEER NOT PROVIDED. THEN IT WILL FETCH ALL CHARCATERS 
TILL THE END FROM THE STARTING POSITION;


USE ORGANISATION;
SELECT SUBSTR('BESANT ',2) FROM DUAL;

SELECT SUBSTR(LAST_NAME,1,3),LAST_NAME FROM EMPLOYEES;


select concat(first_name,' ',substr(last_name,1,1)) as name from employees;

SELECT FIRST_NAME,SUBSTR(FIRST_NAME,2,4) FROM EMPLOYEES;
SELECT SUBSTR('BESANT TECHNOLOGIES',6,3) FROM DUAL;
SELECT SUBSTR('BESANT   TECHNOLOGIES',3) FROM DUAL;
SELECT SUBSTR('BESANT  TECHNOLOGIES',-3) FROM DUAL;
SELECT SUBSTR('BESANT  TECHNOLOGIES',-3,2) FROM DUAL;

USE ORGANISATION;
SELECT * FROM EMPLOYEES;

SELECT CONCAT(FIRST_NAME,' ' ,salary) AS NAME FROM EMPLOYEES;

SELECT CONCAT(FIRST_NAME, ' ', SUBSTR(LAST_NAME, 1, 1)) AS FULLNAME
FROM EMPLOYEES;

SELECT CONCAT(FIRST_NAME,'_',substr(LAST_NAME,1,1),'@besant.com') as email from employees;

SELECT length(' Besant ') FROM dual;


INSTR:
IT RETURNS POSITION OF THE CHARCATER FROM THE STRING
IT HAS FOUR PARAMETERS
FRST PARAMETER- INPUT
SECOND PARAMETER- SEARCHING CHARCATER
THRD PAREMETR - STARTING POsITION
FORUTH PARAMETER - OCCURENCE OF THE CARACTER- OPTIONAL
IF FORTH IS NO PROIVDED THEN IT WIL TAKE THE FIRST OCCIURENCE;

SELECT LOCATE('O', 'BESANT  TECHNOLOGIES', 15,1);

SELECT INSTR('BESANT TECHNOLOGIES', 'TECHNOLOGIES');

SELECT INSTR('BESANT TECHNOLOGIES','M',-10,1) FROM DUAL;
SELECT INSTR('BESANT TECHNOLOGIES','O',1,1) FROM DUAL;
SELECT INSTR('BESANT TECHNOLOGIES','O',6,1) FROM DUAL;
SELECT INSTR('BESANT TECHNOLOGIES','O',1,2) FROM DUAL;
SELECT INSTR('BESANT TECHNOLOGIES','O',6,2) FROM DUAL;
SELECT INSTR('BESANT TECHNOLOGIES','O',14,1) FROM DUAL;


Reverse;

SELECT FIRST_NAME,REVERSE(FIRST_NAME) FROM EMPLOYEES;


PATTERN BASED REPLAECMENGT
1ST - INPUT
2ND- SEARCHING PATTERN
3RD- REPLACIONG PATTERN - OPTIONA
WHEN 3RD PAREMETR NOT PROVIDED THEN THE SERCHING PATTERN WILL GTE REMOVED


REPLACE;

SELECT REPLACE('BESANT   TECH','NT','*********') FROM DUAL;
SELECT REPLACE('BESANTTECH','NTT','') FROM DUAL;
SELECT REPLACE('BESANT TECH','NT T','*') FROM DUAL;
SELECT REPLACE('BESANT TECH NT','NTT','      ') FROM DUAL;
SELECT REPLACE('BESANT TECH NT T','NT T','*%') FROM DUAL;
SELECT length(REPLACE('BESANT TECH NT T','NT T','')) FROM DUAL;
SELECT REPLACE('BESANT TECH NT T','NT T','') FROM DUAL;




Ltrim
-------------; Oracle
IT REMOVED LEADING SPACES;

SELECT '   BESANT  ',LTRIM('   BESANT  '),LENGTH('   BESANT  '),
LENGTH(LTRIM('   BESANT  ')) FROM DUAL;



SELECT 'BESANT  ',LTRIM('BESANT  ','BES') FROM DUAL;
SELECT 'BESANT  ',LTRIM('BBESANT ') FROM DUAL;
SELECT 'BESANT  ',LTRIM('   BESANT ','B') FROM DUAL;


Rtrim
-----------;
SELECT '   BESANT  ',RTRIM('   BESANT   ') FROM DUAL;
SELECT 'BESANT  ',RTRIM('BESANT ','T') FROM DUAL;
SELECT 'BESANT  ',RTRIM('BESANT','NT') FROM DUAL;
SELECT 'BESANT  ',RTRIM('   BESANT  ','T') FROM DUAL;--DOES NOTHING

Length
----------;
SELECT LENGTH(' BESANT  '),LENGTH('BESANT ') FROM DUAL;
use organisation;
SELECT FIRST_NAME,LENGTH(FIRST_NAME) FROM EMPLOYEES;

Upper
---------;
SELECT FIRST_NAME,UPPER(FIRST_NAME) FROM EMPLOYEES;

Lower
-----------;
SELECT FIRST_NAME,LOWER(FIRST_NAME) FROM EMPLOYEES;


Concat
-------------;
SELECT Concat(FIRST_NAME,' ',LAST_NAME,' ',Department_id) FROM EMPLOYEES;
use organisation;
Lpad
---------;
SELECT FIRST_NAME,LPAD(FIRST_NAME,11,'*') FROM EMPLOYEES;
SELECT FIRST_NAME,LPAD(FIRST_NAME,11,'*1') FROM EMPLOYEES;
SELECT FIRST_NAME,LPAD(FIRST_NAME,13,'121212') FROM EMPLOYEES;

Rpad
---------;
SELECT FIRST_NAME,RPAD(FIRST_NAME,11) FROM EMPLOYEES;
SELECT FIRST_NAME,RPAD(FIRST_NAME,4,'*') FROM EMPLOYEES;
SELECT LENGTH(FIRST_NAME),LENGTH(RPAD(FIRST_NAME,11,'*')) FROM EMPLOYEES;


union;

select 'apple'  from dual
UNION   
select 'orange' from dual
union  
select  'apple' from dual;

SELECT * FROM EMPLOYEES; 

USE ORGANISATION;
select employee_id,first_name from employees where employee_id =100
union
select "Steven",100 from dual;
SELECT * FROM DEPARTMENTS;

select department_id,department_name from departments 
minus
select 10,"Administration" from dual; --where employee_id in (100,101,102,106,107,108);

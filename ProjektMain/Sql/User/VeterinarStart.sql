-- ako veterinar vec postoji, ovo ce ga izbrisat
DROP USER veterinar CASCADE /
-----------------------------------------


-- Kao SYS

-----------------------------------------
-- maknuti komentar od DATAFILE, 1. je za linx, 2. je za win
CREATE TABLESPACE veterinar LOGGING
  DATAFILE '/lib/oracle/oradata/XE/veterinar.ora'
  --DATAFILE 'C:\oraclexe\app\oracle\oradata\xe\veterinar.ora'
  SIZE 100M REUSE AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED
  EXTENT MANAGEMENT LOCAL
/

-- veterinar_sys user, to je admin baze
----------------------------------------------------------------------

create user veterinar_sys identified by 1234  DEFAULT TABLESPACE veterinar;

grant CREATE SESSION, ALTER SESSION, CREATE DATABASE LINK, CREATE MATERIALIZED VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM, CREATE ROLE, CREATE SEQUENCE, CREATE SYNONYM, CREATE TABLE, CREATE TRIGGER, CREATE TYPE, CREATE VIEW, UNLIMITED TABLESPACE  to veterinar_sys;

ALTER USER veterinar_sys  QUOTA UNLIMITED ON veterinar;
----------------------------------------------------------------------



-- racunovoda user
----------------------------------------------------------------------
----------------------------------------------------------------------

-- doktor user
----------------------------------------------------------------------
----------------------------------------------------------------------


-- voditelj_odjela user
----------------------------------------------------------------------
----------------------------------------------------------------------


-----------------------------------------


-- Kao SYS


-----------------------------------------


-- Još Uvijek kao SYS



create role vet_sys/

grant CREATE SESSION, ALTER SESSION, CREATE DATABASE LINK, CREATE MATERIALIZED VIEW, CREATE PROCEDURE,
      CREATE PUBLIC SYNONYM, CREATE ROLE, CREATE SEQUENCE, CREATE SYNONYM, CREATE TABLE, CREATE TRIGGER,
      CREATE TYPE, CREATE VIEW, UNLIMITED TABLESPACE,GRANT ANY ROLE,GRANT ANY PRIVILEGE,ALTER USER,CREATE USER, CREATE TABLESPACE, CREATE ANY SYNONYM
    , DROP USER, EXECUTE ANY PROCEDURE to vet_sys;

create user veterinar_sys identified by 1234 /
grant vet_sys to veterinar_sys/





-- maknuti komentar od DATAFILE, 1. je za linx, 2. je za win
CREATE TABLESPACE veterinar --LOGGING
    DATAFILE '/lib/oracle/oradata/XE/veterinar.ora'
  --DATAFILE 'C:\oraclexe\app\oracle\oradata\xe\veterinar.ora'
    SIZE 500M REUSE AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED
    EXTENT MANAGEMENT LOCAL
/


ALTER USER veterinar_sys  DEFAULT TABLESPACE veterinar/
ALTER USER veterinar_sys  QUOTA UNLIMITED ON veterinar;

-----------------------------------------


-- SAD Veterinar_START_Veterinar_SYS.sql


-----------------------------------------
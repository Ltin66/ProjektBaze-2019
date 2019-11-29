-- ako veterinar vec postoji, ovo ce ga izbrisat

-- sve se radi kao SYS osim ku ne pise drugacije

DROP USER veterinar_sys CASCADE /
DROP TABLESPACE veterinar  /
DROP ROLE vet_sys/
DROP ROLE racunovoda/
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

-- Još Uvijek KAO SYS


--ROLES
--Kreiranje uloga
------------------------------------------------------------------
create role vet_sys/

grant CREATE SESSION, ALTER SESSION, CREATE DATABASE LINK, CREATE MATERIALIZED VIEW, CREATE PROCEDURE,
      CREATE PUBLIC SYNONYM, CREATE ROLE, CREATE SEQUENCE, CREATE SYNONYM, CREATE TABLE, CREATE TRIGGER,
      CREATE TYPE, CREATE VIEW, UNLIMITED TABLESPACE,GRANT ANY ROLE,GRANT ANY PRIVILEGE,ALTER USER,CREATE USER to vet_sys;

create user veterinar_sys identified by 1234  DEFAULT TABLESPACE veterinar/
grant vet_sys to veterinar_sys/
ALTER USER veterinar_sys  QUOTA UNLIMITED ON veterinar;
------------------------------------------------------------------

-- PRVO SE MORAJU KREIRATI TABLICE I SL. PRIJE DODAVANJA OSTaLIH ULOGA, tablice se dodaju kao veterinar_sys

-- SAD KAO veterinar_sys DODAVANJE ULOGA I KORISNIKA, samo da izgleda kao da ih je on napravio


--jos ce se to promijenit ali samo za testiranje je tako

create role racunovoda/

grant CREATE SESSION to racunovoda/  --da bi se mogao taj user spojiti na bazu
grant select on ZAPOSLENIK to racunovoda/
grant select on RADNI_STATUS to racunovoda/
grant select on RADNI_STATUS_TIP to racunovoda/
grant select on ZAPOSLENICI_DOLAZAK to racunovoda/
grant select on ZAPOSLENICI_ODSUTNOST to racunovoda/
grant select on ODSUTNOST_TIP to racunovoda/

------------------------------------------------------------------

create role doktor/

grant CREATE SESSION to racunovoda/  --da bi se mogao taj user spojiti na bazu

------------------------------------------------------------------

create role voditelj_odjela/

grant CREATE SESSION to racunovoda/  --da bi se mogao taj user spojiti na bazu




--USERI

-- mirkomirkec# :

-- 1 - voditelj
-- 2 - doktor
-- 3 - racunovoda

-- useri koji su racunovode
----------------------------------------------------------------------
create user mirkomirkec3 identified by 1234  DEFAULT TABLESPACE veterinar/
grant racunovoda to mirkomirkec3/
ALTER USER mirkomirkec3  QUOTA UNLIMITED ON veterinar;  -- dajemo useru max memoriju na alociranje ?

----------------------------------------------------------------------

-- koji su doktori
----------------------------------------------------------------------
create user mirkomirkec2 identified by 1234  DEFAULT TABLESPACE veterinar/
grant doktor to mirkomirkec2/
ALTER USER mirkomirkec2  QUOTA UNLIMITED ON veterinar;  -- dajemo useru max memoriju na alociranje ?


----------------------------------------------------------------------


-- useri koji su voditelj_odjela
----------------------------------------------------------------------
create user mirkomirkec1 identified by 1234  DEFAULT TABLESPACE veterinar/
grant voditelj_odjela to mirkomirkec1/
ALTER USER mirkomirkec1  QUOTA UNLIMITED ON veterinar;  -- dajemo useru max memoriju na alociranje ?


----------------------------------------------------------------------






--ROLE UPITI to je za program da ne zaboravim


--kao sys vraca role od svakog
SELECT *
  FROM USER_ROLE_PRIVS ;


-- trebao bi vratiti role, TAJ !!!!
select * from USER_ROLE_PRIVS where USERNAME= USER;


-- neznam
select * from USER_TAB_PRIVS where Grantee = USER;


-- upit koji vraca privilegije trenutnog usera, neradi na useru, nebitno,nmvz
select * from USER_SYS_PRIVS where USERNAME = USER;



--OVO NE TREBA !!!!!!!!!!!!!!!!!!!

-- veterinar_sys je (izmišljeni) admin u veterinarskoj stanici a vet_tester je za nas, nebitno koji koristite, isti su
----------------------------------------------------------------------

-- veterinar  tester ce uvijek biti dostupan kao user sa admin privilegijama, ako oni role naredbe nešto zeznu ("backwards compatability") ili tak neš
create user veterinar_tester identified by 1234  DEFAULT TABLESPACE veterinar;

grant CREATE SESSION, ALTER SESSION, CREATE DATABASE LINK, CREATE MATERIALIZED VIEW, CREATE PROCEDURE, CREATE PUBLIC SYNONYM, CREATE ROLE, CREATE SEQUENCE, CREATE SYNONYM, CREATE TABLE, CREATE TRIGGER, CREATE TYPE, CREATE VIEW, UNLIMITED TABLESPACE  to veterinar_tester;

ALTER USER veterinar_tester  QUOTA UNLIMITED ON veterinar;
----------------------------------------------------------------------

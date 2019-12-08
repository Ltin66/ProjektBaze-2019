

create role racunovoda/

grant CREATE SESSION to racunovoda/  --da bi se mogao taj user spojiti na bazu
grant create synonym to racunovoda/
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

----------------------------------------------------------------------
--
--                  FUNKCIJE ZA DODAVANJE KORISNIKA BAZE
--
----------------------------------------------------------------------



CREATE OR REPLACE PROCEDURE create_user_racunovoda
    (user_name IN Varchar,passwd IN Varchar)
    AS
    ex_stmt   VARCHAR2 (1000);
    BEGIN

        -- stvori usera
        ex_stmt := 'create user ' || user_name || ' identified by ' || passwd || ' DEFAULT TABLESPACE  veterinar';
        EXECUTE IMMEDIATE (ex_stmt);

        -- grantaj mu role
        ex_stmt := 'grant racunovoda to ' || user_name;
        EXECUTE IMMEDIATE (ex_stmt);

        ex_stmt := 'ALTER USER '|| user_name || ' QUOTA UNLIMITED ON veterinar';
        EXECUTE IMMEDIATE (ex_stmt);




    end;







--USERI

-- mirkomirkec# :

-- 1 - voditelj
-- 2 - doktor
-- 3 - racunovoda

-- parni su doktori, neparni su racunovode

-- useri koji su racunovode
----------------------------------------------------------------------
create user mirkomirkec3 identified by 1234  DEFAULT TABLESPACE veterinar/
grant racunovoda to mirkomirkec3/
ALTER USER mirkomirkec3  QUOTA UNLIMITED ON veterinar;  -- dajemo useru max memoriju na alociranje ?

/*
select * from ZAPOSLENIK;
create synonym ZAPOSLENIK for VETERINAR_SYS.ZAPOSLENIK;
*/
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


















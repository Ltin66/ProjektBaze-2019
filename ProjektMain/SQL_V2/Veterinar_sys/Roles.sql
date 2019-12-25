

----------------------------------------------------------------------
--
--                  ROLES
--
----------------------------------------------------------------------
SELECT * FROM AMBULANTA;

create user mirkomirkec4 identified by 1234;
grant doktor to mirkomirkec4;





create synonym mirkomirkec4.INSERTAMBULANTA for veterinar_sys.INSERTAMBULANTA;
alter user mirkomirkec4 quota unlimited on veterinar;


BEGIN
   INSERTAMBULANTA(8, 12, TO_DATE('08.02.2008 11:30:00', 'DD.MM.YYYY hh24:mi:ss'), 'Zaštitna cijepila - Mačka');
END;


create role racunovoda/

grant CREATE SESSION to racunovoda/  --da bi se mogao taj user spojiti na bazu
grant select on KORISNIK_VIEW to racunovoda;
grant execute on RACUNOVODA_PACK to racunovoda;

--grant select on ZAPOSLENIK to racunovoda/
--grant select on ODSUTNOST_TIP to racunovoda/
--grant execute on INSERTZIVOTINJA to racunovoda/


/*
Popis Zaposlenika
izracun place
unos zaposlenika

raspored
unos rasporeda
unos dolaska

 */


------------------------------------------------------------------

create role doktor/

grant CREATE SESSION to doktor/  --da bi se mogao taj user spojiti na bazu
grant execute on DOKTOR_PACK to doktor;
grant select on DOKTOR_TIPOVI_ZIVOTINJA to doktor;
grant select on DOKTOR_TIPOVI_USLUGA to doktor;
grant select on KORISNIK_VIEW to doktor;
grant select on KOR_INFO to doktor;

--grant execute on/
--grant select on ZAPOSLENIK to doktor/



/*
INSERTAMBULANTA
updateAMBULANTA_opis
insertKORISNIK
INSERTZIVOTINJA
INSERTKORISNIK_ZIVOTINJA
insertDOKTOR_AMBULANTA
View Tipovi Usluga
View Prikaz Usluga
selectAMBULANTA
ZAKAZANIPregledi
Info o Ambulanti
Korisnici i njihove zivotinje
 */


------------------------------------------------------------------

create role voditelj_odjela/
grant CREATE SESSION to voditelj_odjela/  --da bi se mogao taj user spojiti na bazu
grant execute on VODITELJ_ODJELA_PACK to voditelj_odjela;

/*
Informacije o Doktorima

dodavanje doktora na pregled
brisanje doktora sa pregleda
brisanje korisnika

brisanje zivotinje

prikaz svih inspekcija
dodavanje inspekcije
dodavanje doktora na inspekciju

zakazane inspekcije

izmjena opisa inspekcija

 */


----------------------------------------------------------------------
--
--                  FUNKCIJE ZA DODAVANJE KORISNIKA BAZE
--
----------------------------------------------------------------------

-- create synonym mirkomirkec3.zaposlenik for veterinar_sys.ZAPOSLENIK;  --BITNO

--radi, radi
CREATE OR REPLACE PROCEDURE create_user_racunovoda
    (user_name IN Varchar,passwd IN Varchar)
    AUTHID CURRENT_USER
    AS
    ex_stmt_a   VARCHAR2 (1000);
    ex_stmt_b   VARCHAR2 (1000);
    BEGIN
        -- TODO : ako vec postoji vrati gresku ?
        -- stvori usera
        ex_stmt_a := 'create user ' || user_name || ' identified by ' || passwd || ' DEFAULT TABLESPACE  veterinar';
        --ex_stmt_a := 'CREATE USER mirkomirkec3 identified by 1234';
        EXECUTE IMMEDIATE ex_stmt_a;

        -- grantaj mu role
        ex_stmt_a := 'grant racunovoda to ' || user_name;
        EXECUTE IMMEDIATE (ex_stmt_a);

        -- TODO : promijeniti QUOTA UNLIMITED na neki limited quota
        -- dajemo mu prostora za rad ?
        ex_stmt_a := 'ALTER USER '|| user_name || ' QUOTA UNLIMITED ON veterinar';
        EXECUTE IMMEDIATE (ex_stmt_a);


        -- SYNONYM
        --ex_stmt_a := 'create synonym '|| user_name || '.zaposlenik  for veterinar_sys.ZAPOSLENIK';
        --EXECUTE IMMEDIATE (ex_stmt_a);

        --ex_stmt_a := 'create synonym '|| user_name || '.RADNI_STATUS for veterinar_sys.insertzaposlenik';
        --EXECUTE IMMEDIATE (ex_stmt_a);
/*
        ex_stmt_a := 'create synonym '|| user_name || '.RADNI_STATUS  veterinar';
        EXECUTE IMMEDIATE (ex_stmt_a);

        ex_stmt_a := 'create synonym '|| user_name || '.zaposlenik  veterinar';
        EXECUTE IMMEDIATE (ex_stmt_a);

        ex_stmt_a := 'create synonym '|| user_name || '.zaposlenik  veterinar';
        EXECUTE IMMEDIATE (ex_stmt_a);


*/
    end;



begin
    create_user_voditelj_odjela('mirkomirkec1','1234');
end;

select * from USER_ROLE_PRIVS where USERNAME='MIRKOMIRKEC3' ;

--radi, radi
CREATE OR REPLACE PROCEDURE create_user_voditelj_odjela
    (user_name IN Varchar,passwd IN Varchar)
    AUTHID CURRENT_USER
    AS
    ex_stmt_a   VARCHAR2 (1000);
    ex_stmt_b   VARCHAR2 (1000);
    BEGIN
        -- TODO : ako vec postoji vrati gresku ?
        -- stvori usera
        ex_stmt_a := 'create user ' || user_name || ' identified by ' || passwd || ' DEFAULT TABLESPACE  veterinar';
        --ex_stmt_a := 'CREATE USER mirkomirkec3 identified by 1234';
        EXECUTE IMMEDIATE ex_stmt_a;

        -- grantaj mu role
        ex_stmt_a := 'grant voditelj_odjela to ' || user_name;
        EXECUTE IMMEDIATE (ex_stmt_a);

        -- TODO : promijeniti QUOTA UNLIMITED na neki limited quota
        -- dajemo mu prostora za rad ?
        ex_stmt_a := 'ALTER USER '|| user_name || ' QUOTA UNLIMITED ON veterinar';
        EXECUTE IMMEDIATE (ex_stmt_a);


        -- SYNONYM
        --ex_stmt_a := 'create synonym '|| user_name || '.zaposlenik  for veterinar_sys.ZAPOSLENIK';
        --EXECUTE IMMEDIATE (ex_stmt_a);
/*
        ex_stmt_a := 'create synonym '|| user_name || '.RADNI_STATUS  veterinar';
        EXECUTE IMMEDIATE (ex_stmt_a);

        ex_stmt_a := 'create synonym '|| user_name || '.zaposlenik  veterinar';
        EXECUTE IMMEDIATE (ex_stmt_a);

        ex_stmt_a := 'create synonym '|| user_name || '.zaposlenik  veterinar';
        EXECUTE IMMEDIATE (ex_stmt_a);
*/
    end;






--radi, radi
CREATE OR REPLACE PROCEDURE create_user_doktor
    (user_name IN Varchar,passwd IN Varchar)
    AUTHID CURRENT_USER
    AS
    ex_stmt_a   VARCHAR2 (1000);
    ex_stmt_b   VARCHAR2 (1000);
    BEGIN
        -- TODO : ako vec postoji vrati gresku ?
        -- stvori usera
        ex_stmt_a := 'create user ' || user_name || ' identified by ' || passwd || ' DEFAULT TABLESPACE  veterinar';
         EXECUTE IMMEDIATE ex_stmt_a;

        -- grantaj mu role
        ex_stmt_a := 'grant doktor to ' || user_name;
        EXECUTE IMMEDIATE (ex_stmt_a);

        -- TODO : promijeniti QUOTA UNLIMITED na neki limited quota
        -- dajemo mu prostora za rad ?
        ex_stmt_a := 'ALTER USER '|| user_name || ' QUOTA UNLIMITED ON veterinar';
        EXECUTE IMMEDIATE (ex_stmt_a);


        -- SYNONYM
        ex_stmt_a := 'create synonym '|| user_name || '.DOKTOR_PACK  for veterinar_sys.DOKTOR_PACK';
        EXECUTE IMMEDIATE (ex_stmt_a);

        ex_stmt_a := 'create synonym '|| user_name || '.DOKTOR_TIPOVI_ZIVOTINJA  for veterinar_sys.DOKTOR_TIPOVI_ZIVOTINJA';
        EXECUTE IMMEDIATE (ex_stmt_a);

        ex_stmt_a := 'create synonym '|| user_name || '.DOKTOR_TIPOVI_USLUGA  for veterinar_sys.DOKTOR_TIPOVI_USLUGA';
        EXECUTE IMMEDIATE (ex_stmt_a);


        ex_stmt_a := 'create synonym '|| user_name || '.KORISNIK_VIEW  for veterinar_sys.KORISNIK_VIEW';
        EXECUTE IMMEDIATE (ex_stmt_a);
/*
        ex_stmt_a := 'create synonym '|| user_name || '.RADNI_STATUS  veterinar';
        EXECUTE IMMEDIATE (ex_stmt_a);

        ex_stmt_a := 'create synonym '|| user_name || '.zaposlenik  veterinar';
        EXECUTE IMMEDIATE (ex_stmt_a);

        ex_stmt_a := 'create synonym '|| user_name || '.zaposlenik  veterinar';
        EXECUTE IMMEDIATE (ex_stmt_a);

             grant select on DOKTOR_TIPOVI_ZIVOTINJA to doktor;
grant select on DOKTOR_TIPOVI_USLUGA to doktor;
grant select on KORISNIK_VIEW to doktor;
grant select on KOR_INFO to doktor;
*/
    end;










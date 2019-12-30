
------------------------------------------------------------------
-- fali :
    --  svi pregledi pojedinog korisnika
    --  zakazani pregledi

 create role doktor/

grant CREATE SESSION to doktor/  --da bi se mogao taj user spojiti na bazu
grant execute on DOKTOR_PACK to doktor;
grant select on DOKTOR_TIPOVI_ZIVOTINJA to doktor;
grant select on DOKTOR_TIPOVI_USLUGA to doktor;
grant select on KORISNIK_VIEW to doktor;
grant select on AMBULANTA_INFO to doktor;
grant select on ZAP_INFO to doktor;

--AMBULANTA_INFO  ZAP_INFO

--grant select on KORISNIK_VIEW to doktor;

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




-- sve
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


        ex_stmt_a := 'create synonym '|| user_name || '.AMBULANTA_INFO  for veterinar_sys.AMBULANTA_INFO';
        EXECUTE IMMEDIATE (ex_stmt_a);

        ex_stmt_a := 'create synonym '|| user_name || '.ZAP_INFO  for veterinar_sys.ZAP_INFO';
        EXECUTE IMMEDIATE (ex_stmt_a);

    end;

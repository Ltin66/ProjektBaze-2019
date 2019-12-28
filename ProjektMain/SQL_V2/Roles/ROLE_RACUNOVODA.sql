----------------------------------------------------------------------
--fali :
    --izracun place
    -- unos rasporeda
    -- raspored
    -- unos zaposlenika
    -- pogled statusa zaposlenika
    -- unos novog statusa

create role racunovoda/

grant CREATE SESSION to racunovoda/
grant execute on RACUNOVODA_PACK to racunovoda;
grant select on KORISNIK_VIEW to racunovoda;
grant select on RAC_ZAP_INFO to racunovoda;


--RAC_ZAP_INFO
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
        -- mnvz sam ce vratit

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

        ex_stmt_a := 'create synonym '|| user_name || '.RAC_ZAP_INFO  for veterinar_sys.RAC_ZAP_INFO';
        EXECUTE IMMEDIATE (ex_stmt_a);

        ex_stmt_a := 'create synonym '|| user_name || '.RACUNOVODA_PACK  for veterinar_sys.RACUNOVODA_PACK';
        EXECUTE IMMEDIATE (ex_stmt_a);
    end;

--create synonym mirkomirkec2.RACUNOVODA_PACK for VETERINAR_SYS.RACUNOVODA_PACK;
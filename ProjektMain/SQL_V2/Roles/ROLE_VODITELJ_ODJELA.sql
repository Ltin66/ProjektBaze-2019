
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
--VO_OD_DOK_INFO
        ex_stmt_a := 'create synonym '|| user_name || '.VO_OD_DOK_INFO  for veterinar_sys.VO_OD_DOK_INFO';
        EXECUTE IMMEDIATE (ex_stmt_a);


        ex_stmt_a := 'create synonym '|| user_name || '.INSP_VIEW  for veterinar_sys.INSP_VIEW';
        EXECUTE IMMEDIATE (ex_stmt_a);
    end;


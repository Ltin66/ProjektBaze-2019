
--OPIS:
--
--

--OPIS:
-- sluzi za pohranjivanje osnovnih usluga npr. ultrazvuk, provjera mokrace,....
--
create table ambulanta_usluga_tip(
    ambulanta_usluga_tip_id         INTEGER         NOT NULL , --auto incr
    naziv                           VARCHAR(20)     NOT NULL ,
    CONSTRAINT AMB_USL_TIP_PK PRIMARY KEY (ambulanta_usluga_tip_id) USING INDEX
)
/
--USING INDEX
-- TODO : check cijena > 0

--OPIS:
--
-- sluzi za spajanje zivotinje sa osnovnim uslugama, jer svaka osnovna usluga može imati razlicitu cijenu ovisno o
-- vrsti i velicini zivotinje
create table ambulanta_usluga (
    ambulanta_usluga_id               INTEGER         NOT NULL , --auto incr
    naziv                             VARCHAR(20)     NOT NULL ,
    ambulanta_usluga_tip_id           INTEGER         NOT NULL ,
    zivotinja_tip_id                  INTEGER         NOT NULL ,
    cijena                            NUMERIC(16,2)   NOT NULL CONSTRAINT PROVJERA_CIJENE CHECK(cijena > 0),
    opis                              CLOB            DEFAULT '@' NOT NULL ,
    CONSTRAINT AMB_US_PK PRIMARY KEY (ambulanta_usluga_id),
    CONSTRAINT AMB_US_FK_USL_TIP FOREIGN KEY (ambulanta_usluga_tip_id) REFERENCES ambulanta_usluga_tip(ambulanta_usluga_tip_id)
    --,CONSTRAIN PROVJERA_ZIVOTINJE CHECK (zivotinja_tip_id IN SELECT korisnik_id FROM korisnik)
)
/

--OPIS:
--  glavna tablica za pohranu pregleda/usluga u ambulanti, tu se spaja usluga sa ambulantom i datumom kada je izvresno
--
create table ambulanta(
    ambulanta_id                       INTEGER        NOT NULL ,
    ambulanta_usluga_id                INTEGER        NOT NULL ,
    datum                              DATE           NOT NULL ,
    opis                               CLOB           DEFAULT '@' NOT NULL ,
    CONSTRAINT AMB_PK PRIMARY KEY (ambulanta_id),
    CONSTRAINT AMB_FK FOREIGN KEY (ambulanta_usluga_id) REFERENCES ambulanta_usluga(ambulanta_usluga_id)
)
/


--OPIS:
--  služi za spajanje ambulante sa korinik_zivotinjom
--

create table ambulanta_korisnik_zivotinja (
    ambulanta_korziv_id           INTEGER         NOT NULL , --auto incr
    ambulanta_id                    INTEGER         NOT NULL ,
    korisnik_zivotinja_id           INTEGER         NOT NULL ,
    CONSTRAINT AMB_KOR_PK PRIMARY KEY (ambulanta_korziv_id) ,
    CONSTRAINT AMB_KOR_FK_AMB FOREIGN KEY(ambulanta_id) REFERENCES ambulanta(ambulanta_id),
    CONSTRAINT AMB_KOR_FK_KOR_ZIV FOREIGN KEY(korisnik_zivotinja_id)  REFERENCES korisnik_zivotinja(korisnik_zivotinja_id),
    CONSTRAINT AMB_KOR_UQ UNIQUE (ambulanta_id, korisnik_zivotinja_id) --za ambulanta_id moze doci isti korisnik samo jednom
)
/







-- TODO : check da su zivotinja_tip_id jednake od korisnika i usluge, nemoze krava doci na pregled za mačke

--OPIS:
-- sluti za spajanje ambulante sa zaposlenikom koji je radio na tom pregledu/usluzi
--
create table ambulanta_zaposlenik(
    ambulanta_zaposlenik_id                 INTEGER         NOT NULL , --auto incr
    ambulanta_id                            INTEGER         NOT NULL,
    zaposlenik_id                           INTEGER         NOT NULL,
    CONSTRAINT AMB_ZAP_PK PRIMARY KEY (ambulanta_zaposlenik_id),
    CONSTRAINT AMB_ZAP_FK_AMB FOREIGN KEY(ambulanta_id) REFERENCES ambulanta(ambulanta_id),
    CONSTRAINT AMB_ZAP_FK_ZAP FOREIGN KEY(zaposlenik_id) REFERENCES zaposlenik(zaposlenik_id)
)
/

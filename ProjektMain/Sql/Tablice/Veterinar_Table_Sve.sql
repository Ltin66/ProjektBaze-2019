
----------------------------------------------------------------------------------------
--                                ZAPOSLENICI
----------------------------------------------------------------------------------------

-- TODO: check da sifra ima samo brojeve, nesmije imati ostale znakove i mora imati 8 znakova, bez razmaka

CREATE TABLE zaposlenik (
    zaposlenik_id           INTEGER             NOT NULL, --auto incr
    ime                     VARCHAR(40)         NOT NULL,
    srednje_ime             VARCHAR(40)         DEFAULT '@' NOT NULL,
    prezime                 VARCHAR(40)         NOT NULL,
    sifra                   CHAR(8)             NOT NULL,  -- sifra je za pretrazivanje zaposlenika
    datum_zap               DATE                NOT NULL,
    jmbg                    INTEGER             NOT NULL,
    CONSTRAINT ZAP_PK PRIMARY KEY (zaposlenik_id) USING INDEX
)
/


CREATE TABLE radni_status_tip (
    radni_status_tip_id     INTEGER             NOT NULL, --auto incr
    naziv                   VARCHAR(20)         NOT NULL,
    opis_radnog_mjesta      CLOB                DEFAULT '@' NOT NULL,
    CONSTRAINT RAD_STAT_TIP_PK PRIMARY KEY (radni_status_tip_id) USING INDEX
)
/

CREATE TABLE radni_status (
    status_id               INTEGER             NOT NULL, --auto incr
    zaposlenik_id           INTEGER             NOT NULL,
    datum_pocetka           DATE                NOT NULL,
    datum_kraja             DATE                DEFAULT TO_DATE('01.01.0001','DD.MM.YYYY') NOT NULL,
    biljeske                CLOB                DEFAULT '@' NOT NULL,
    satnica                 NUMERIC(8,2)        NOT NULL,
    tjednisati              INTEGER             NOT NULL,
    radni_status_tip_id     INTEGER             NOT NULL,
    CONSTRAINT RAD_ST_PK PRIMARY KEY (status_id) USING INDEX,
    CONSTRAINT RAD_ST_ZAP_FK FOREIGN KEY (zaposlenik_id) REFERENCES zaposlenik (zaposlenik_id),
    CONSTRAINT RAD_ST_TIP_FK FOREIGN KEY (radni_status_tip_id) REFERENCES radni_status_tip (radni_status_tip_id)
)
/


CREATE TABLE odsutnost_tip(
    odsutnost_tip_id        INTEGER             NOT NULL, --auto incr
    naziv                   VARCHAR(40)         NOT NULL,
    primanje_place          NUMBER(1,0)             NOT NULL,
    opis                    CLOB                DEFAULT '@' NOT NULL,
    CONSTRAINT ODS_TIP_PK PRIMARY KEY (odsutnost_tip_id) USING INDEX
)
/

CREATE TABLE zaposlenici_odsutnost(
    odsutnost_id            INTEGER             NOT NULL, -- auto incr
    zaposlenik_id           INTEGER             NOT NULL,
    odsutnost_tip_id        INTEGER             NOT NULL,
    datum_pocetka           DATE                NOT NULL,
    datum_kraja             DATE                DEFAULT TO_DATE('01.01.0001','DD.MM.YYYY') NOT NULL,
    biljeske                CLOB                DEFAULT '@' NOT NULL,
    CONSTRAINT ZAP_ODS_PK PRIMARY KEY (odsutnost_id) USING INDEX,
    CONSTRAINT ZAP_ODS_ZAP_FK FOREIGN KEY (zaposlenik_id) REFERENCES zaposlenik (zaposlenik_id),
    CONSTRAINT ZAP_ODS_TIP_FK FOREIGN KEY (odsutnost_tip_id) REFERENCES odsutnost_tip (odsutnost_tip_id)
)
/





CREATE TABLE zaposlenici_dolazak(
    zaposlenik_id           INTEGER             NOT NULL , --auto incr
    datum                   DATE                NOT NULL ,
    datum_dolaska           DATE                DEFAULT TO_DATE('01.01.0001','DD.MM.YYYY') NOT NULL ,
    datum_odlaska           DATE                DEFAULT TO_DATE('02.01.0001','DD.MM.YYYY') NOT NULL ,
    CONSTRAINT ZAP_DOL_PK PRIMARY KEY (zaposlenik_id, datum) USING INDEX
)
/



----------------------------------------------------------------------------------------
--                                KORISNIK I ZIVOTINJE
----------------------------------------------------------------------------------------

-- TODO: check da sifra ima samo brojeve, nesmije imati ostale znakove i mora imati 8 znakova, bez razmaka

create table korisnik (
    korisnik_id             INTEGER             NOT NULL , --auto incr
    ime                     VARCHAR(20)         NOT NULL,
    srednje_ime             VARCHAR(40)         DEFAULT '@' NOT NULL,
    prezime                 VARCHAR(40)         NOT NULL,
    sifra                   CHAR(8)             NOT NULL,  -- sifra je za pretrazivanje
    datum_poc               DATE                NOT NULL,
    jmbg                    INTEGER             NOT NULL,
    aktivan                 NUMERIC(1) DEFAULT 1 NOT NULL ,
    opis                    CLOB                NOT NULL ,
    CONSTRAINT KOR_PK PRIMARY KEY (korisnik_id)
)
/

create table zivotinja_velicina (
    zivotinja_velicina_id   INTEGER             NOT NULL,   --auto incr
    velicina                INTEGER             NOT NULL ,
    opis                    CLOB  DEFAULT '@'   NOT NULL,
    CONSTRAINT ZIV_VEL_PK PRIMARY KEY (zivotinja_velicina_id)
)
/

create table zivotinja_tip (
    zivotinja_tip_id        INTEGER             NOT NULL , -- auto incr
    naziv                   VARCHAR(20)         NOT NULL,
    zivotinja_velicina_id   INTEGER             NOT NULL,
    opis                    CLOB  DEFAULT '@'   NOT NULL,
    CONSTRAINT ZIV_TIP_PK PRIMARY KEY (zivotinja_tip_id),
    CONSTRAINT ZIV_TIP_FK FOREIGN KEY(zivotinja_velicina_id) REFERENCES zivotinja_velicina(zivotinja_velicina_id)
)
/

create table zivotinja (
    zivotinja_id            INTEGER             NOT NULL , --auto incr
    zivotinja_tip_id        INTEGER             NOT NULL,
    ime                     VARCHAR(20)         NOT NULL,
    opis                    CLOB  DEFAULT '@'   NOT NULL,
    CONSTRAINT ZIV_PK PRIMARY KEY (zivotinja_id),
    CONSTRAINT ZIV_FK FOREIGN KEY (zivotinja_tip_id) REFERENCES zivotinja_tip(zivotinja_tip_id)
)
/

create table korisnik_zivotinja(
    korisnik_zivotinja_id       INTEGER             NOT NULL, --auto incr
    zivotinja_id                INTEGER             NOT NULL,
    korisnik_id                 INTEGER             NOT NULL,
    CONSTRAINT KOR_ZIV_PK PRIMARY KEY (korisnik_zivotinja_id),
    CONSTRAINT KOR_ZIV_UQ UNIQUE (zivotinja_id,korisnik_id),
    CONSTRAINT KOR_ZIV_FK_ZIV FOREIGN KEY (zivotinja_id) REFERENCES zivotinja(zivotinja_id),
    CONSTRAINT KOR_ZIV_FK_KOR FOREIGN KEY (korisnik_id)  REFERENCES korisnik(korisnik_id)
)
/


----------------------------------------------------------------------------------------
--                                INTERVENCIJE
----------------------------------------------------------------------------------------


--TODO : constraint cijena > 0

create table intervencija_tip (
    tip_id                INTEGER         NOT NULL , -- auto incr
    naziv                 VARCHAR(40)     NOT NULL ,
    cijena                NUMERIC(16,2)   NOT NULL ,
    opis                  CLOB DEFAULT '@' NOT NULL ,
    CONSTRAINT INT_TIP_PK PRIMARY KEY (tip_id)
)
/

-- TODO : treba staviti default za timestamp

create table intervencija(
  intervencija_id           INTEGER         NOT NULL, -- auto incr
  tip_id                    INTEGER         NOT NULL,
  korisnik_id               INTEGER         NOT NULL,
  datum                     TIMESTAMP       NOT NULL,
  opis                      CLOB DEFAULT '@' NOT NULL ,
  CONSTRAINT INT_PK PRIMARY KEY (intervencija_id),
  CONSTRAINT INT_FK FOREIGN KEY (korisnik_id) REFERENCES korisnik(korisnik_id)
)
/


create table intervencija_zaposlenik(
    intervencija_zaposlenik_id  INTEGER         NOT NULL , --auto incr
    intervenicja_id             INTEGER         NOT NULL,
    zaposlenik_id               INTEGER         NOT NULL,
    CONSTRAINT INT_ZAP_PK PRIMARY KEY (intervencija_zaposlenik_id),
    CONSTRAINT INT_ZAP_FK_INT FOREIGN KEY (intervenicja_id) REFERENCES intervencija(intervencija_id),
    CONSTRAINT INT_ZAP_FK_ZAP FOREIGN KEY (zaposlenik_id) REFERENCES zaposlenik(zaposlenik_id)
)
/


----------------------------------------------------------------------------------------
--                                INSPEKCIJE
----------------------------------------------------------------------------------------

-- TODO : check da je cijena > 0
create table inspekcija_tip(
    inspekcija_tip_id             INTEGER         NOT NULL , --auto incr
    naziv                         VARCHAR(20)     NOT NULL ,
    cijena                        NUMERIC(16,2)   NOT NULL ,
    CONSTRAINT INS_TIP_PK PRIMARY KEY (inspekcija_tip_id)
)
/

create table inspekcija_korisnik(
    inspekcija_korisnik_id          INTEGER         NOT NULL , --auto incr
    korisnik_id                     INTEGER         NOT NULL ,
    cijena_total                    NUMERIC(15,2)   NOT NULL ,
    CONSTRAINT INS_KOR_PK PRIMARY KEY (inspekcija_korisnik_id),
    CONSTRAINT INS_KOR_FK FOREIGN KEY (korisnik_id) REFERENCES korisnik(korisnik_id)
)
/


-- Oracle nema bool pa se radi sa NUMERIC(1) - u koji spremamo 0 ili 1, -1 za unknown gdje može
-- TODO check da je vrijednost izvresno 1 ili 0

create table inspekcija(
    inspekcija_id                   INTEGER         NOT NULL, --auto incr
    inspekcija_tip_id               INTEGER         NOT NULL,
    datum                           DATE DEFAULT TO_DATE('01.01.0001','DD.MM.YYYY') NOT NULL ,
    opis                            CLOB DEFAULT '@' NOT NULL ,
    CONSTRAINT INS_PK PRIMARY KEY (inspekcija_id),
    CONSTRAINT INS_FK FOREIGN KEY (inspekcija_tip_id) REFERENCES inspekcija_tip(inspekcija_tip_id)
)
/

create table inspekcija_zaposlenik(
    inspekcija_zaposlenik_id        INTEGER         NOT NULL , --auto incr
    inspekcija_id                   INTEGER         NOT NULL,
    zaposlenik_id                   INTEGER         NOT NULL,
    CONSTRAINT INS_ZAP_PK     PRIMARY KEY (inspekcija_zaposlenik_id),
    CONSTRAINT INS_ZAP_FK_INS FOREIGN KEY(inspekcija_id) references inspekcija(inspekcija_id),
    CONSTRAINT INS_ZAP_FK_ZAP FOREIGN KEY(zaposlenik_id) references zaposlenik(zaposlenik_id)
)
/



----------------------------------------------------------------------------------------
--                                AMBULANTA
----------------------------------------------------------------------------------------


create table ambulanta_usluga_tip(
    ambulanta_usluga_tip_id         INTEGER         NOT NULL , --auto incr
    naziv                           VARCHAR(20)     NOT NULL ,
    CONSTRAINT AMB_USL_TIP_PK PRIMARY KEY (ambulanta_usluga_tip_ID) USING INDEX
)
/


-- TODO : check cijena > 0
create table ambulanta_usluga (
    ambulanta_usluga_id               INTEGER         NOT NULL , --auto incr
    naziv                             VARCHAR(20)     NOT NULL ,
    ambulanta_usluga_tip_id           INTEGER         NOT NULL ,
    zivotinja_tip_id                  INTEGER         NOT NULL ,
    cijena                            NUMERIC(16,2)   NOT NULL ,
    opis                              CLOB            DEFAULT '@' NOT NULL ,
    CONSTRAINT AMB_US_PK PRIMARY KEY (ambulanta_usluga_id),
    CONSTRAINT AMB_US_FK_USL_TIP FOREIGN KEY (ambulanta_usluga_tip_id) REFERENCES ambulanta_usluga_tip(ambulanta_usluga_tip_id)
    --constr za zivotinja tip id
)
/


-- TODO : check da su zivotinja_tip_id jednake od korisnika i usluge, nemoze krava doci na pregled za mačke
create table ambulanta(
    ambulanta_id                       INTEGER        NOT NULL , --auto incr
    ambulanta_usluga_id                INTEGER        NOT NULL ,
    datum                              DATE           DEFAULT TO_DATE('01.01.0001','DD.MM.YYYY') NOT NULL ,
    opis                               CLOB           DEFAULT '@' NOT NULL ,
    CONSTRAINT AMB_PK PRIMARY KEY (ambulanta_id),
    CONSTRAINT AMB_FK FOREIGN KEY (ambulanta_usluga_id) REFERENCES ambulanta_usluga(ambulanta_usluga_id)
)
/

create table ambulanta_zaposlenik(
    ambulanta_zaposlenik_id                 INTEGER         NOT NULL ,
    ambulanta_id                            INTEGER         NOT NULL,
    zaposlenik_id                           INTEGER         NOT NULL,
    CONSTRAINT AMB_ZAP_PK PRIMARY KEY (ambulanta_zaposlenik_id),
    CONSTRAINT AMB_ZAP_FK_AMB FOREIGN KEY(ambulanta_id) REFERENCES ambulanta(ambulanta_id),
    CONSTRAINT AMB_ZAP_FK_ZAP FOREIGN KEY(zaposlenik_id) REFERENCES zaposlenik(zaposlenik_id)
)
/

create table ambulanta_korisnik_zivotinja (
    ambulanta_korisnik_zivotnja_id           INTEGER         NOT NULL , --auto incr
    ambulanta_id                    INTEGER         NOT NULL ,
    korisnik_zivotinja_id           INTEGER         NOT NULL ,
    CONSTRAINT AMB_KOR_PK PRIMARY KEY (ambulanta_korisnik_zivotnja_id) USING INDEX ,
    CONSTRAINT AMB_KOR_FK_AMB FOREIGN KEY(ambulanta_id) REFERENCES ambulanta(ambulanta_id),
    CONSTRAINT AMB_KOR_FK_KOR_ZIV FOREIGN KEY(korisnik_zivotinja_id)  REFERENCES korisnik_zivotinja(korisnik_zivotinja_id),
    CONSTRAINT AMB_KOR_UQ UNIQUE (ambulanta_id, korisnik_zivotinja_id) --za ambulanta_id moze doci isti korisnik samo jednom
)
/
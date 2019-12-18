
-- TODO: check da sifra ima samo brojeve, nesmije imati ostale znakove i mora imati 8 znakova, bez razmaka

create table korisnik (
    korisnik_id             INTEGER             NOT NULL , --auto incr
    ime                     VARCHAR(20)         NOT NULL,
    srednje_ime             VARCHAR(40)         DEFAULT '@' NOT NULL,
    prezime                 VARCHAR(40)         NOT NULL,
    sifra                   CHAR(8)             NOT NULL  CONSTRAINT PROVJERA_SIFRA_KOR CHECK( LENGTH(SIFRA) = 8),  -- sifra je za pretrazivanje
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
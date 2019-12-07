

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
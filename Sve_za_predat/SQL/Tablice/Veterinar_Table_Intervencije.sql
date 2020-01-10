



-- TODO : treba staviti default za timestamp možda

create table intervencija(
    intervencija_id           INTEGER         NOT NULL, -- auto incr
    korisnik_id               INTEGER         NOT NULL,
    datum                     TIMESTAMP       NOT NULL,
    opis                      CLOB DEFAULT '@' NOT NULL ,
    CONSTRAINT INT_PK PRIMARY KEY (intervencija_id),
    CONSTRAINT INT_FK_KOR FOREIGN KEY (korisnik_id) REFERENCES korisnik(korisnik_id)
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
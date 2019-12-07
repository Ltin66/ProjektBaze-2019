

-- TODO : check da je cijena > 0
create table inspekcija_tip(
    inspekcija_tip_id             INTEGER         NOT NULL , --auto incr
    naziv                         VARCHAR(20)     NOT NULL ,
    cijena                        NUMERIC(16,2)   NOT NULL ,
    CONSTRAINT INS_PK PRIMARY KEY (inspekcija_tip_id)
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
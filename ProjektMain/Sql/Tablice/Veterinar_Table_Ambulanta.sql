

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
    ambulanta_id                       INTEGER        NOT NULL ,
    ambulanta_usluga_id                INTEGER        NOT NULL ,
    datum                              DATE           DEFAULT TO_DATE('01.01.0001','DD.MM.YYYY') NOT NULL ,
    opis                               CLOB           DEFAULT '@' NOT NULL ,
    CONSTRAINT AMB_PK PRIMARY KEY (ambulanta_id),
    CONSTRAINT AMB_FK FOREIGN KEY (ambulanta_usluga_id) REFERENCES ambulanta_usluga(ambulanta_usluga_id)
)
/

create table ambulanta_zaposlenik(
    ambulanta_zaposlenik_id                 INTEGER         NOT NULL , --auto incr
    ambulanta_id                            INTEGER         NOT NULL,
    zaposlenik_id                           INTEGER         NOT NULL,
    CONSTRAINT AMB_ZAP_PK PRIMARY KEY (ambulanta_zaposlenik_id),
    CONSTRAINT AMB_ZAP_FK_AMB FOREIGN KEY(ambulanta_id) REFERENCES ambulanta(ambulanta_id),
    CONSTRAINT AMB_ZAP_FK_ZAP FOREIGN KEY(zaposlenik_id) REFERENCES zaposlenik(zaposlenik_id)
)
/

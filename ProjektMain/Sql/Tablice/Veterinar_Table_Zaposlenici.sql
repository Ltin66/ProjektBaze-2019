---//TODO treba provjeriti dali smije toliko sati raditi , ako je vec odradio max sati
---//TODO ako radi dva + puta u istom danu nemogu mu odrađeni sati priječi sljedeči termin dolaska, ili mogu ?

-- TODO: check da sifra ima samo brojeve, nesmije imati ostale znakove i mora imati 8 znakova, bez razmaka

--OPIS:
--  glavna tablica za zaposlenike
--
CREATE TABLE zaposlenik (
    zaposlenik_id           INTEGER             NOT NULL, --auto incr
    ime                     VARCHAR(40)         NOT NULL,
    srednje_ime             VARCHAR(40)         DEFAULT '@' NOT NULL,
    prezime                 VARCHAR(40)         NOT NULL,
    sifra                   CHAR(8)             NOT NULL ,  -- sifra je za pretrazivanje zaposlenika
    datum_zap               DATE                NOT NULL,
    jmbg                    INTEGER             NOT NULL,
    CONSTRAINT ZAP_PK PRIMARY KEY (zaposlenik_id) USING INDEX,
    CONSTRAINT PROVJERA_SIFRA CHECK (LENGTH(SIFRA) = 8)
)
/

--OPIS:
--   sta zaposlenik može biti, dali je doktor,....
--

CREATE TABLE radni_status_tip (
    radni_status_tip_id     INTEGER             NOT NULL, --auto incr
    naziv                   VARCHAR(20)         NOT NULL,
    opis_radnog_mjesta      CLOB                DEFAULT '@' NOT NULL,
    CONSTRAINT RAD_STAT_TIP_PK PRIMARY KEY (radni_status_tip_id) USING INDEX
)
/

--OPIS:
--   spajanje korisnika i njegovog radnog statusa, od kad do kad je doktor,..... i ostali podaci o njemu
--
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


--OPIS:
--      tipovi odsutnosti
--
CREATE TABLE odsutnost_tip(
    odsutnost_tip_id        INTEGER             NOT NULL, --auto incr
    naziv                   VARCHAR(40)         NOT NULL,
    primanje_place          NUMBER(1,0)             NOT NULL,
    opis                    CLOB                DEFAULT '@' NOT NULL,
    CONSTRAINT ODS_TIP_PK PRIMARY KEY (odsutnost_tip_id) USING INDEX
)
/

--OPIS:
--  od kad do kad je bio odsutan
--
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





--OPIS:
--  kad je odredeni zaposlenik dosao na posao
--
CREATE TABLE zaposlenici_dolazak(
    zaposlenik_id           INTEGER             NOT NULL ,
    datum                   DATE                NOT NULL ,
    datum_dolaska           DATE                DEFAULT TO_DATE('01.01.0001','DD.MM.YYYY') NOT NULL ,
    datum_odlaska           DATE                DEFAULT TO_DATE('02.01.0001','DD.MM.YYYY') NOT NULL ,
    odradeni_sati           NUMBER(1)           DEFAULT 0 NOT NULL
    CONSTRAINT ZAP_DOL_PK PRIMARY KEY (zaposlenik_id, datum) USING INDEX,
    CONSTRAINT ZAP_DOL_FK FOREIGN KEY (zaposlenik_id) REFERENCES zaposlenik(zaposlenik_id),
    CONSTRAINT ZAP_DOL_ODR_STI CHECK ( odradeni_sati < 12  )
)
/






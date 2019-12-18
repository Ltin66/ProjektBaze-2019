---//TODO treba provjeriti dali smije toliko sati raditi , ako je vec odradio max sati
---//TODO ako radi dva + puta u istom danu nemogu mu odrađeni sati priječi sljedeči termin dolaska, ili mogu ?

-- TODO: check da sifra ima samo brojeve, nesmije imati ostale znakove i mora imati 8 znakova, bez razmaka

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
) TABLESPACE veterinar
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
    zaposlenik_id           INTEGER             NOT NULL ,
    datum                   DATE                NOT NULL ,
    datum_dolaska           DATE                DEFAULT TO_DATE('01.01.0001','DD.MM.YYYY') NOT NULL ,
    datum_odlaska           DATE                DEFAULT TO_DATE('02.01.0001','DD.MM.YYYY') NOT NULL ,
    CONSTRAINT ZAP_DOL_PK PRIMARY KEY (zaposlenik_id, datum) USING INDEX,
    CONSTRAINT ZAP_DOL_FK FOREIGN KEY (zaposlenik_id) REFERENCES zaposlenik(zaposlenik_id)
)
/



-- Mat view, osnovne informacije o zaposlenicima

CREATE MATERIALIZED VIEW Zap_Info
    NOCACHE
    NOCOMPRESS
    NEVER REFRESH
    AS SELECT sifra , ime , prezime FROM zaposlenik/




-- Triger za Update nad zaposlenikom
CREATE OR REPLACE TRIGGER ZAP_MAT_UPD
    AFTER UPDATE OF sifra,ime,prezime ON zaposlenik
    FOR EACH ROW
    ENABLE
    BEGIN
        IF :NEW.sifra <> :OLD.sifra THEN
           UPDATE ZAP_INFO SET sifra = :NEW.sifra WHERE sifra = :OLD.sifra;
        end if;

        IF :NEW.ime <> :OLD.ime THEN
           UPDATE ZAP_INFO SET ime = :NEW.ime WHERE sifra = :NEW.sifra;
        end if;

        IF :NEW.prezime <> :OLD.prezime THEN
            UPDATE ZAP_INFO SET prezime = :NEW.prezime WHERE sifra = :NEW.sifra;
        end if;

    END;



-- DElete trig
CREATE OR REPLACE TRIGGER ZAP_MAT_DEL
    AFTER DELETE ON zaposlenik
    FOR EACH ROW
    ENABLE
    BEGIN
        DELETE FROM ZAP_INFO WHERE :OLD.sifra = ZAP_INFO.SIFRA;
    END;



-- Insert trigger
CREATE OR REPLACE TRIGGER ZAP_MAT_INS
    AFTER INSERT ON zaposlenik
    FOR EACH ROW
    ENABLE
    BEGIN
        INSERT INTO ZAP_INFO(sifra, ime, prezime)
        VALUES (:NEW.sifra,:NEW.ime,:NEW.prezime);

    END;


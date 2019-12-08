
-- KAO VETERINAR_SYS

-- Mat view, osnovne informacije o zaposlenicima

CREATE MATERIALIZED VIEW Zap_Info
    NOCACHE
    NOCOMPRESS
    NEVER REFRESH
    AS SELECT sifra , ime , prezime FROM zaposlenik/




-- Triger za Update nad zaposlenikom
CREATE OR REPLACE TRIGGER ZAP_UPD
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
CREATE OR REPLACE TRIGGER ZAP_DEL
    AFTER DELETE ON zaposlenik
    FOR EACH ROW
    ENABLE
    BEGIN
        DELETE FROM ZAP_INFO WHERE :OLD.sifra = ZAP_INFO.SIFRA;
    END;



-- Insert trigger
CREATE OR REPLACE TRIGGER ZAP_INS
    AFTER INSERT ON zaposlenik
    FOR EACH ROW
    ENABLE
    BEGIN
        INSERT INTO ZAP_INFO(sifra, ime, prezime)
        VALUES (:NEW.sifra,:NEW.ime,:NEW.prezime);

    END;


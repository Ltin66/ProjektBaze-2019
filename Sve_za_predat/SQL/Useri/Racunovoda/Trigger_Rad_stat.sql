CREATE OR REPLACE TRIGGER TRIG_UP_RAD_STAT
    BEFORE INSERT ON RADNI_STATUS
    FOR EACH ROW
    ENABLE
    BEGIN
        update RADNI_STATUS set DATUM_KRAJA = CURRENT_DATE where ZAPOSLENIK_ID = :new.ZAPOSLENIK_ID AND
                                                                 DATUM_KRAJA = TO_DATE('01.01.0001 00:00:00', 'DD.MM.YYYY hh24:mi:ss');
    end;
--RADI
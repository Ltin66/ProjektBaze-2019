

CREATE OR REPLACE TRIGGER RAC_UPD_RAD_VR_ODL
    BEFORE UPDATE OF sati_odlaska ON ZAPOSLENICI_DOLAZAK
    FOR EACH ROW
    ENABLE
    BEGIN
            :NEW.ODRADENI_SATI := :NEW.sati_odlaska - :OLD.sati_dolaska;
     end;




--TEST
select * from ZAPOSLENICI_DOLAZAK;
update ZAPOSLENICI_DOLAZAK set SATI_ODLASKA = 15.30 where DATUM = TO_DATE('03.02.2008', 'DD.MM.YYYY')
                                                            AND ZAPOSLENIK_ID = 5;

CREATE SEQUENCE SEQ_ZAP
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_ZAP
  BEFORE INSERT ON ZAPOSLENIK
  FOR EACH ROW
BEGIN
  :new.ZAPOSLENIK_ID := SEQ_ZAP.nextval;
END;
/


CREATE SEQUENCE SEQ_RAD_STA_TIP
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_RAD_STA_TIP
  BEFORE INSERT ON RADNI_STATUS_TIP
  FOR EACH ROW
BEGIN
  :new.RADNI_STATUS_TIP_ID := SEQ_ZAP.nextval;
END;
/


CREATE SEQUENCE SEQ_RAD_STA
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_RAD_STA
  BEFORE INSERT ON RADNI_STATUS
  FOR EACH ROW
BEGIN
  :new.STATUS_ID := SEQ_RAD_STA_TIP.nextval;
END;
/



CREATE SEQUENCE SEQ_ODS_TIP
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_ODS_TIP
  BEFORE INSERT ON ODSUTNOST_TIP
  FOR EACH ROW
BEGIN
  :new.ODSUTNOST_TIP_ID := SEQ_RAD_STA.nextval;
END;
/


CREATE SEQUENCE SEQ_ZAP_ODS
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_ZAP_ODS
  BEFORE INSERT ON ZAPOSLENICI_ODSUTNOST
  FOR EACH ROW
BEGIN
  :new.ODSUTNOST_ID := SEQ_ODS_TIP.nextval;
END;
/



CREATE SEQUENCE SEQ_KOR
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_KOR
  BEFORE INSERT ON KORISNIK
  FOR EACH ROW
BEGIN
  :new.KORISNIK_ID := SEQ_KOR.nextval;
END;
/



CREATE SEQUENCE SEQ_ZIV_VEL
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_ZIV_VEL
  BEFORE INSERT ON ZIVOTINJA_VELICINA
  FOR EACH ROW
BEGIN
  :new.ZIVOTINJA_VELICINA_ID := SEQ_ZIV_VEL.nextval;
END;
/


CREATE SEQUENCE SEQ_ZIV_TIP
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_ZIV_TIP
  BEFORE INSERT ON ZIVOTINJA_TIP
  FOR EACH ROW
BEGIN
  :new.ZIVOTINJA_TIP_ID := SEQ_ZIV_VEL.nextval;
END;
/


CREATE SEQUENCE SEQ_ZIV
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_ZIV
  BEFORE INSERT ON ZIVOTINJA
  FOR EACH ROW
BEGIN
  :new.ZIVOTINJA_ID := SEQ_ZIV_TIP.nextval;
END;
/

CREATE SEQUENCE SEQ_KOR_ZIV
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_KOR_ZIV
  BEFORE INSERT ON KORISNIK_ZIVOTINJA
  FOR EACH ROW
BEGIN
  :new.KORISNIK_ZIVOTINJA_ID := SEQ_ZIV.nextval;
END;
/


CREATE SEQUENCE SEQ_AMB
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_AMB
  BEFORE INSERT ON AMBULANTA
  FOR EACH ROW
BEGIN
  :new.AMBULANTA_ID := SEQ_AMB.nextval;
END;
/



CREATE SEQUENCE SEQ_AMB_USLG_TIP
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_AMB_USLG_TIP
  BEFORE INSERT ON AMBULANTA_USLUGA_TIP
  FOR EACH ROW
BEGIN
  :new.AMBULANTA_USLUGA_TIP_ID := SEQ_AMB_USLG_TIP.nextval;
END;
/

CREATE SEQUENCE SEQ_AMB_USLG
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_AMB_USLG
  BEFORE INSERT ON AMBULANTA_USLUGA
  FOR EACH ROW
BEGIN
  :new.AMBULANTA_USLUGA_ID := SEQ_AMB_USLG_TIP.nextval;
END;
/


CREATE SEQUENCE SEQ_AMB_KOR_ZIV
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_AMB_KOR_ZIV
  BEFORE INSERT ON AMBULANTA_KORISNIK_ZIVOTINJA
  FOR EACH ROW
BEGIN
  :new.AMBULANTA_KORZIV_ID := SEQ_AMB_KOR_ZIV.nextval;
END;
/

CREATE SEQUENCE SEQ_AMB_ZAP
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_AMB_ZAP
  BEFORE INSERT ON AMBULANTA_ZAPOSLENIK
  FOR EACH ROW
BEGIN
  :new.AMBULANTA_ZAPOSLENIK_ID := SEQ_AMB_USLG.nextval;
END;
/



CREATE SEQUENCE SEQ_INS_TIP
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_INS_TIP
  BEFORE INSERT ON INSPEKCIJA_TIP
  FOR EACH ROW
BEGIN
  :new.INSPEKCIJA_TIP_ID := SEQ_INS_TIP.nextval;
END;
/



CREATE SEQUENCE SEQ_INS_KOR
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_INS_KOR
  BEFORE INSERT ON INSPEKCIJA_KORISNIK
  FOR EACH ROW
BEGIN
  :new.INSPEKCIJA_KORISNIK_ID := SEQ_INS_TIP.nextval;
END;
/

CREATE SEQUENCE SEQ_INS
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_INS
  BEFORE INSERT ON INSPEKCIJA
  FOR EACH ROW
BEGIN
  :new.INSPEKCIJA_ID := SEQ_INS_KOR.nextval;
END;
/



CREATE SEQUENCE SEQ_INS_ZAP
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_INS_ZAP
  BEFORE INSERT ON INSPEKCIJA_ZAPOSLENIK
  FOR EACH ROW
BEGIN
  :new.INSPEKCIJA_ZAPOSLENIK_ID := SEQ_INS.nextval;
END;
/



CREATE SEQUENCE SEQ_INTR
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_INTR
  BEFORE INSERT ON INTERVENCIJA
  FOR EACH ROW
BEGIN
  :new.INTERVENCIJA_ID := SEQ_INTR_TIP.nextval;
END;
/

CREATE SEQUENCE SEQ_INTR_ZAP
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_INTR_ZAP
  BEFORE INSERT ON INTERVENCIJA_ZAPOSLENIK
  FOR EACH ROW
BEGIN
  :new.INTERVENCIJA_ZAPOSLENIK_ID := SEQ_INTR.nextval;
END;
/



-- NEMAMO VIŠE
----------------------------------------------------------------------------

CREATE SEQUENCE SEQ_INTR_TIP
  START WITH 10
  INCREMENT BY 1
  CACHE 100;



CREATE OR REPLACE TRIGGER TRIG_SEQ_INTR_TIP
  BEFORE INSERT ON INTERVENCIJA_TIP
  FOR EACH ROW
BEGIN
  :new.INTERVENCIJA_TIP_ID := SEQ_INTR_TIP.nextval;
END;
/



-- prva dva rade
--------------------------------------------------------
--          Zaposlenici
--------------------------------------------------------

CREATE SEQUENCE SEQ_ZAP
  START WITH 10
  INCREMENT BY 1
  CACHE 100;


CREATE OR REPLACE TRIGGER TRIG_SEQ_ZAP
  BEFORE INSERT ON zaposlenik
  FOR EACH ROW
BEGIN
  :new.zaposlenik_id := SEQ_ZAP.nextval;
END;



--------------------------------------------------------
--          Radni_Status_Tip
--------------------------------------------------------

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


--------------------------------------------------------
--          Radni_Status
--------------------------------------------------------




















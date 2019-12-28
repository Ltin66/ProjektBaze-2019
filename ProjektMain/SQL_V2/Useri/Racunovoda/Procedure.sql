
CREATE OR REPLACE PACKAGE RACUNOVODA_PACK AS


     PROCEDURE updateZAPOSLENIK_sati_odlazak ( --OK
    p_id IN ZAPOSLENICI_DOLAZAK.ZAPOSLENIK_ID%TYPE,
    p_datum IN ZAPOSLENICI_DOLAZAK.DATUM%TYPE,
    p_sati_odlazak IN ZAPOSLENICI_DOLAZAK.sati_odlaska%TYPE
);

     PROCEDURE updateZAPOSLENIK_sati_dolazak ( --OK
    p_id IN ZAPOSLENICI_DOLAZAK.ZAPOSLENIK_ID%TYPE,
    p_datum IN ZAPOSLENICI_DOLAZAK.DATUM%TYPE,
    p_sati_dolazak IN ZAPOSLENICI_DOLAZAK.sati_dolaska%TYPE
);





 PROCEDURE selectAMBULANTA_USLUGA_CIJENA(  --Ispraviti
    p_id IN AMBULANTA_USLUGA.AMBULANTA_USLUGA_ID%TYPE,
    o_cijena OUT AMBULANTA_USLUGA.CIJENA%TYPE);

      PROCEDURE selectINSPEKCIJA_CIJENA( --Ispraviti
	   p_id IN INSPEKCIJA_TIP.INSPEKCIJA_TIP_ID%TYPE,
	   o_cijena OUT INSPEKCIJA_TIP.CIJENA%TYPE);

END;


--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY RACUNOVODA_PACK AS

--5. Update vrijeme dolaska - procedura   p_sati_dolazak

    PROCEDURE updateZAPOSLENIK_sati_dolazak (
           p_id IN ZAPOSLENICI_DOLAZAK.ZAPOSLENIK_ID%TYPE,
           p_datum IN ZAPOSLENICI_DOLAZAK.DATUM%TYPE,
           p_sati_dolazak IN ZAPOSLENICI_DOLAZAK.DATUM_DOLASKA%TYPE)
IS
BEGIN
  UPDATE ZAPOSLENICI_DOLAZAK SET sati_dolaska = p_sati_dolazak WHERE ZAPOSLENIK_ID  = p_id AND DATUM = p_datum;
  COMMIT;
END;


    PROCEDURE updateZAPOSLENIK_sati_odlazak (
           p_id IN ZAPOSLENICI_DOLAZAK.ZAPOSLENIK_ID%TYPE,
           p_datum IN ZAPOSLENICI_DOLAZAK.DATUM%TYPE,
           p_sati_odlazak IN ZAPOSLENICI_DOLAZAK.DATUM_DOLASKA%TYPE)
IS
BEGIN
  UPDATE ZAPOSLENICI_DOLAZAK SET sati_odlaska=p_sati_odlazak WHERE ZAPOSLENIK_ID  = p_id AND DATUM = p_datum;
  COMMIT;
END;



------------------------------------------------------------------------------------------------------------------------
--6. Izračunaj cijenu za pregled ID - procedura

 PROCEDURE selectAMBULANTA_USLUGA_CIJENA(
	   p_id IN AMBULANTA_USLUGA.AMBULANTA_USLUGA_ID%TYPE,
	   o_cijena OUT AMBULANTA_USLUGA.CIJENA%TYPE)
IS
BEGIN

  SELECT CIJENA
  INTO o_cijena
  FROM  AMBULANTA_USLUGA WHERE AMBULANTA_USLUGA_ID = p_id;

END;




------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------
--7. Izračunaj cijenu za inspekciju ID - procedura

 PROCEDURE selectINSPEKCIJA_CIJENA(
	   p_id IN INSPEKCIJA_TIP.INSPEKCIJA_TIP_ID%TYPE,
	   o_cijena OUT INSPEKCIJA_TIP.CIJENA%TYPE)
IS
BEGIN

  SELECT CIJENA
  INTO o_cijena
  FROM  INSPEKCIJA_TIP WHERE INSPEKCIJA_TIP_ID = p_id;

END;


------------------------------------------------------------------------------------------------------------------------

END; --PACK BODY END
------------------------------------------------------------------------------------------------------------------------
--Test
SELECT * FROM AMBULANTA_USLUGA;

DECLARE
   o_cijena AMBULANTA_USLUGA.AMBULANTA_USLUGA_ID%TYPE;
BEGIN

   RACUNOVODA_PACK.selectAMBULANTA_USLUGA_CIJENA(2,o_cijena);

   DBMS_OUTPUT.PUT_LINE('Cijena :  ' || o_cijena);

END;
/

--Test
SELECT * FROM INSPEKCIJA_TIP;

DECLARE
   o_cijena INSPEKCIJA_TIP.INSPEKCIJA_TIP_ID%TYPE;
BEGIN

   selectINSPEKCIJA_CIJENA(3,o_cijena);

   DBMS_OUTPUT.PUT_LINE('Cijena :  ' || o_cijena);

END;
/
--Test
SELECT * FROM ZAPOSLENICI_DOLAZAK;

BEGIN
   RACUNOVODA_PACK.updateZAPOSLENIK_dolazak(5, TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),TO_DATE('01.02.4148 07:00:00', 'DD.MM.YYYY hh24:mi:ss'));
END;
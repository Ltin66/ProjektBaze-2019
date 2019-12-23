--5. Update vrijeme dolaska - procedura

CREATE OR REPLACE PROCEDURE updateZAPOSLENIK_dolazak (
           p_id IN ZAPOSLENICI_DOLAZAK.ZAPOSLENIK_ID%TYPE,
           p_datum IN ZAPOSLENICI_DOLAZAK.DATUM%TYPE,
           p_dat_dolaska IN ZAPOSLENICI_DOLAZAK.DATUM_DOLASKA%TYPE)
IS
BEGIN
  UPDATE ZAPOSLENICI_DOLAZAK SET DATUM_DOLASKA=p_dat_dolaska WHERE ZAPOSLENIK_ID  = p_id AND DATUM = p_datum;
  COMMIT;
END;
/

--Test
SELECT * FROM ZAPOSLENICI_DOLAZAK;

BEGIN
   updateZAPOSLENIK_dolazak(5, TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),TO_DATE('01.02.2118 07:00:00', 'DD.MM.YYYY hh24:mi:ss'));
END;
------------------------------------------------------------------------------------------------------------------------
--6. Izračunaj cijenu za pregled ID - procedura

CREATE OR REPLACE PROCEDURE selectAMBULANTA_USLUGA_CIJENA(
	   p_id IN AMBULANTA_USLUGA.AMBULANTA_USLUGA_ID%TYPE,
	   o_cijena OUT AMBULANTA_USLUGA.CIJENA%TYPE)
IS
BEGIN

  SELECT CIJENA
  INTO o_cijena
  FROM  AMBULANTA_USLUGA WHERE AMBULANTA_USLUGA_ID = p_id;

END;
/

--Test
SELECT * FROM AMBULANTA_USLUGA;

DECLARE
   o_cijena AMBULANTA_USLUGA.AMBULANTA_USLUGA_ID%TYPE;
BEGIN

   selectAMBULANTA_USLUGA_CIJENA(2,o_cijena);

   DBMS_OUTPUT.PUT_LINE('Cijena :  ' || o_cijena);

END;
/

------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------------------------
--7. Izračunaj cijenu za inspekciju ID - procedura

CREATE OR REPLACE PROCEDURE selectINSPEKCIJA_CIJENA(
	   p_id IN INSPEKCIJA_TIP.INSPEKCIJA_TIP_ID%TYPE,
	   o_cijena OUT INSPEKCIJA_TIP.CIJENA%TYPE)
IS
BEGIN

  SELECT CIJENA
  INTO o_cijena
  FROM  INSPEKCIJA_TIP WHERE INSPEKCIJA_TIP_ID = p_id;

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
------------------------------------------------------------------------------------------------------------------------


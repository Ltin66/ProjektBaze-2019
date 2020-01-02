
CREATE OR REPLACE PACKAGE RACUNOVODA_PACK AS

    procedure add_raspored (
p_zap_id zaposlenici_dolazak.zaposlenik_id%Type,
p_dat zaposlenici_dolazak.datum%Type,
p_sat_dol zaposlenici_dolazak.sati_dolaska%Type,
p_sat_odl zaposlenici_dolazak.sati_odlaska%Type,
p_odr_sat zaposlenici_dolazak.odradeni_sati%Type
);

    procedure add_zap (
    p_zap_id zaposlenik.zaposlenik_id%Type,
    p_ime zaposlenik.ime%Type,
    p_sr_ime zaposlenik.srednje_ime%Type,
    p_prez zaposlenik.prezime%Type,
    p_sifra zaposlenik.sifra%Type,
    p_dat_zap zaposlenik.datum_zap%Type,
    p_jmbg zaposlenik.jmbg%Type);


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

procedure add_rad_stat (
p_stat_id radni_status.STATUS_ID%Type,
p_zap_id radni_status.ZAPOSLENIK_ID%Type,
p_dat_poc radni_status.DATUM_POCETKA%Type,
p_bilj radni_status.BILJESKE%Type,
p_satnica radni_status.SATNICA%Type,
p_tj_sati radni_status.TJEDNISATI%Type,
p_rad_stat_tip_id radni_status.RADNI_STATUS_TIP_ID%Type);




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
           p_sati_dolazak IN ZAPOSLENICI_DOLAZAK.sati_dolaska%TYPE)
IS
BEGIN
  UPDATE ZAPOSLENICI_DOLAZAK SET sati_dolaska = p_sati_dolazak WHERE ZAPOSLENIK_ID  = p_id AND DATUM = p_datum;
  COMMIT;
END;


    PROCEDURE updateZAPOSLENIK_sati_odlazak (
           p_id IN ZAPOSLENICI_DOLAZAK.ZAPOSLENIK_ID%TYPE,
           p_datum IN ZAPOSLENICI_DOLAZAK.DATUM%TYPE,
           p_sati_odlazak IN ZAPOSLENICI_DOLAZAK.sati_odlaska%TYPE)
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


 procedure add_zap (
    p_zap_id zaposlenik.zaposlenik_id%Type,
    p_ime zaposlenik.ime%Type,
    p_sr_ime zaposlenik.srednje_ime%Type,
    p_prez zaposlenik.prezime%Type,
    p_sifra zaposlenik.sifra%Type,
    p_dat_zap zaposlenik.datum_zap%Type,
    p_jmbg zaposlenik.jmbg%Type
)
is
begin
    insert into zaposlenik (zaposlenik_id, ime, srednje_ime, prezime, sifra, datum_zap, jmbg)
    values (p_zap_id, p_ime, p_sr_ime, p_prez, p_sifra, p_dat_zap, p_jmbg);
      COMMIT;

end;


procedure add_rad_stat (
p_stat_id radni_status.STATUS_ID%Type,
p_zap_id radni_status.ZAPOSLENIK_ID%Type,
p_dat_poc radni_status.DATUM_POCETKA%Type,
p_bilj radni_status.BILJESKE%Type,
p_satnica radni_status.SATNICA%Type,
p_tj_sati radni_status.TJEDNISATI%Type,
p_rad_stat_tip_id radni_status.RADNI_STATUS_TIP_ID%Type)
is
begin
    insert into radni_status (status_id, zaposlenik_id, datum_pocetka, biljeske, satnica, tjednisati, radni_status_tip_id)
        values (p_stat_id, p_zap_id, p_dat_poc, p_bilj, p_satnica, p_tj_sati, p_rad_stat_tip_id);
      COMMIT;

end;
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



procedure add_raspored (
p_zap_id zaposlenici_dolazak.zaposlenik_id%Type,
p_dat zaposlenici_dolazak.datum%Type,
p_sat_dol zaposlenici_dolazak.sati_dolaska%Type,
p_sat_odl zaposlenici_dolazak.sati_odlaska%Type,
p_odr_sat zaposlenici_dolazak.odradeni_sati%Type
)
is
begin
    insert into ZAPOSLENICI_DOLAZAK (ZAPOSLENIK_ID, DATUM, SATI_DOLASKA, SATI_ODLASKA, ODRADENI_SATI)
    values (p_zap_id, p_dat, p_sat_dol, p_sat_odl, p_odr_sat);
      COMMIT;

end;



--------
    -- ----------------------------------------------------------------------------------------------------------------

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
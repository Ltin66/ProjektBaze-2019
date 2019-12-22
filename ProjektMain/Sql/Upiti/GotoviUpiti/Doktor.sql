--Doktor.sql
------------------------------------------------------------------------------------------------------------------------
--1. Info o ambulanti za ambulantaID - procedura

CREATE OR REPLACE PROCEDURE selectAMBULANTA(
	   p_id IN AMBULANTA.AMBULANTA_ID%TYPE,
	   o_usluga OUT AMBULANTA.AMBULANTA_USLUGA_ID%TYPE,
	   o_datum OUT  AMBULANTA.DATUM%TYPE,
	   o_opis OUT AMBULANTA.OPIS%TYPE)
IS
BEGIN

  SELECT AMBULANTA_USLUGA_ID , DATUM, OPIS
  INTO o_usluga, o_datum,  o_opis
  from  AMBULANTA WHERE AMBULANTA_ID = p_id;

END;
/




DECLARE
   o_usluga AMBULANTA.AMBULANTA_USLUGA_ID%TYPE;
   o_datum AMBULANTA.DATUM%TYPE;
   o_opis AMBULANTA.OPIS%TYPE;
BEGIN

   selectAMBULANTA(1,o_usluga,o_datum,o_opis);

   DBMS_OUTPUT.PUT_LINE('Usluga :  ' || o_usluga);
   DBMS_OUTPUT.PUT_LINE('Datum :  ' || o_datum);
   DBMS_OUTPUT.PUT_LINE('Opis :  ' || o_opis);

END;
/
------------------------------------------------------------------------------------------------------------------------
--@@@ 2. Sljedećih n zakazanih pregleda - funkcija
------------------------------------------------------------------------------------------------------------------------
--3. Dodaj 1 pregled , 1 doktora i 1 KorisnikZivotinja za taj pregled - procedura

--Pregled:
CREATE OR REPLACE PROCEDURE insertAMBULANTA (
       p_amb_id IN AMBULANTA.AMBULANTA_ID%TYPE,
       p_amb_usl_id IN AMBULANTA.AMBULANTA_USLUGA_ID%TYPE,
       p_datum IN AMBULANTA.DATUM%TYPE,
       p_opis IN AMBULANTA.OPIS%TYPE)
IS
BEGIN

  INSERT INTO AMBULANTA (ambulanta_id, ambulanta_usluga_id, datum, opis)
  values (p_amb_id, p_amb_usl_id, p_datum, p_opis);

  COMMIT;

END;
/

BEGIN
   INSERTAMBULANTA(8, 12, TO_DATE('08.02.2008 11:30:00', 'DD.MM.YYYY hh24:mi:ss'), 'Zaštitna cijepila - Mačka');
END;


--Doktor:
create PROCEDURE insertDOKTOR_AMBULANTA (
       p_amb_dok_id IN AMBULANTA_ZAPOSLENIK.AMBULANTA_ZAPOSLENIK_ID%TYPE,
       p_amb_id IN AMBULANTA_ZAPOSLENIK.AMBULANTA_ID%TYPE,
       p_zap_id IN AMBULANTA_ZAPOSLENIK.ZAPOSLENIK_ID%TYPE)

IS
BEGIN

  INSERT INTO AMBULANTA_ZAPOSLENIK (AMBULANTA_ZAPOSLENIK_ID, AMBULANTA_ID, ZAPOSLENIK_ID)
  values (p_amb_dok_id, p_amb_id, p_zap_id);

  COMMIT;

END;
/

BEGIN
   INSERTDOKTOR_AMBULANTA(8, 8, 5);
END;


--KorisnikZivotinja:
CREATE OR REPLACE PROCEDURE insertKORISNIK_ZIVOTINJA (
       p_korziv IN KORISNIK_ZIVOTINJA.KORISNIK_ZIVOTINJA_ID%TYPE,
       p_ziv_id IN KORISNIK_ZIVOTINJA.ZIVOTINJA_ID%TYPE,
       p_korisnik_id IN KORISNIK_ZIVOTINJA.KORISNIK_ID%TYPE)
IS
BEGIN

  INSERT INTO KORISNIK_ZIVOTINJA (korisnik_zivotinja_id, zivotinja_id, korisnik_id)
  values (p_korziv, p_ziv_id, p_korisnik_id);

  COMMIT;

END;
/

BEGIN
   INSERTKORISNIK_ZIVOTINJA(10, 1, 10);
END;
------------------------------------------------------------------------------------------------------------------------
--4. Izmjeni opis pregleda - procedura

CREATE OR REPLACE PROCEDURE updateAMBULANTA_opis (
           p_id IN AMBULANTA.AMBULANTA_ID%TYPE,
           p_opis IN AMBULANTA.OPIS%TYPE)
IS
BEGIN
  UPDATE AMBULANTA SET OPIS=p_opis WHERE AMBULANTA_ID =p_id;
  COMMIT;
END;
/

BEGIN
   updateAMBULANTA_opis(1, 'Pregled šape');
END;
------------------------------------------------------------------------------------------------------------------------
--5. Dodaj korisnika - procedura

CREATE OR REPLACE PROCEDURE insertKORISNIK (
	   p_korisnik_id IN KORISNIK.KORISNIK_ID%TYPE,
	   p_ime IN KORISNIK.IME%TYPE,
	   p_srednje_ime IN KORISNIK.SREDNJE_IME%TYPE,
	   p_prezime IN KORISNIK.PREZIME%TYPE,
	   p_sifra IN KORISNIK.SIFRA%TYPE,
           p_datum_poc IN KORISNIK.DATUM_POC%TYPE,
           p_jmbg IN KORISNIK.JMBG%TYPE,
           p_aktivan IN KORISNIK.AKTIVAN%TYPE,
           p_opis IN KORISNIK.OPIS%TYPE)
IS
BEGIN

  INSERT INTO KORISNIK (korisnik_id, ime, srednje_ime, prezime, sifra, datum_poc, jmbg, aktivan, opis)
  values (p_korisnik_id, p_ime, p_srednje_ime, p_prezime, p_sifra, p_datum_poc, p_jmbg, p_aktivan, p_opis);

  COMMIT;

END;
/

BEGIN
   INSERTKORISNIK(10, 'Dario10', 'D.10', 'Nikolic10', 10000010, TO_DATE('14.02.2008','DD.MM.YYYY'), 19, 1, 'Kontrola psa');
END;
------------------------------------------------------------------------------------------------------------------------
--6. Dodaj životinju - procedura

CREATE OR REPLACE PROCEDURE insertZIVOTINJA (
       p_ziv_id IN ZIVOTINJA.ZIVOTINJA_ID%TYPE,
       p_ziv_tip_id IN ZIVOTINJA.ZIVOTINJA_TIP_ID%TYPE,
       p_ime IN ZIVOTINJA.IME%TYPE,
       p_opis IN ZIVOTINJA.OPIS%TYPE)

IS
BEGIN

  INSERT INTO ZIVOTINJA (ZIVOTINJA_ID, ZIVOTINJA_TIP_ID, IME, OPIS)
  values (p_ziv_id, p_ziv_tip_id, p_ime, p_opis);

  COMMIT;

END;
/

BEGIN
   INSERTZIVOTINJA(8, 1, 'Pas', 'Vau');
END;
------------------------------------------------------------------------------------------------------------------------
--7. Izbriši korisnika - procedura
CREATE OR REPLACE PROCEDURE deleteKORISNIK(p_korisnik_id IN KORISNIK.KORISNIK_ID%TYPE)
IS
BEGIN

  DELETE KORISNIK WHERE KORISNIK_ID = p_korisnik_id;

  COMMIT;

END;
/

BEGIN
   deleteKORISNIK(10);
END;
------------------------------------------------------------------------------------------------------------------------
--@@@ 8. Izbriši životinju - procedura
------------------------------------------------------------------------------------------------------------------------
--9. Materializiran pogled - svi  korisnici
    
    CREATE MATERIALIZED VIEW Kor_Info
    NOCACHE
    NOCOMPRESS
    NEVER REFRESH
    AS SELECT korisnik_id, ime, srednje_ime, prezime, sifra, datum_poc, jmbg, aktivan, opis FROM korisnik/
------------------------------------------------------------------------------------------------------------------------
--@@@ 10. Svi pregledi za Korisnik iD - funkcija
------------------------------------------------------------------------------------------------------------------------
--11. Pogled - sve KorisnikID i za svaki ispiši njegovu životinju (i one korisnike koji nemaju životinju)

CREATE OR REPLACE VIEW korisnik_view AS
  SELECT KORISNIK.korisnik_id, KORISNIK_ZIVOTINJA.zivotinja_id
  FROM KORISNIK
  LEFT JOIN KORISNIK_ZIVOTINJA ON KORISNIK.korisnik_id=KORISNIK_ZIVOTINJA.korisnik_id
  ORDER BY korisnik_id;
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
SELECT  * from korisnik_view
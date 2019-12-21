Kako bi Data grip vratio podatke od procedura preko DBMS_OUTPUT
Treba se stisnut Ctrl + F8

google Datagrip DBMS OUTPUT, pored terminala  za services window je batun nvm np

1. OK info o ambulanti za ambulantaID
(u proceduru unesem ID ambulante  , dobijem sve podatke o tom pregledu)



--Proc

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



--Test

DECLARE
   o_usluga AMBULANTA.AMBULANTA_USLUGA_ID%TYPE;
   o_datum AMBULANTA.DATUM%TYPE;
   o_opis AMBULANTA.OPIS%TYPE;
BEGIN

   selectAMBULANTA(1,o_usluga,o_datum,o_opis);

   DBMS_OUTPUT.ENABLE();
   DBMS_OUTPUT.PUT_LINE('Usluga :  ' || o_usluga);
   DBMS_OUTPUT.PUT_LINE('Datum :  ' || o_datum);
   DBMS_OUTPUT.PUT_LINE('Opis :  ' || o_opis);

END;





2. sljedecih n zakazanih pregleda (kao funkcija)
(unesemo broj n i dobimo prvih n pregleda (zakazani pregledi su oni kojim ja datum "01.01.01" (treba vidit ali ja mislim da je taj)))

3. dodaj 1 pregled , 1 doktora i 1 KorisnikZivotinja za taj pregled (procedura)
(unesemo podatke za za pregled, preko rocedure i izvršimo transakciju , unosimo IDdoktora za pregled i ID KorisnikZivotinja, ako 
je uneseni datum "02.02.02" onda neka ga uense kao CurrentDate(), i unosimo ID tipa pregleda, dali je pregled za psa mmačku itd...)                                                                                               

4. OK Izmjeni opis pregleda procedura
(update opis from ambulanta where ambulantaID = <Uneseni ID>)                                                                                               


--Proc

CREATE OR REPLACE PROCEDURE updateAMBULANTA_opis (
           p_id IN AMBULANTA.AMBULANTA_ID%TYPE,
           p_opis IN AMBULANTA.OPIS%TYPE)
IS
BEGIN
  UPDATE AMBULANTA SET OPIS=p_opis WHERE AMBULANTA_ID =p_id;
  COMMIT;
END;
/


--Test

SELECT opis FROM AMBULANTA WHERE AMBULANTA_ID = 1;

BEGIN
   updateAMBULANTA_opis(1, 'Pregled šape');
END;


5. OK dodaj korisnika procedura
(insert korisnika sa njegovim podacima)                                                                                               


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


--TETS

select * from KORISNIK where KORISNIK_ID = 10;



BEGIN
   INSERTKORISNIK(10, 'Dario10', 'D.10', 'Nikolic10', 10000010, TO_DATE('14.02.2008','DD.MM.YYYY'), 19, 1, 'Kontrola psa');
END;


6. dodaj zivotinju procedura
(kao 5. ali se treba unijeti i korisnikID tako da se unese redak i u KorisnikZivotinja za tog korisnika i tu zivotinju)                                                                                               


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



1n.  Dodaj KorisnikaZivotinju - procedura

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



7. izbrisi korisnika procedura
(delete from korisnik where korisnikid = <uneseni ID>)                                                                                               

8. izbrisi zivotinju procedura
(kao 6, kod brisanja prvo se moraju izbrisati svi iz KorisnikZivotinja za tu zivotinju i onda se brise zivotinja, )                                                                                               

9. materializiran pogled - svi  korisnici
(mat pogled, ima primjer u Veterinar_Table_Pogledi.sql, isto tako samo za korisnik i sve podatke o njima(atributi te tablice))                                                                                               

10. svi pregledi za Korisnik iD funkcija
(za uneseni KorisnikID daj mi sve Ambulante u za koje je (AmbulantaID join KorisnikZivotinjaID where KorisnikID = <uneseniID> ) 
 (to je otp pisano, ne ide tako sql nego se jos treba sa jednom tablicom spojiti ))                                                                                                         

  
  
  
  11.  pogled - sve KorisnikID i za svaki ispisi njegovu zivotinju (i one korisnike koji nemaju zivotinju)
  12 kolicina zivotinja i kolicina pregleda za korisnik id procedura
  (to je group by , samo nas zanima suma pregleda i suma(broj zivotanja za svakog korisnika)

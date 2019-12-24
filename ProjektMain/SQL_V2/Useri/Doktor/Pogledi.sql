--11. Pogled - sve KorisnikID i za svaki ispiši njegovu životinju (i one korisnike koji nemaju životinju)

CREATE OR REPLACE VIEW korisnik_view (ID,Ime,Prezime,ZivotinjaID,Ime_zivotinje,ZajednickiID) as SELECT KORISNIK.korisnik_id, KORISNIK.ime, KORISNIK.PREZIME,
                                               KORISNIK_ZIVOTINJA.zivotinja_id, ZIVOTINJA.IME Zivotinja_Ime,
                                               KORISNIK_ZIVOTINJA.KORISNIK_ZIVOTINJA_ID
  FROM KORISNIK
  LEFT JOIN KORISNIK_ZIVOTINJA ON KORISNIK.korisnik_id=KORISNIK_ZIVOTINJA.korisnik_id
  JOIN ZIVOTINJA ON KORISNIK_ZIVOTINJA.ZIVOTINJA_ID = ZIVOTINJA.ZIVOTINJA_ID
  ORDER BY KORISNIK.korisnik_id
 /
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
SELECT  * from korisnik_view/

------------------------------------------------------------------------------------------------------------------------
--9. Materializiran pogled - svi  korisnici

    CREATE MATERIALIZED VIEW Kor_Info
    NOCACHE
    NOCOMPRESS
    NEVER REFRESH --refresh svake minute TODO
    AS SELECT korisnik_id, ime, srednje_ime, prezime, sifra, datum_poc, jmbg, aktivan, opis FROM korisnik/
------------------------------------------------------------------------------------------------------------------------


CREATE OR REPLACE VIEW doktor_tipovi_zivotinja AS
    SELECT ZT.ZIVOTINJA_TIP_ID, ZT.NAZIV, ZV.OPIS FROM ZIVOTINJA_TIP ZT join ZIVOTINJA_VELICINA ZV on
        ZT.ZIVOTINJA_VELICINA_ID = ZV.ZIVOTINJA_VELICINA_ID
    ORDER BY NAZIV;


select * FROM doktor_tipovi_zivotinja/

    ----------------------------------------------------

CREATE OR REPLACE VIEW doktor_tipovi_usluga AS
    SELECT AU.AMBULANTA_USLUGA_ID,AUT.NAZIV Usluga,ZT.NAZIV Vrsta_Zivotinje,ZIVOTINJA_VELICINA.OPIS,AU.CIJENA
    FROM AMBULANTA_USLUGA AU JOIN AMBULANTA_USLUGA_TIP AUT ON
        AU.AMBULANTA_USLUGA_TIP_ID = AUT.AMBULANTA_USLUGA_TIP_ID JOIN
        ZIVOTINJA_TIP ZT ON ZT.ZIVOTINJA_TIP_ID = AU.ZIVOTINJA_TIP_ID JOIN
        ZIVOTINJA_VELICINA ON ZT.ZIVOTINJA_VELICINA_ID = ZIVOTINJA_VELICINA.ZIVOTINJA_VELICINA_ID
    ORDER BY Usluga,Vrsta_Zivotinje;



select * FROM doktor_tipovi_usluga;
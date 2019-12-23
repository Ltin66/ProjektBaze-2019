--11. Pogled - sve KorisnikID i za svaki ispiši njegovu životinju (i one korisnike koji nemaju životinju)

SELECT KORISNIK.korisnik_id, KORISNIK.ime, KORISNIK_ZIVOTINJA.zivotinja_id, ZIVOTINJA.IME
  FROM KORISNIK
  LEFT JOIN KORISNIK_ZIVOTINJA ON KORISNIK.korisnik_id=KORISNIK_ZIVOTINJA.korisnik_id
  JOIN ZIVOTINJA ON KORISNIK_ZIVOTINJA.ZIVOTINJA_ID = ZIVOTINJA.ZIVOTINJA_ID
  ORDER BY korisnik_id;
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
SELECT  * from korisnik_view/


------------------------------------------------------------------------------------------------------------------------
--9. Materializiran pogled - svi  korisnici

    CREATE MATERIALIZED VIEW Kor_Info
    NOCACHE
    NOCOMPRESS
    NEVER REFRESH
    AS SELECT korisnik_id, ime, srednje_ime, prezime, sifra, datum_poc, jmbg, aktivan, opis FROM korisnik/
------------------------------------------------------------------------------------------------------------------------

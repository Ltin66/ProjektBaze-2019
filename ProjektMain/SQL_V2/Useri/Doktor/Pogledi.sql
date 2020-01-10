--Zakazani Pregledi

create or replace view zak_pregl as select * from AMBULANTA WHERE DATUM > CURRENT_DATE ORDER BY DATUM ASC;


--Prikaz svih posjeta ambulanti

CREATE OR REPLACE VIEW AMBULANTA_INFO (ID,Zaposlenik_ID,KorisnikZivotinja_ID, Naziv_usluge,Datum) as
    SELECT AM.AMBULANTA_ID ID,AZ.ZAPOSLENIK_ID Zaposlenik_ID,AKZ.KORISNIK_ZIVOTINJA_ID KorisnikZivotinja_ID,
           AMBULANTA_USLUGA.NAZIV Naziv_usluge,AM.DATUM Datum FROM
    AMBULANTA AM join AMBULANTA_ZAPOSLENIK AZ ON AM.AMBULANTA_ID = AZ.AMBULANTA_ID
    JOIN AMBULANTA_KORISNIK_ZIVOTINJA AKZ ON AM.AMBULANTA_ID = AKZ.AMBULANTA_ID
    JOIN AMBULANTA_USLUGA ON AM.AMBULANTA_USLUGA_ID = AMBULANTA_USLUGA.AMBULANTA_USLUGA_ID
    JOIN AMBULANTA_USLUGA_TIP AUT ON AMBULANTA_USLUGA.AMBULANTA_USLUGA_TIP_ID = AUT.AMBULANTA_USLUGA_TIP_ID
    ORDER BY AM.DATUM;

--test

select * from AMBULANTA_INFO;

select * from AMBULANTA_ZAPOSLENIK;

insert into AMBULANTA_ZAPOSLENIK  (AMBULANTA_ID,ZAPOSLENIK_ID) values (1,4);



--11. Pogled - sve KorisnikID i za svaki ispiši njegovu životinju (i one korisnike koji nemaju životinju)

CREATE OR REPLACE VIEW korisnik_view (ID,Ime,Prezime,ZivotinjaID,Ime_zivotinje,ZajednickiID) as SELECT KORISNIK.korisnik_id, KORISNIK.ime, KORISNIK.PREZIME,
                                               KORISNIK_ZIVOTINJA.zivotinja_id, ZIVOTINJA.IME Zivotinja_Ime,
                                               KORISNIK_ZIVOTINJA.KORISNIK_ZIVOTINJA_ID
  FROM KORISNIK
  LEFT JOIN KORISNIK_ZIVOTINJA ON KORISNIK.korisnik_id=KORISNIK_ZIVOTINJA.korisnik_id
   LEFT JOIN ZIVOTINJA ON KORISNIK_ZIVOTINJA.ZIVOTINJA_ID = ZIVOTINJA.ZIVOTINJA_ID
  ORDER BY KORISNIK.korisnik_id
 /
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------
SELECT  * from korisnik_view/

------------------------------------------------------------------------------------------------------------------------
--9. Materializiran pogled - svi  korisnici  NECEMO KORISTITI!!!!!!!! imamo view i drugo jos

    CREATE MATERIALIZED VIEW Kor_Info
    NOCACHE
    NOCOMPRESS
    REFRESH --refresh svake minute TODO
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



--------------------------------------------------

--

-- Mat view, osnovne informacije o zaposlenicima

CREATE MATERIALIZED VIEW Zap_Info
    NOCACHE
    NOCOMPRESS
    NEVER REFRESH
    AS SELECT  sifra , ime , prezime FROM zaposlenik/




-- Triger za Update nad zaposlenikom
CREATE OR REPLACE TRIGGER ZAP_UPD
    AFTER UPDATE OF sifra,ime,prezime ON zaposlenik
    FOR EACH ROW
    ENABLE
    BEGIN
        IF :NEW.sifra <> :OLD.sifra THEN
           UPDATE ZAP_INFO SET sifra = :NEW.sifra WHERE sifra = :OLD.sifra;
        end if;

        IF :NEW.ime <> :OLD.ime THEN
           UPDATE ZAP_INFO SET ime = :NEW.ime WHERE sifra = :NEW.sifra;
        end if;

        IF :NEW.prezime <> :OLD.prezime THEN
            UPDATE ZAP_INFO SET prezime = :NEW.prezime WHERE sifra = :NEW.sifra;
        end if;

    END;



-- DElete trig
CREATE OR REPLACE TRIGGER ZAP_DEL
    AFTER DELETE ON zaposlenik
    FOR EACH ROW
    ENABLE
    BEGIN
        DELETE FROM ZAP_INFO WHERE :OLD.sifra = ZAP_INFO.SIFRA;
    END;



-- Insert trigger
CREATE OR REPLACE TRIGGER ZAP_INS
    AFTER INSERT ON zaposlenik
    FOR EACH ROW
    ENABLE
    BEGIN
        INSERT INTO ZAP_INFO(sifra, ime, prezime)
        VALUES (:NEW.sifra,:NEW.ime,:NEW.prezime);

    END;




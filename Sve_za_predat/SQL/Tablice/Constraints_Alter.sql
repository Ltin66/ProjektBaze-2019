

--1. Brisanjem (korisnik.korisnik_id PK) briše se automatski i (korisnik_zivotinja.korisnik_id FK)

ALTER TABLE KORISNIK_ZIVOTINJA
DROP CONSTRAINT KOR_ZIV_FK_KOR;


ALTER TABLE KORISNIK_ZIVOTINJA
ADD CONSTRAINT KOR_ZIV_FK_KOR
FOREIGN KEY (KORISNIK_ID)
REFERENCES KORISNIK (KORISNIK_ID)
ON DELETE CASCADE;

------------------------------------------------------------------------------------------------------------------------
--2.Brisanjem (zivotinja.zivotinja_id PK) briše se automatski i (korisnik_zivotinja.zivotinja_id FK)

ALTER TABLE KORISNIK_ZIVOTINJA
DROP CONSTRAINT KOR_ZIV_FK_ZIV;


ALTER TABLE KORISNIK_ZIVOTINJA
ADD CONSTRAINT KOR_ZIV_FK_ZIV
FOREIGN KEY (ZIVOTINJA_ID)
REFERENCES ZIVOTINJA (ZIVOTINJA_ID)
ON DELETE CASCADE;
------------------------------------------------------------------------------------------------------------------------


-- BITNO izgeda, brisanjem kor i/ili ziv treba se obrisati i amb_korziv jer se sa
-- prijašnjim briše i korziv



ALTER TABLE ambulanta_korisnik_zivotinja
DROP CONSTRAINT AMB_KOR_FK_KOR_ZIV;


ALTER TABLE ambulanta_korisnik_zivotinja
add    CONSTRAINT AMB_KOR_FK_KOR_ZIV FOREIGN KEY(korisnik_zivotinja_id)  REFERENCES korisnik_zivotinja(korisnik_zivotinja_id)
ON DELETE CASCADE;


-- komentar


ALTER TABLE ambulanta_korisnik_zivotinja
DROP CONSTRAINT AMB_KOR_FK_AMB;


ALTER TABLE ambulanta_korisnik_zivotinja
 ADD   CONSTRAINT AMB_KOR_FK_AMB FOREIGN KEY(ambulanta_id) REFERENCES ambulanta(ambulanta_id)
ON DELETE CASCADE;

--OBA SLUŽE DA BI SE MOGLA BRISATI AMBULANTA

ALTER TABLE ambulanta_zaposlenik
DROP CONSTRAINT AMB_ZAP_FK_AMB;


ALTER TABLE ambulanta_zaposlenik
ADD             CONSTRAINT AMB_ZAP_FK_AMB FOREIGN KEY(ambulanta_id) REFERENCES ambulanta(ambulanta_id)
ON DELETE CASCADE;



---------------------------------------------------------------------------------------
-- INSPEKCIJE

--

--drop table INSPEKCIJA_KORISNIK;

ALTER TABLE inspekcija_korisnik
DROP CONSTRAINT INS_KOR_FK_INS;


ALTER TABLE inspekcija_korisnik
ADD     CONSTRAINT INS_KOR_FK_INS FOREIGN KEY(inspekcija_id) references inspekcija(inspekcija_id)

    ON DELETE CASCADE;



--OBA SLUŽE DA BI SE MOGLA BRISATI

--    CONSTRAINT INS_ZAP_FK_INS FOREIGN KEY(inspekcija_id) references inspekcija(inspekcija_id),


ALTER TABLE inspekcija_zaposlenik
DROP CONSTRAINT INS_ZAP_FK_INS;


ALTER TABLE inspekcija_zaposlenik
ADD   CONSTRAINT INS_ZAP_FK_INS FOREIGN KEY(inspekcija_id) references inspekcija(inspekcija_id)

    ON DELETE CASCADE;





---------------------------------------------------------------------------------------
-- Intervencije

--INT_ZAP_FK_INT


ALTER TABLE intervencija_zaposlenik
DROP CONSTRAINT INT_ZAP_FK_INT;


ALTER TABLE intervencija_zaposlenik
ADD    CONSTRAINT INT_ZAP_FK_INT FOREIGN KEY (intervenicja_id) REFERENCES intervencija(intervencija_id)
    ON DELETE CASCADE;




---------------------------------------------------------------------------------------

--TEST-- PROBAO radi sve ok
--select  * FROM AMBULANTA;
--delete from AMBULANTA where AMBULANTA_ID = 1;

--SELECT * FROM AMBULANTA_ZAPOSLENIK;
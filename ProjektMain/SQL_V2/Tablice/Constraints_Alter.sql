

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


-- komentar


ALTER TABLE ambulanta_korisnik_zivotinja
DROP CONSTRAINT AMB_KOR_FK_AMB;


ALTER TABLE ambulanta_korisnik_zivotinja
 ADD   CONSTRAINT AMB_KOR_FK_AMB FOREIGN KEY(ambulanta_id) REFERENCES ambulanta(ambulanta_id)
ON DELETE CASCADE;

--OBA SLUŽE DA BI SE MOGLA BRISATI AMBULANTA  ili?

ALTER TABLE ambulanta_zaposlenik
DROP CONSTRAINT AMB_ZAP_FK_AMB;


ALTER TABLE ambulanta_zaposlenik
ADD             CONSTRAINT AMB_ZAP_FK_AMB FOREIGN KEY(ambulanta_id) REFERENCES ambulanta(ambulanta_id)
ON DELETE CASCADE;





--TEST-- PROBAO radi sve ok
select  * FROM AMBULANTA;
delete from AMBULANTA where AMBULANTA_ID = 1;

SELECT * FROM AMBULANTA_ZAPOSLENIK;
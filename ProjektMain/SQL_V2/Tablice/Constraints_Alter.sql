 

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
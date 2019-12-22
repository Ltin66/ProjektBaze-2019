

-------------------------------------------------------------------------------


INSERT INTO zaposlenik (zaposlenik_id, ime, prezime,datum_zap,jmbg,sifra)
    values (1,'Mirko1','Mirkec1',TO_DATE('01.01.2008','DD.MM.YYYY'),1,'00100001')/

INSERT INTO zaposlenik (zaposlenik_id, ime, prezime,datum_zap,jmbg,sifra)
    values (2,'Mirko2','Mirkec2',TO_DATE('02.01.2008','DD.MM.YYYY'),2,'00100002')/

INSERT INTO zaposlenik (zaposlenik_id, ime, prezime,datum_zap,jmbg,sifra)
    values (3,'Mirko3','Mirkec3',TO_DATE('03.01.2008','DD.MM.YYYY'),3,'00100003')/

INSERT INTO zaposlenik (zaposlenik_id, ime, prezime,datum_zap,jmbg,sifra)
    values (4,'Mirko4','Mirkec4',TO_DATE('04.01.2008','DD.MM.YYYY'),4,'00100005')/

INSERT INTO zaposlenik (zaposlenik_id, ime, prezime,datum_zap,jmbg,sifra)
    values (5,'Mirko5','Mirkec5',TO_DATE('05.01.2008','DD.MM.YYYY'),5,'00100007')/

INSERT INTO zaposlenik (zaposlenik_id, ime, prezime,datum_zap,jmbg,sifra)
    values (6,'Mirko6','Mirkec6',TO_DATE('06.01.2008','DD.MM.YYYY'),6,'00100302')/

-------------------------------------------------------------------------------------

INSERT INTO radni_status_tip (radni_status_tip_id,naziv)
    VALUES (1,'vođa_odjela')/

INSERT INTO radni_status_tip (radni_status_tip_id,naziv)
    VALUES (2,'doktor')/

INSERT INTO radni_status_tip (radni_status_tip_id,naziv)
    VALUES (3,'računovođa')/

INSERT INTO radni_status_tip (radni_status_tip_id,naziv)
    VALUES (4,'čistač')/

INSERT INTO radni_status_tip (radni_status_tip_id,naziv)
    VALUES (5,'neodređen')/

-------------------------------------------------------------------------------------

INSERT INTO radni_status (status_id, zaposlenik_id, datum_pocetka, satnica, tjednisati, radni_status_tip_id)
    VALUES (8,1,TO_DATE('02.01.2008','DD.MM.YYYY'),28.1,30,4)/

INSERT INTO radni_status (status_id, zaposlenik_id, datum_pocetka, satnica, tjednisati, radni_status_tip_id)
    VALUES (9,2,TO_DATE('03.01.2008','DD.MM.YYYY'),25.6,28,3)/

INSERT INTO radni_status (status_id, zaposlenik_id, datum_pocetka, satnica, tjednisati, radni_status_tip_id)
    VALUES (10,3,TO_DATE('04.01.2008','DD.MM.YYYY'),25.6,32,2)/

INSERT INTO radni_status (status_id, zaposlenik_id, datum_pocetka, satnica, tjednisati, radni_status_tip_id)
    VALUES (11,4,TO_DATE('05.01.2008','DD.MM.YYYY'),46.7,42,1)/

INSERT INTO radni_status (status_id, zaposlenik_id, datum_pocetka, satnica, tjednisati, radni_status_tip_id)
    VALUES (12,5,TO_DATE('06.01.2008','DD.MM.YYYY'),26.6,32,2)/

-------------------------------------------------------------------------------------

INSERT INTO odsutnost_tip (odsutnost_tip_id, naziv, primanje_place)
    VALUES (1,'slobodni dani',0)/

INSERT INTO odsutnost_tip (odsutnost_tip_id, naziv, primanje_place)
    VALUES (2,'godišnji odmor',1)/

-------------------------------------------------------------------------------------

INSERT INTO zaposlenici_dolazak (zaposlenik_id, datum, datum_dolaska,datum_odlaska,odradeni_sati)
    values (1,
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 14:00:00', 'DD.MM.YYYY hh24:mi:ss'),7)/

INSERT INTO zaposlenici_dolazak (zaposlenik_id, datum, datum_dolaska,datum_odlaska,odradeni_sati)
    values (2,
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 14:00:00', 'DD.MM.YYYY hh24:mi:ss'),7)/

INSERT INTO zaposlenici_dolazak (zaposlenik_id, datum, datum_dolaska,datum_odlaska,odradeni_sati)
    values (3,
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 14:00:00', 'DD.MM.YYYY hh24:mi:ss'),7)/

INSERT INTO zaposlenici_dolazak (zaposlenik_id, datum, datum_dolaska,datum_odlaska,odradeni_sati)
    values (4,
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 14:00:00', 'DD.MM.YYYY hh24:mi:ss'),8)/

INSERT INTO zaposlenici_dolazak (zaposlenik_id, datum, datum_dolaska,datum_odlaska,odradeni_sati)
    values (5,
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 14:00:00', 'DD.MM.YYYY hh24:mi:ss'),6)/

-------------------------------------------------------------------------------------

INSERT INTO zaposlenici_dolazak (zaposlenik_id, datum, datum_dolaska)
    values (1,
            TO_DATE('02.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('02.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'))/

INSERT INTO zaposlenici_dolazak (zaposlenik_id, datum, datum_dolaska)
    values (2,
            TO_DATE('02.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('02.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'))/

INSERT INTO zaposlenici_dolazak (zaposlenik_id, datum, datum_dolaska)
    values (3,
            TO_DATE('02.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('02.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'))/

INSERT INTO zaposlenici_dolazak (zaposlenik_id, datum, datum_dolaska)
    values (4,
            TO_DATE('02.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('02.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'))/

INSERT INTO zaposlenici_dolazak (zaposlenik_id, datum, datum_dolaska,datum_odlaska,odradeni_sati)
    values (5,
            TO_DATE('02.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('02.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('02.02.2008 14:00:00', 'DD.MM.YYYY hh24:mi:ss'),2)/


-------------------------------------------------------------------------------------


INSERT INTO zaposlenici_odsutnost (odsutnost_id, zaposlenik_id, odsutnost_tip_id, datum_pocetka, datum_kraja)
    VALUES (1,5,1,TO_DATE('03.02.2008','DD.MM.YYYY'),TO_DATE('05.02.2008','DD.MM.YYYY'))/


-------------------------------------------------------------------------------------







--Tablica ''KORISNIK'':

INSERT INTO KORISNIK (korisnik_id, ime, srednje_ime, prezime, sifra, datum_poc, jmbg, aktivan, opis)
   values (1,'Dario1','D.1','Nikolic1','10000001',TO_DATE('05.02.2008','DD.MM.YYYY'),10,1,'Kont rola psa')/
INSERT INTO KORISNIK (korisnik_id, ime, srednje_ime, prezime, sifra, datum_poc, jmbg, aktivan, opis)
   values (2,'Dario2','D.2','Nikolic2','10000002',TO_DATE('06.02.2008','DD.MM.YYYY'),11,1,'Kont rola mačke')/
INSERT INTO KORISNIK (korisnik_id, ime, srednje_ime, prezime, sifra, datum_poc, jmbg, aktivan, opis)
   values (3,'Dario3','D.3','Nikolic3','10000003',TO_DATE('07.02.2008','DD.MM.YYYY'),12,1,'Kont rola krave')/
INSERT INTO KORISNIK (korisnik_id, ime, srednje_ime, prezime, sifra, datum_poc, jmbg, aktivan, opis)
   values (4,'Dario4','D.4','Nikolic4','10000004',TO_DATE('08.02.2008','DD.MM.YYYY'),13,1,'Kont rola konja')/
INSERT INTO KORISNIK (korisnik_id, ime, srednje_ime, prezime, sifra, datum_poc, jmbg, aktivan, opis)
   values (5,'Dario5','D.5','Nikolic5','10000005',TO_DATE('09.02.2008','DD.MM.YYYY'),14,1,'Kont rola psa')/
INSERT INTO KORISNIK (korisnik_id, ime, srednje_ime, prezime, sifra, datum_poc, jmbg, aktivan, opis)
   values (6,'Dario6','D.6','Nikolic6','10000006',TO_DATE('10.02.2008','DD.MM.YYYY'),15,1,'Kont rola svinje')/
INSERT INTO KORISNIK (korisnik_id, ime, srednje_ime, prezime, sifra, datum_poc, jmbg, aktivan, opis)
   values (7,'Dario7','D.7','Nikolic7','10000007',TO_DATE('11.02.2008','DD.MM.YYYY'),16,1,'Kont rola mačke')/
INSERT INTO KORISNIK (korisnik_id, ime, srednje_ime, prezime, sifra, datum_poc, jmbg, aktivan, opis)
   values (8,'Dario8','D.8','Nikolic8','10000008',TO_DATE('12.02.2008','DD.MM.YYYY'),17,1,'Kont rola koze')/
INSERT INTO KORISNIK (korisnik_id, ime, srednje_ime, prezime, sifra, datum_poc, jmbg, aktivan, opis)
   values (9,'Dario9','D.9','Nikolic9','10000009',TO_DATE('13.02.2008','DD.MM.YYYY'),18,1,'Kont rola ovce')/

------------------------------------------------------------------------------------------------------------------------

--Tablica ''ZIVOTINJA_VELICINA'':

INSERT INTO ZIVOTINJA_VELICINA (zivotinja_velicina_id, velicina, OPIS)
   values (1, 1,'Mala veličina')/
INSERT INTO ZIVOTINJA_VELICINA (zivotinja_velicina_id, velicina, OPIS)
   values (2, 2,'Srednja veličina')/
INSERT INTO ZIVOTINJA_VELICINA (zivotinja_velicina_id, velicina, OPIS)
   values (3, 3,'Velika veličina')/

------------------------------------------------------------------------------------------------------------------------

--Tablica ''Zivotinja_tip'':

INSERT INTO ZIVOTINJA_TIP (zivotinja_tip_id, naziv, zivotinja_velicina_id, opis)
   values (1,'Pas',2,'Pas')/
INSERT INTO ZIVOTINJA_TIP (zivotinja_tip_id, naziv, zivotinja_velicina_id, opis)
   values (2,'Mačka',1,'Kućna mačka')/
INSERT INTO ZIVOTINJA_TIP (zivotinja_tip_id, naziv, zivotinja_velicina_id, opis)
   values (3,'Krava',3,'Krava')/
INSERT INTO ZIVOTINJA_TIP (zivotinja_tip_id, naziv, zivotinja_velicina_id, opis)
   values (4,'Konj',3,'Konj')/
INSERT INTO ZIVOTINJA_TIP (zivotinja_tip_id, naziv, zivotinja_velicina_id, opis)
   values (5,'Svinja',2,'Domaća svinja')/
INSERT INTO ZIVOTINJA_TIP (zivotinja_tip_id, naziv, zivotinja_velicina_id, opis)
   values (6,'Ovca',2,'Ovca')/
INSERT INTO ZIVOTINJA_TIP (zivotinja_tip_id, naziv, zivotinja_velicina_id, opis)
   values (7,'Koza',2,'Koza')/

------------------------------------------------------------------------------------------------------------------------

--Tablica ''Zivotinja'':

INSERT INTO ZIVOTINJA (ZIVOTINJA_ID, ZIVOTINJA_TIP_ID, IME, OPIS)
   values (1, 1, 'Pas', 'Vau')/
INSERT INTO ZIVOTINJA (ZIVOTINJA_ID, ZIVOTINJA_TIP_ID, IME, OPIS)
   values (2, 2, 'Mačka', 'Mjau')/
INSERT INTO ZIVOTINJA (ZIVOTINJA_ID, ZIVOTINJA_TIP_ID, IME, OPIS)
   values (3, 3, 'Krava', 'Muuu')/
INSERT INTO ZIVOTINJA (ZIVOTINJA_ID, ZIVOTINJA_TIP_ID, IME, OPIS)
   values (4, 4, 'Konj', 'Neigh')/
INSERT INTO ZIVOTINJA (ZIVOTINJA_ID, ZIVOTINJA_TIP_ID, IME, OPIS)
   values (5, 5, 'Svinja', 'Oink')/
INSERT INTO ZIVOTINJA (ZIVOTINJA_ID, ZIVOTINJA_TIP_ID, IME, OPIS)
   values (6, 6, 'Ovca', 'Baa')/
INSERT INTO ZIVOTINJA (ZIVOTINJA_ID, ZIVOTINJA_TIP_ID, IME, OPIS)
   values (7, 7, 'Koza', 'Bee')/

------------------------------------------------------------------------------------------------------------------------

--Tablica ''Korisnik_zivotinja'':

INSERT INTO KORISNIK_ZIVOTINJA (korisnik_zivotinja_id, zivotinja_id, korisnik_id)
   values (1,1,1)/
INSERT INTO KORISNIK_ZIVOTINJA (korisnik_zivotinja_id, zivotinja_id, korisnik_id)
   values (2,2,2)/
INSERT INTO KORISNIK_ZIVOTINJA (korisnik_zivotinja_id, zivotinja_id, korisnik_id)
   values (3,3,3)/
INSERT INTO KORISNIK_ZIVOTINJA (korisnik_zivotinja_id, zivotinja_id, korisnik_id)
   values (4,4,4)/
INSERT INTO KORISNIK_ZIVOTINJA (korisnik_zivotinja_id, zivotinja_id, korisnik_id)
   values (5,1,5)/
INSERT INTO KORISNIK_ZIVOTINJA (korisnik_zivotinja_id, zivotinja_id, korisnik_id)
   values (6,5,6)/
INSERT INTO KORISNIK_ZIVOTINJA (korisnik_zivotinja_id, zivotinja_id, korisnik_id)
   values (7,2,7)/
INSERT INTO KORISNIK_ZIVOTINJA (korisnik_zivotinja_id, zivotinja_id, korisnik_id)
   values (8,7,8)/
INSERT INTO KORISNIK_ZIVOTINJA (korisnik_zivotinja_id, zivotinja_id, korisnik_id)
   values (9,6,9)/








--Tablica ''AMBULANTA_USLUGA_TIP''
--Općenito Pregledi/medicinske stvari
INSERT INTO AMBULANTA_USLUGA_TIP (ambulanta_usluga_tip_id, naziv)
    values (1, 'Pregled i liječenje')/
INSERT INTO AMBULANTA_USLUGA_TIP (ambulanta_usluga_tip_id, naziv)
    values (2, 'Zaštitna cijepila')/
INSERT INTO AMBULANTA_USLUGA_TIP (ambulanta_usluga_tip_id, naziv)
    values (3, 'Oftamološki pregled')/
INSERT INTO AMBULANTA_USLUGA_TIP (ambulanta_usluga_tip_id, naziv)
    values (4, 'Lab. pretraga krvi')/
INSERT INTO AMBULANTA_USLUGA_TIP (ambulanta_usluga_tip_id, naziv)
    values (5, 'Lab. pretraga mokr.')/ -- mokraće
INSERT INTO AMBULANTA_USLUGA_TIP (ambulanta_usluga_tip_id, naziv)
    values (6, 'Kiruški zahvati')/
INSERT INTO AMBULANTA_USLUGA_TIP (ambulanta_usluga_tip_id, naziv)
    values (7, 'Pregled zubi')/
INSERT INTO AMBULANTA_USLUGA_TIP (ambulanta_usluga_tip_id, naziv)
    values (8, 'Kastriranje')/

-- goveda,konji
INSERT INTO AMBULANTA_USLUGA_TIP (ambulanta_usluga_tip_id, naziv)
    values (9, 'preg. i lij. teladi')/
INSERT INTO AMBULANTA_USLUGA_TIP (ambulanta_usluga_tip_id, naziv)
    values (10, 'preg. i lij. ždreb.')/ -- pregled ždrebadii
    INSERT INTO AMBULANTA_USLUGA_TIP (ambulanta_usluga_tip_id, naziv)
    values (11, 'Telenje')/
INSERT INTO AMBULANTA_USLUGA_TIP (ambulanta_usluga_tip_id, naziv)
    values (12, 'Carski rez')/
INSERT INTO AMBULANTA_USLUGA_TIP (ambulanta_usluga_tip_id, naziv)
    values (13, 'Korekcija papaka')/

--svinje
INSERT INTO AMBULANTA_USLUGA_TIP (ambulanta_usluga_tip_id, naziv)
    values (14, 'ovariotomija prasadi')/
INSERT INTO AMBULANTA_USLUGA_TIP (ambulanta_usluga_tip_id, naziv)
    values (15, 'Ovariotomija krmača')/

--koze,ovce
INSERT INTO AMBULANTA_USLUGA_TIP (ambulanta_usluga_tip_id, naziv)
    values (16, 'Pomoć kod poroda')/

--Tablica ''AMBULANTA_USLUGA'':
-- psi,mačke - PREGLED
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (1, 'Pregled i liječenje', 1, 1, 90.00, 'Pregled i liječenje pasa')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (2, 'Pregled i liječenje', 1, 2, 80.00, 'Pregled i liječenje mačaka')/

-- goveda,konji - PREGLED
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (3, 'Pregled i liječenje', 1, 3, 120.00, 'Pregled i liječenje goveda')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (4, 'Pregled i liječenje', 9, 3, 90.00, 'Pregled i liječenje teladi')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (5, 'Pregled i liječenje', 1, 4, 120.00, 'Pregled i liječenje konja')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (6, 'Pregled i liječenje', 10, 4, 90.00, 'Pregled i liječenje ždrebadii')/

-- svinja - PREGLED
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (7, 'Pregled i liječenje', 1, 5, 90.00, 'Pregled i liječenje svinja')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (8, 'Pregled i liječenje', 1, 5, 50.00, 'Pregled i liječenje prasadi')/

-- ovce,koze - PREGLED
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (9, 'Pregled i liječenje', 1, 6, 65.00, 'Pregled i liječenje ovca')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (10, 'Pregled i liječenje', 1, 7, 65.00, 'Pregled i liječenje koza')/

------------------------------------------------------------------------------------------------------------------------

-- psi,mačke - ZAŠTITNA CIJEPILA
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (11, 'Zaštitna cijepila', 2, 1, 120.00, 'Zaštitna cijepila za psa')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (12, 'Zaštitna cijepila', 2, 2, 110.00, 'Zaštitna cijepila za mačke')/

------------------------------------------------------------------------------------------------------------------------

-- psi,mačke - OFTAMOLOŠKI PREGLED
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (13, 'Oftamološki pregled', 3, 1, 90.00, 'Oftamološki pregled pasa')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (14, 'Oftamološki pregled', 3, 2, 80.00, 'Oftamološki pregled mačaka')/

-- goveda,konji - OFTAMOLOŠKI PREGLED
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (15, 'Oftamološki pregled', 3, 3, 120.00, 'Oftamološki pregled goveda')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (16, 'Oftamološki pregled', 3, 3, 90.00, 'Oftamološki pregled teladi')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (17, 'Oftamološki pregled', 3, 4, 120.00, 'Oftamološki pregled konja')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (18, 'Oftamološki pregled', 3, 4, 90.00, 'Oftamološki pregled ždrebadii')/

-- svinja - OFTAMOLOŠKI PREGLED
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (19, 'Pregled i liječenje', 3, 5, 90.00, 'Oftamološki pregled svinja')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (20, 'Pregled i liječenje', 3, 5, 50.00, 'Oftamološki pregled prasadi')/

-- ovce,koze - OFTAMOLOŠKI PREGLED
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (21, 'Pregled i liječenje', 3, 6, 65.00, 'Oftamološki pregled ovca')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (22, 'Pregled i liječenje', 3, 7, 65.00, 'Oftamološki pregled koza')/

------------------------------------------------------------------------------------------------------------------------

-- psi,mačke - Lab. pretraga krvi i mokraće
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (23, 'Lab. pretraga krvi', 4, 1, 100.00, 'Lab. pretraga krvi za psa')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (24, 'Lab. pretraga krvi', 4, 2, 90.00, 'Lab. pretraga krvi za mačke')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (25, 'Lab. pretraga mokr.', 5, 1, 40.00, 'Lab. pretraga mokraće za psa')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (26, 'Lab. pretraga mokr.', 5, 2, 30.00, 'Lab. pretraga mokraće za mačke')/

------------------------------------------------------------------------------------------------------------------------

-- psi,mačke - Kiruški zahvati
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (27, 'Kiruški zahvati', 6, 1, 200.00, 'Kiruški zahvati za psa (lakše)')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (28, 'Kiruški zahvati', 6, 2, 200.00, 'Kiruški zahvati za mačke (lakše)')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (29, 'Kiruški zahvati', 6, 1, 400.00, 'Kiruški zahvati za psa (teža)')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (30, 'Kiruški zahvati', 6, 2, 400.00, 'Kiruški zahvati za mačke (teža)')/

------------------------------------------------------------------------------------------------------------------------

-- psi,mačke Kastriranje

INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (31, 'Kastriranje', 8, 1, 200.00, 'Kastracija psa')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (32, 'Kastriranje', 8, 2, 120.00, 'Kastracija mačaka')/

--konj

INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (33, 'Kastriranje', 8, 4, 895.00, 'Kastracija konja')/

--svinja

INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (34, 'Kastriranje', 8, 5, 350.00, 'Kastracija svinje')/

------------------------------------------------------------------------------------------------------------------------

-- goveda, konji

INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (35, 'Telenje', 11, 3, 200.00, 'Telenje')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (36, 'Carski Rez', 12, 3, 800.00, 'Carski rez goveda')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (37, 'Carski Rez', 12, 4, 800.00, 'Carski rez konja')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (38, 'Korekcija papaka', 13, 3, 150.00, 'Korekcija papaka - goveda')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (39, 'Korekcija papaka', 13, 4, 150.00, 'Korekcija papaka - konji')/

------------------------------------------------------------------------------------------------------------------------

-- svinja

INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (40, 'Ovariotomija prasadi', 14, 5, 120.00, 'Ovariotomija prasadi')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (41, 'Ovariotomija krmači', 15, 5, 150.00, 'Ovariotomija krmači')/

------------------------------------------------------------------------------------------------------------------------

-- ovce,koze

INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (42, 'Pomoć kod poroda', 16, 6, 100.00, 'Pomoć kod poroda - Ovca')/
INSERT INTO AMBULANTA_USLUGA (AMBULANTA_USLUGA_ID, NAZIV, AMBULANTA_USLUGA_TIP_ID, ZIVOTINJA_TIP_ID, CIJENA, OPIS)
    values (43, 'Pomoć kod poroda', 16, 7, 100.00, 'Pomoć kod poroda - Koza')/


 --------------------------------------------------------------------------------------------------------

--Tablica ''AMBULANTA'':

INSERT INTO AMBULANTA (AMBULANTA_ID, AMBULANTA_USLUGA_ID, DATUM, OPIS)
    values (1, 1, TO_DATE('05.02.2008 10:00:00', 'DD.MM.YYYY hh24:mi:ss'), 'Pregled buha i parazita - Pas')/
INSERT INTO AMBULANTA (AMBULANTA_ID, AMBULANTA_USLUGA_ID, DATUM, OPIS)
    values (2, 32, TO_DATE('06.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'), 'Kastriranje - Mačak')/
INSERT INTO AMBULANTA (AMBULANTA_ID, AMBULANTA_USLUGA_ID, DATUM, OPIS)
    values (3, 31, TO_DATE('06.02.2008 11:00:00', 'DD.MM.YYYY hh24:mi:ss'), 'Kastriranje - Pas')/
INSERT INTO AMBULANTA (AMBULANTA_ID, AMBULANTA_USLUGA_ID, DATUM, OPIS)
    values (4, 27, TO_DATE('07.02.2008 09:00:00', 'DD.MM.YYYY hh24:mi:ss'), 'Kiruški zahvat - Pas (lakše)')/
INSERT INTO AMBULANTA (AMBULANTA_ID, AMBULANTA_USLUGA_ID, DATUM, OPIS)
    values (5, 2, TO_DATE('07.02.2008 12:00:00', 'DD.MM.YYYY hh24:mi:ss'), 'Pregled buha i parazita - Mačka')/
INSERT INTO AMBULANTA (AMBULANTA_ID, AMBULANTA_USLUGA_ID, DATUM, OPIS)
    values (6, 2, TO_DATE('07.02.2008 13:00:00', 'DD.MM.YYYY hh24:mi:ss'), 'Pregled buha i parazita - Mačka')/
INSERT INTO AMBULANTA (AMBULANTA_ID, AMBULANTA_USLUGA_ID, DATUM, OPIS)
    values (7, 11, TO_DATE('08.02.2008 11:00:00', 'DD.MM.YYYY hh24:mi:ss'), 'Zaštitna cijepila - Pas')/

------------------------------------------------------------------------------------------------------------------------

--Tablica ''AMBULANTA_ZAPOSLENIK'':

INSERT INTO AMBULANTA_ZAPOSLENIK (AMBULANTA_ZAPOSLENIK_ID, AMBULANTA_ID, ZAPOSLENIK_ID)
    values (1,1,3)/
INSERT INTO AMBULANTA_ZAPOSLENIK (AMBULANTA_ZAPOSLENIK_ID, AMBULANTA_ID, ZAPOSLENIK_ID)
    values (2,2,4)/
INSERT INTO AMBULANTA_ZAPOSLENIK (AMBULANTA_ZAPOSLENIK_ID, AMBULANTA_ID, ZAPOSLENIK_ID)
    values (3,3,4)/
INSERT INTO AMBULANTA_ZAPOSLENIK (AMBULANTA_ZAPOSLENIK_ID, AMBULANTA_ID, ZAPOSLENIK_ID)
    values (4,4,5)/
INSERT INTO AMBULANTA_ZAPOSLENIK (AMBULANTA_ZAPOSLENIK_ID, AMBULANTA_ID, ZAPOSLENIK_ID)
    values (5,5,3)/
INSERT INTO AMBULANTA_ZAPOSLENIK (AMBULANTA_ZAPOSLENIK_ID, AMBULANTA_ID, ZAPOSLENIK_ID)
    values (6,6,3)/
INSERT INTO AMBULANTA_ZAPOSLENIK (AMBULANTA_ZAPOSLENIK_ID, AMBULANTA_ID, ZAPOSLENIK_ID)
    values (7,7,5)/

-----------------------------------------------------------------------------------------------------------------------

--Tablica ''AMBULANTA_KORISNIK_ZIVOTINJA'':

INSERT INTO AMBULANTA_KORISNIK_ZIVOTINJA (AMBULANTA_KORZIV_ID, AMBULANTA_ID, KORISNIK_ZIVOTINJA_ID)
    values (1, 1, 1)/
INSERT INTO AMBULANTA_KORISNIK_ZIVOTINJA (AMBULANTA_KORZIV_ID, AMBULANTA_ID, KORISNIK_ZIVOTINJA_ID)
    values (2, 2, 2)/
INSERT INTO AMBULANTA_KORISNIK_ZIVOTINJA (AMBULANTA_KORZIV_ID, AMBULANTA_ID, KORISNIK_ZIVOTINJA_ID)
    values (3, 3, 1)/
INSERT INTO AMBULANTA_KORISNIK_ZIVOTINJA (AMBULANTA_KORZIV_ID, AMBULANTA_ID, KORISNIK_ZIVOTINJA_ID)
    values (4, 4, 5)/
INSERT INTO AMBULANTA_KORISNIK_ZIVOTINJA (AMBULANTA_KORZIV_ID, AMBULANTA_ID, KORISNIK_ZIVOTINJA_ID)
    values (5, 5, 2)/
INSERT INTO AMBULANTA_KORISNIK_ZIVOTINJA (AMBULANTA_KORZIV_ID, AMBULANTA_ID, KORISNIK_ZIVOTINJA_ID)
    values (6, 6, 7)/
INSERT INTO AMBULANTA_KORISNIK_ZIVOTINJA (AMBULANTA_KORZIV_ID, AMBULANTA_ID, KORISNIK_ZIVOTINJA_ID)
    values (7, 7, 1)/

------------------------------------------------------------------------------------------------------------------------






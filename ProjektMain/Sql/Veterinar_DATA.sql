

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

INSERT INTO zaposlenici_dolazak (zaposlenik_id, datum, datum_dolaska,datum_odlaska)
    values (1,
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 14:00:00', 'DD.MM.YYYY hh24:mi:ss'))/

INSERT INTO zaposlenici_dolazak (zaposlenik_id, datum, datum_dolaska,datum_odlaska)
    values (2,
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 14:00:00', 'DD.MM.YYYY hh24:mi:ss'))/

INSERT INTO zaposlenici_dolazak (zaposlenik_id, datum, datum_dolaska,datum_odlaska)
    values (3,
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 14:00:00', 'DD.MM.YYYY hh24:mi:ss'))/

INSERT INTO zaposlenici_dolazak (zaposlenik_id, datum, datum_dolaska,datum_odlaska)
    values (4,
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 14:00:00', 'DD.MM.YYYY hh24:mi:ss'))/

INSERT INTO zaposlenici_dolazak (zaposlenik_id, datum, datum_dolaska,datum_odlaska)
    values (5,
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('01.02.2008 14:00:00', 'DD.MM.YYYY hh24:mi:ss'))/

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

INSERT INTO zaposlenici_dolazak (zaposlenik_id, datum, datum_dolaska,datum_odlaska)
    values (5,
            TO_DATE('02.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('02.02.2008 08:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            TO_DATE('02.02.2008 14:00:00', 'DD.MM.YYYY hh24:mi:ss'))/


-------------------------------------------------------------------------------------


INSERT INTO zaposlenici_odsutnost (odsutnost_id, zaposlenik_id, odsutnost_tip_id, datum_pocetka, datum_kraja)
    VALUES (1,5,1,TO_DATE('03.02.2008','DD.MM.YYYY'),TO_DATE('05.02.2008','DD.MM.YYYY'))/


-------------------------------------------------------------------------------------
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
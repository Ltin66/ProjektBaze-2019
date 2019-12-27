--------------------------------------------------------------------------------------------------------------------------------------------------
--1. prikaz zaposlenika (View) -- KORISTIMO MAT VIEW

CREATE VIEW zap_view AS select ZAPOSLENIK_ID, ime, prezime, sifra from zaposlenik;

--6. prikazi inspekcije (View)

create view insp_view as select INSPEKCIJA_ID,DATUM,OPIS,CIJENA from
	INSPEKCIJA inner join inspekcija_tip on INSPEKCIJA.INSPEKCIJA_TIP_ID = INSPEKCIJA_TIP.INSPEKCIJA_TIP_ID;

--------------------------------------------------------------------------------------------------------------------------------------------------
--6. Prikaži inspekcije - view

--CREATE VIEW inspekcia_view AS
--  SELECT * FROM INSPEKCIJA;


-- INFO O ZAPOSLENICIMA OK RADI

CREATE OR  REPLACE VIEW VO_OD_DOK_INFO
    (ID,Ime,Srednje_Ime,Prezime,Sifra,Datum_pocetka,Biljeske)
    AS
    SELECT ZAP.ZAPOSLENIK_ID ID, ZAP.IME Ime,ZAP.SREDNJE_IME Srednje_Ime,
           ZAP.PREZIME Prezime, ZAP.SIFRA Sifra,
           RS.DATUM_POCETKA Datum_pocetka,   RS.BILJESKE Biljeske

    FROM ZAPOSLENIK ZAP JOIN RADNI_STATUS RS ON ZAP.ZAPOSLENIK_ID = RS.ZAPOSLENIK_ID
    JOIN RADNI_STATUS_TIP RST ON RS.RADNI_STATUS_TIP_ID = RST.RADNI_STATUS_TIP_ID
    WHERE DATUM_POCETKA =
          (SELECT MAX(RAS.Datum_pocetka) FROM RADNI_STATUS RAS
          WHERE RAS.ZAPOSLENIK_ID = ZAP.ZAPOSLENIK_ID )
          AND RST.NAZIV = 'doktor';

--test

select * from VO_OD_DOK_INFO;



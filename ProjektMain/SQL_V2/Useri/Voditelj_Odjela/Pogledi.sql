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



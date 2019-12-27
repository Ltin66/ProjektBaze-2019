--------------------------------------------------------------------------------------------------------------------------------------------------

--5. prikazi doktora za pregled ID (funkcija)

CREATE FUNCTION dok_preg_id (in_amb_id NUMBER)
    RETURN varchar
IS
    doktor varchar(100);
BEGIN
    select concat(concat(ime,' '),prezime) into doktor from (select ime, prezime from ambulanta
        inner join AMBULANTA_ZAPOSLENIK on AMBULANTA.AMBULANTA_ID = AMBULANTA_ZAPOSLENIK.AMBULANTA_ID
            inner join  ZAPOSLENIK on AMBULANTA_ZAPOSLENIK.ZAPOSLENIK_ID = ZAPOSLENIK.ZAPOSLENIK_ID where (ambulanta.AMBULANTA_ID = in_amb_id));
return doktor;
END;

--------------------------------------------------------------------------------------------------------------------------------------------------

select DOK_PREG_ID(1) from DUAL;




-- Informacije o Doktorima

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


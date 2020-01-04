--------------------------------------------------------------------------------------------------------------------------------------------------

--5. prikazi doktora za pregled ID (funkcija)

CREATE OR REPLACE FUNCTION dok_preg_id (in_amb_id NUMBER)
    RETURN varchar
IS
    imena varchar(100);
BEGIN

    Select listagg(Doktor,',') WITHIN GROUP(order by gruper) Doktori INTO imena  from
        (select concat(concat(ime,' '),prezime) Doktor,gruper  from (
            select ime, prezime,'1' gruper from ambulanta
                inner join AMBULANTA_ZAPOSLENIK on AMBULANTA.AMBULANTA_ID = AMBULANTA_ZAPOSLENIK.AMBULANTA_ID
                inner join  ZAPOSLENIK on AMBULANTA_ZAPOSLENIK.ZAPOSLENIK_ID = ZAPOSLENIK.ZAPOSLENIK_ID where (ambulanta.AMBULANTA_ID = in_amb_id)))
    GROUP BY gruper;

    return imena;
END;

--------------------------------------------------------------------------------------------------------------------------------------------------

select DOK_PREG_ID(1) from DUAL;


-- Informacije o Doktorima









CREATE OR REPLACE FUNCTION dok_insp_id (in_insp_id NUMBER)
    RETURN varchar
IS
    imena varchar(100);
BEGIN

    Select listagg(Doktor,',') WITHIN GROUP(order by gruper) Doktori INTO imena  from
        (select concat(concat(ime,' '),prezime) Doktor,gruper  from (
            select ime, prezime,'1' gruper from INSPEKCIJA_ZAPOSLENIK
                INNER JOIN ZAPOSLENIK ON INSPEKCIJA_ZAPOSLENIK.ZAPOSLENIK_ID = ZAPOSLENIK.ZAPOSLENIK_ID WHERE (INSPEKCIJA_ZAPOSLENIK.INSPEKCIJA_ID = in_insp_id)))
    GROUP BY gruper;

    return imena;
END;




CREATE OR REPLACE FUNCTION kor_insp_id (in_insp_id NUMBER)
    RETURN varchar
IS
    imena varchar(100);
BEGIN

    Select listagg(Doktor,',') WITHIN GROUP(order by gruper) Doktori INTO imena  from
        (select concat(concat(ime,' '),prezime) Doktor,gruper  from (
            select ime, prezime,'1' gruper from INSPEKCIJA_KORISNIK
                INNER JOIN KORISNIK ON INSPEKCIJA_KORISNIK.KORISNIK_ID = KORISNIK.KORISNIK_ID WHERE (INSPEKCIJA_KORISNIK.INSPEKCIJA_ID = in_insp_id)))
    GROUP BY gruper;

    return imena;
END;








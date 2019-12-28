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
                inner join  ZAPOSLENIK on AMBULANTA_ZAPOSLENIK.ZAPOSLENIK_ID = ZAPOSLENIK.ZAPOSLENIK_ID where (ambulanta.AMBULANTA_ID = 1)))
    GROUP BY gruper;

    return imena;
END;

--------------------------------------------------------------------------------------------------------------------------------------------------

select DOK_PREG_ID(1) from DUAL;


-- Informacije o Doktorima

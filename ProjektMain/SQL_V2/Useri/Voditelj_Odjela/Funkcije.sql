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

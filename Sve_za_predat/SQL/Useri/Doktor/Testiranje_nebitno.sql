select * FROM DOKTOR_TIPOVI_ZIVOTINJA
;

select * FROM KORISNIK_VIEW;

--Test
DECLARE
   o_usluga NUMBER;
   o_naziv VARCHAR(40);
   o_datum DATE;
   o_opis CLOB;
BEGIN

   DOKTOR_PACK.selectAMBULANTA(2,o_usluga,o_naziv,o_datum, o_opis);


   DBMS_OUTPUT.PUT_LINE('Usluga :  ' || o_usluga);
   DBMS_OUTPUT.PUT_LINE('Naziv usluge :  ' || o_naziv);
   DBMS_OUTPUT.PUT_LINE('Datum :  ' || o_datum);
   DBMS_OUTPUT.PUT_LINE('Opis :  ' || o_opis);

END;


/BEGIN
   DOKTOR_PACK.INSERTAMBULANTA(8, 12, TO_DATE('08.02.2008 11:30:00', 'DD.MM.YYYY hh24:mi:ss'), 'dasdsadsadassdaasddsa');
END;
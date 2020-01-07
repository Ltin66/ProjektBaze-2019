create or replace package svi_preg_kor_id
as
  type test_record is record (AMBULANTA_ID number, ZIVOTINJA_ID number,AMBULANTA_USLUGA_ID number ,datum date); --sto ce vratiti
  type test_table is table of test_record;

  function vrati_tablicu(kor_id IN NUMERIC) return test_table pipelined;

end;
/

-----------------------------------------------------------------

create or replace package body svi_preg_kor_id
as

  function vrati_tablicu(kor_id IN NUMERIC) return test_table pipelined
  is
  begin
    for item in (
              select A.AMBULANTA_ID AMBULANTA_ID, KZ.ZIVOTINJA_ID ZIVOTINJA_ID, A.AMBULANTA_USLUGA_ID AMBULANTA_USLUGA_ID,A.DATUM DATUM  from AMBULANTA_KORISNIK_ZIVOTINJA AKZ join KORISNIK_ZIVOTINJA KZ ON AKZ.KORISNIK_ZIVOTINJA_ID = KZ.KORISNIK_ZIVOTINJA_ID
        JOIN AMBULANTA A ON AKZ.AMBULANTA_ID = A.AMBULANTA_ID WHERE KZ.KORISNIK_ID = kor_id
    ) loop
      pipe row (item);
    end loop;
    return;
  end vrati_tablicu;

end;
/

--TesT
SELECT *  FROM table(svi_preg_kor_id.vrati_tablicu(5));
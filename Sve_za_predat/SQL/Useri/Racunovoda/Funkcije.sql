create or replace package amb_cijena_par_view_pack
as
  type test_record is record (korisnik_id number , cijena number,datum date); --sto ce vratiti
  type test_table is table of test_record;

  function vrati_tablicu(max_datum IN date, min_datum IN date) return test_table pipelined;

end;
/

-----------------------------------------------------------------

create or replace package body amb_cijena_par_view_pack
as

  function vrati_tablicu(max_datum IN date, min_datum IN date) return test_table pipelined
  is
  begin
    for item in (
              select kor.korisnik_id, sum(cijena),min_datum from korisnik kor
        join korisnik_zivotinja kz on kor.korisnik_id = kz.korisnik_id
        join ambulanta_korisnik_zivotinja akz on kz.korisnik_zivotinja_id = akz.korisnik_zivotinja_id
        join ambulanta amb on akz.ambulanta_id = amb.ambulanta_id
        join ambulanta_usluga au on amb.ambulanta_usluga_id = au.ambulanta_usluga_id
        where amb.datum >= min_datum and amb.datum <= max_datum
        Group by kor.korisnik_id
    ) loop
      pipe row (item);
    end loop;
    return;
  end vrati_tablicu;

end;
/


select * from table(amb_cijena_par_view_pack.vrati_tablicu(
    to_date('01.01.3000 00:00:00','dd.mm.yyyy  hh24:mi:ss'),
    to_date('01.01.1000 00:00:00','dd.mm.yyyy  hh24:mi:ss')));

select * from AMBULANTA;
select * from AMBULANTA_KORISNIK_ZIVOTINJA;
select * from KORISNIK_ZIVOTINJA;


select kor.korisnik_id, sum(cijena) from korisnik kor
        join korisnik_zivotinja kz on kor.korisnik_id = kz.korisnik_id
        join ambulanta_korisnik_zivotinja akz on kz.korisnik_zivotinja_id = akz.korisnik_zivotinja_id
        join ambulanta amb on akz.ambulanta_id = amb.ambulanta_id
        join ambulanta_usluga au on amb.ambulanta_usluga_id = au.ambulanta_usluga_id
        where amb.datum <= to_date('01.01.3000','dd.mm.yyyy') and amb.datum >= to_date('01.01.0001','dd.mm.yyyy')
        Group by kor.korisnik_id;
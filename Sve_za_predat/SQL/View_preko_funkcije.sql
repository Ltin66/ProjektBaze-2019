create or replace package zaposlenici_par_view_pack
as
  type test_record is record (ime VARCHAR(40), prezime VARCHAR(40)); --sto ce vratiti
  type test_table is table of test_record;

  function get_test_table(id_ numeric) return test_table pipelined;

end;
/

-----------------------------------------------------------------

create or replace package body zaposlenici_par_view_pack
as

  function get_test_table(id_ numeric) return test_table pipelined
  is
  begin
    for item in (
              select IME,PREZIME from ZAPOSLENIK where ZAPOSLENIK_ID < id_ --select sa parametrom
    ) loop
      pipe row (item);
    end loop;
    return;
  end get_test_table;

end;
/


select * from table(zaposlenici_par_view_pack.get_test_table(15));






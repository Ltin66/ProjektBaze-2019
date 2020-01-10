begin

    CREATE_USER_DOKTOR('mirkomirkec3','1234');
    CREATE_USER_RACUNOVODA('mirkomirkec2','1234');
    CREATE_USER_VODITELJ_ODJELA('mirkomirkec1','1234');

end;

drop user mirkomirkec2 CASCADE ;

select * from AMBULANTA;

select * from KORISNIK;

select * from AMBULANTA_KORISNIK_ZIVOTINJA;


select * FROM KORISNIK_VIEW;


select * from AMBULANTA_ZAPOSLENIK;

select * from KORISNIK_ZIVOTINJA;

begin
    VODITELJ_ODJELA_PACK.DELETEKORISNIK(2);
end;




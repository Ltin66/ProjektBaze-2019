select * from ZAPOSLENIK;

SELECT * from ZAPOSLENIK join RADNI_STATUS RS on ZAPOSLENIK.ZAPOSLENIK_ID = RS.ZAPOSLENIK_ID;


Select, insert, update i delete za radnike


--Upit vraća imena radnika i njihovo radno mjesto

SELECT ZAP.ZAPOSLENIK_ID, ZAP.IME,ZAP.PREZIME, RST.NAZIV
    from ZAPOSLENIK ZAP join RADNI_STATUS RS on ZAP.ZAPOSLENIK_ID = RS.ZAPOSLENIK_ID
    join RADNI_STATUS_TIP RST on RS.RADNI_STATUS_TIP_ID = RST.RADNI_STATUS_TIP_ID
    ORDER BY ZAP.ZAPOSLENIK_ID;


--Upit 1 - upit koji prima id zaposlenika, mjesec i godinu te izračuna njegovu plaću za taj mjesec u toj godini



--Upit 2 - 


--Upit 3 - 


--View 1 - view koji prikazuje zakazane dolaske u sljedecih 7 dana "raspored"

--View 2 - radnici, radno mjesto, i dali su na nekom odmoru u obliku datuma do kad su

--Insert 1 - unesi novog radnika (preko funkcije), automatski inkrementira id, stavlja datum itd.. sa transakcijom

--insert 2 - unesi novi termin za raspored (funkcija)

--Update 1 - ako je dosao na posao pa updejtaj vrijeme dolaska



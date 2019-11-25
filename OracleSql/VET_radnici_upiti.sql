select * from ZAPOSLENIK;

SELECT * from ZAPOSLENIK join RADNI_STATUS RS on ZAPOSLENIK.ZAPOSLENIK_ID = RS.ZAPOSLENIK_ID;




--Upit 1 , vraća imena radnika i njihovo radno mjesto, ako

SELECT ZAP.ZAPOSLENIK_ID, ZAP.IME,ZAP.PREZIME, RST.NAZIV
    from ZAPOSLENIK ZAP join RADNI_STATUS RS on ZAP.ZAPOSLENIK_ID = RS.ZAPOSLENIK_ID
    join RADNI_STATUS_TIP RST on RS.RADNI_STATUS_TIP_ID = RST.RADNI_STATUS_TIP_ID
    ORDER BY ZAP.ZAPOSLENIK_ID;


--Upit 2 - upit koji prima id zaposlenika, mjesec i godinu te izračuna njegovu plaću za taj mjesec u toj godini



--Upit 3 - upit koji vraca radnike (id i ime) koji su odsutni , where datum between  "01.02.2003" npr.


--Upit 4 -

--View 1 - view koji prikazuje

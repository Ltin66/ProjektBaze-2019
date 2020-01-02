
----------------------------------------------------------------------------------------------------------------

--2.2. view za radne statuse

create view rac_zap_rad_stat as select * from radni_status where datum_kraja = To_Date('01.01.0001 00:00:00',' DD.MM.YYYY hh24:mi:ss');

----------------------------------------------------------------------------------------------------------------

--PREGLED RASP ZA SLJEDECIH 7dana
create view rasporedi_7_dana
    as select * from ZAPOSLENICI_DOLAZAK where datum > current_date - interval '2' day AND datum < current_date + interval '7' day;



--VRSTE RADIH MJESTA:

create view rac_radna_mjesta_tip as select * from RADNI_STATUS_TIP;
--select * from rac_radna_mjesta_tip;

-- INFO O ZAPOSLENICIMA OK RADI




CREATE OR  REPLACE VIEW RAC_ZAP_INFO
    (ID,Ime,Srednje_Ime,Prezime,Sifra,JMBG,Datum_pocetka,NAZIV,SATNICA,BILJESKE,TJEDNISATI)
    AS
    SELECT ZAP.ZAPOSLENIK_ID ID, ZAP.IME Ime,ZAP.SREDNJE_IME Srednje_Ime,
           ZAP.PREZIME Prezime, ZAP.SIFRA Sifra, Zap.JMBG JMBG,
           RS.DATUM_POCETKA Datum_pocetka,
           RST.NAZIV NAZIV,RSS.SATNICA SATNICA,
           RSS.BILJESKE BILJESKE,RSS.TJEDNISATI TJEDNISATI
    FROM ZAPOSLENIK ZAP LEFT JOIN
        (SELECT HDS.ZAPOSLENIK_ID ZAPOSLENIK_ID,HDS.DATUM_POCETKA DATUM_POCETKA FROM
            (SELECT RAS.ZAPOSLENIK_ID ZAPOSLENIK_ID,MAX(RAS.Datum_pocetka) DATUM_POCETKA FROM RADNI_STATUS RAS
            WHERE RAS.DATUM_KRAJA = TO_DATE('01.01.0001 00:00:00','DD.MM.YYYY hh24:mi:ss')
            GROUP BY RAS.ZAPOSLENIK_ID ) HDS) RS
        ON ZAP.ZAPOSLENIK_ID = RS.ZAPOSLENIK_ID
        LEFT JOIN RADNI_STATUS RSS
        ON RSS.ZAPOSLENIK_ID = ZAP.ZAPOSLENIK_ID AND RSS.DATUM_POCETKA = RS.DATUM_POCETKA
        LEFT JOIN RADNI_STATUS_TIP RST ON RSS.RADNI_STATUS_TIP_ID = RST.RADNI_STATUS_TIP_ID;


-- TEST

select * from RAC_ZAP_INFO;

select * from RADNI_STATUS_TIP;

select * from RADNI_STATUS;

insert into RADNI_STATUS ( zaposlenik_id, datum_pocetka, biljeske, satnica, tjednisati, radni_status_tip_id)
    values (1,TO_DATE('05.02.2012 10:00:00', 'DD.MM.YYYY hh24:mi:ss'),
            'DADADA',12.2,12,5);




1. placa zaposlenika ID za n-ti mjesec u m-toj godini procedura
(satnica svakog zaposlenika piše u RADNI_STATUS,
PROMIJENIO SAM TABLICU RADNI_STATUS i u Veterinar_DATA tako da unosi koliko je sati odradio)

pomnoži se ukupan broj radnih_satii iz ZAPOSLENIK_DOLAZAK ali samo za određeni mjesec u određenoj godini
za određenog zaposlenika ID



2. unos novog zaposlenika procedura

mrvicu je kompliciran,
    jedna proc za unos novog radnog statusa,
    view za radne statuse, ORDER BY DATUM
    jedna proc za unos zaposlenika

    samo 2 inserta i jedan select *;

    jer nemozemo direktno dodati zaposlenika ako nema radni status
    a racunovoda nemoze dodati zaposlenika na radni status ako nemoze vidit koje svi radni statusi postoje

3. unos rasporeda procedura
(za zaposlenika ID unesi u raspred novi termin koje je : 
<UnsesnoVijelem dolaska> VrijemeOdlaska = <Uneseno Vrijeme Dolaska > + <Unsesni sati koje treba odraditi >)


unesemo id zaposlenika,datum kada treba doci na posao "datum", i koliko sati treba odraditi

u tablicu raspored insertamo id zzaposlenika, datum (datum kada treba doci na posao )
i

4. pregled rasporeda za sljedecih 7 dana (View
(create view as dkkdk select * from raspored where datum >= CurrentDate - 7 dana)

5. update vrijeme dolaska procedura
update viejme dolaska za dolazak ID

6. izracunaj cijenu za pregled ID procedura
za pregled ID vrati mi njegovu cijenu

7. izracunaj cijenu za inspekciju ID procedura
za inspekcijju ID vrati mi njegovu Cijenu



8. za svakog korisnika vrati njegovu kupnu cijne+u svih pregleda u ambulanti od jedong do drugog datuma procedura
9. kao 8. samo za insekcije procedura

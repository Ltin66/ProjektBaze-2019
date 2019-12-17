1. placa zaposlenika ID za n-ti mjesec u m-toj godini procedura
(TODO )

2. unos novog zaposlenika procedura
(inser into zaposlenik (<Uneseno ime> <-||- Srednje Ime> <-||- prezime > ..... ))

3. unos rasporeda procedura
(za zaposlenika ID unesi u raspred novi termin koje je : 
<UnsesnoVijelem dolaska> VrijemeOdlaska = <Uneseno Vrijeme Dolaska > + <Unsesni sati koje treba odraditi >)


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

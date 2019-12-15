1. placa zaposlenika za n-ti mjesec u m-toj godini 
(TODO )

2. unos novog zaposlenika 
(inser into zaposlenik (<Uneseno ime> <-||- Srednje Ime> <-||- prezime > ..... ))

3. unos rasporeda
(za zaposlenika ID unesi u raspred novi termin koje je : 
<UnsesnoVijelem dolaska> VrijemeOdlaska = <Uneseno Vrijeme Dolaska > + <Unsesni sati koje treba odraditi >)


4. pregled rasporeda za sljedecih 7 dana (View)
(create view as dkkdk select * from raspored where datum >= CurrentDate - 7 dana)

5. update vrijeme dolaska
update viejme dolaska za dolazak ID

6. izracunaj cijenu za pregled ID
za pregled ID vrati mi njegovu cijenu

7. izracunaj cijenu za inspekciju ID
za inspekcijju ID vrati mi njegovu Cijenu


mOždA kAsnIjE

8. za svakog korisnika vrati njegovu kupnu cijne+u svih pregleda u ambulanti
9. kao 8. samo za insekcije

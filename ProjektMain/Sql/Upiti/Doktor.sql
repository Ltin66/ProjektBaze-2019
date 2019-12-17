1. info o ambulanti za ambulantaID
(u proceduru unesem ID ambulante  , dobijem sve podatke o tom pregledu)

2. sljedecih n zakazanih pregleda (kao funkcija)
(unesemo broj n i dobimo prvih n pregleda (zakazani pregledi su oni kojim ja datum "01.01.01" (treba vidit ali ja mislim da je taj)))

3. dodaj 1 pregled , 1 doktora i 1 KorisnikZivotinja za taj pregled (procedura)
(unesemo podatke za za pregled, preko rocedure i izvršimo transakciju , unosimo IDdoktora za pregled i ID KorisnikZivotinja, ako 
je uneseni datum "02.02.02" onda neka ga uense kao CurrentDate(), i unosimo ID tipa pregleda, dali je pregled za psa mmačku itd...)                                                                                               

4. Izmjeni opis pregleda procedura
(update opis from ambulanta where ambulantaID = <Uneseni ID>)                                                                                               

5. dodaj korisnika procedura
(insert korisnika sa njegovim podacima)                                                                                               

6. dodaj zivotinju procedura
(kao 5. ali se treba unijeti i korisnikID tako da se unese redak i u KorisnikZivotinja za tog korisnika i tu zivotinju)                                                                                               

7. izbrisi korisnika procedura
(delete from korisnik where korisnikid = <uneseni ID>)                                                                                               

8. izbrisi zivotinju procedura
(kao 6, kod brisanja prvo se moraju izbrisati svi iz KorisnikZivotinja za tu zivotinju i onda se brise zivotinja, )                                                                                               

9. materializiran pogled - svi  korisnici
(mat pogled, ima primjer u Veterinar_Table_Pogledi.sql, isto tako samo za korisnik i sve podatke o njima(atributi te tablice))                                                                                               

10. svi pregledi za Korisnik iD funkcija
(za uneseni KorisnikID daj mi sve Ambulante u za koje je (AmbulantaID join KorisnikZivotinjaID where KorisnikID = <uneseniID> ) 
 (to je otp pisano, ne ide tako sql nego se jos treba sa jednom tablicom spojiti ))                                                                                                         

  
  
  
  11.  pogled - sve KorisnikID i za svaki ispisi njegovu zivotinju (i one korisnike koji nemaju zivotinju)
  12 kolicina zivotinja i kolicina pregleda za korisnik id procedura
  (to je group by , samo nas zanima suma pregleda i suma(broj zivotanja za svakog korisnika)

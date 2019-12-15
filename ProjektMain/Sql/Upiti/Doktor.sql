1. info o ambulanti za korisnik ID i doktor ID 
(u proceduru unesem ID ambulante i ID doktora , dobijem sve podatke o pregledima za ID doktora i ID korisnika, prvo treba naci sve 
ID za korisnikZivotinja ciji je ID korisnika jednak unesenom , pa treba naci sve Ambulante za koje je IDKorisnikZivotinja jednak prije 
nađenima te da je za TE ambulante bio DoktorID uneseni DoktorId)
2. sljedecih n zakazanih pregleda 
(unesemo broj n i dobimo prvih n pregleda (zakazani pregledi su oni kojim ja datum "01.01.01" (treba vidit ali ja mislim da je taj)))
3. dodaj 1 pregled , 1 doktora i 1 KorisnikZivotinja za taj pregled
(unesemo podatke za za pregled, preko rocedure i izvršimo transakciju , unosimo IDdoktora za pregled i ID KorisnikZivotinja, ako 
je uneseni datum "02.02.02" onda neka ga uense kao CurrentDate(), i unosimo ID tipa pregleda, dali je pregled za psa mmačku itd...)                                                                                               
4. Izmjeni opis pregleda
(update opis from ambulanta where ambulantaID = <Uneseni ID>)                                                                                               
5. dodaj korisnika
(insert korisnika sa njegovim podacima)                                                                                               
6. dodaj zivotinju
(kao 5. ali se treba unijeti i korisnikID tako da se unese redak i u KorisnikZivotinja za tog korisnika i tu zivotinju)                                                                                               
7. izbrisi korisnika 
(delete from korisnik where korisnikid = <uneseni ID>)                                                                                               
8. izbrisi zivotinju
(kao 6, kod brisanja prvo se moraju izbrisati svi iz KorisnikZivotinja za tu zivotinju i onda se brise zivotinja, )                                                                                               
9. materializiran pogled - svi  korisnici
(mat pogled, ima primjer u Veterinar_Table_Pogledi.sql, isto tako samo za korisnik i sve podatke o njima(atributi te tablice))                                                                                               
10. svi pregledi za Korisnik iD 
(za uneseni KorisnikID daj mi sve Ambulante u za koje je (AmbulantaID join KorisnikZivotinjaID where KorisnikID = <uneseniID> ) 
 (to je otp pisano, ne ide tako sql nego se jos treba sa jednom tablicom spojiti ))                                                                                                         

  
  
  Možda kasnije, ako bude bilo vremena, jer nemamo group by i ako bude trebao jos jedan view >
  11.  pogled - sve KorisnikID i za svaki ispisi njegovu zivotinju (i one korisnike koji nemaju zivotinju)
  12 kolicina zivotinja i kolicina pregleda za svakog korisnika
  (to je group by , samo nas zanima suma pregleda i suma(broj zivotanja za svakog korisnika)

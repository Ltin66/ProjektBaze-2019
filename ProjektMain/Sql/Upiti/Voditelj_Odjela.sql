1. prikaz zaposlenika (View)
(create view select * form zaposlenik)

2. izbrisi pregeld sa ID pregled procedura 

(pregledID AKA AmbulantaID, misli se na pregled u Ambulanti, dakle redak u Amb tablici je jedan "pregled u ambulanti" )  

(treba izbirisati KorisnikZivotinjaAmbulanta za pregled ID , izbrisati ZaposlenikAmbulanta za AmbulantaID i izbrisati AmbulantaID)

3. dodaj doktora na pregled procedura
(insert into ZaposlenikAmbulanta <uneseni DoktorID i AmbulantaID >)

4. izbrisi doktora sa pregleda procedura
(delete from ZaposleniKAmbulanta where DOktorID = <uneseni DoktorID> && AmbulantaID = <unesneni AmbID>)

5. prikazi doktora za pregled ID (funkcija)
(sleect doktorId form Ambulanta where ambID = ambID)


6. prikazi inspekcije (View)
(create view select * from inpsekcije)

7. dodaj inspekciju i doktoa procedura
(unsoimo doktorID i dodamo inspekciju, datum, i ostale podatke o inspekciji)

8. prikazi zakazane inspekcije (View)
(create view select * from Inspekcije where datumInspekcije = todate("01.01.01"))

9. promijeni opis inspekcije procedura
(update opis = <uneseni opis> from inspekcija where inspekcijaID = <uneseniID> )

                                                                     
                                                                     <Kasnijke AKo bude trebalo GroupBY upita>
10. avg broj doktora za na svim prelgedima procedura
(select avg(DokNum) from (select count(DoktorID) as DokNum from Ambulanta join AmbZapposlenik Group By AmbulantaID ))                                                                     

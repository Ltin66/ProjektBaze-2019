1. prikaz zaposlenika (View)
(create view select * form zaposlenik)

2. izbrisi pregeld sa ID pregled
(treba izbirisati KorisnikZivotinjaAmbulanta za pregled ID , izbrisati ZaposlenikAmbulanta za AmbulantaID i izbrisati AmbulantaID)

3. dodaj doktora na pregled
(insert into ZaposlenikAmbulanta <uneseni DoktorID i AmbulantaID >)

4. izbrisi doktora sa pregleda
(delete from ZaposleniKAmbulanta where DOktorID = <uneseni DoktorID> && AmbulantaID = <unesneni AmbID>)

5. prikazi doktora za pregled ID
(sleect * form Ambulanta where DoktorID = DoktorID)


6. prikazi inspekcije (View)
(create view select * from inpsekcije)

7. dodaj inspekciju i doktoa
(unsoimo doktorID i dodamo inspekciju, datum, i ostale podatke o inspekciji)

8. prikazi zakazane inspekcije (View)
(create view select * from Inspekcije where datumInspekcije = todate("01.01.01"))

9. promijeni opis inspekcije
(update opis = <uneseni opis> from inspekcija where inspekcijaID = <uneseniID> )

                                                                     
                                                                     <Kasnijke AKo bude trebalo GroupBY upita>
10. avg broj doktora za prelged
(select avg(DokNum) from (select count(DoktorID) as DokNum from Ambulanta join AmbZapposlenik Group By AmbulantaID ))                                                                     


create table intervencije_tip (
  tipID INTEGER PRIMARY KEY,
  naziv VARCHAR(20),
  cijena NUMERIC(15,2)
)
/


create table intervencije_log(
  intervencijaID INTEGER NOT NULL PRIMARY KEY,
  tipID INTEGER NOT NULL,
  korisnikID INTEGER NOT NULL,
  datum TIMESTAMP NOT NULL,
  opis VARCHAR(200),
  FOREIGN KEY(intervencijaID) REFERENCES skladiste_log(uslugaID),
  FOREIGN KEY(tipID) REFERENCES intervencije_tip(tipID),
  FOREIGN KEY(korisnikID) REFERENCES korisnik(korisnikID)
)
/


create table intervencije_radnici(
  intervenicjaID INTEGER NOT NULL,
  zaposlenikID INTEGER NOT NULL,
  FOREIGN KEY(intervencijeID) REFERENCES intervencije_log(intervencijaID),
  FOREIGN KEY(zaposlenikID) REFERENCES zaposlenici(zaposlenikID)
)
/
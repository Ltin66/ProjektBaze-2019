
create table inspekcije_tip(
  tipID INTEGER PRIMARY KEY,
  naziv VARCHAR(20) NOT NULL,
  cijena NUMERIC(15,2) NOT NULL
)
/

create table inspekcije(
  inspekcijaID INTEGER PRIMARY KEY,
  korisnikID INTEGER NOT NULL,
  cijena_total NUMERIC(15,2),
  FOREIGN KEY(korisnikID) REFERENCES korisnik(korisnikID)
)
/

create table inspekcije_log(
  inspekcijaID INTEGER NOT NULL,
  tipID INTEGER NOT NULL,
  datum DATE,
  izvrseno BOOL,
  opis VARCHAR(200),
  FOREIGN KEY(inspekcijaID) REFERENCES inspekcije(inspekcijaID),
  FOREIGN KEY(tipID) REFERENCES inspekcije_tip(tipID)
)
/

create table inspekcije_radnici(
  inspekcijaID INTEGER NOT NULL,
  zaposlenikID INTEGER NOT NULL,
  FOREIGN KEY(inspekcijaID) references inspekcije(inspekcijaID),
  FOREIGN KEY(zaposlenikID) references zaposlenici(zaposlenikID)
)
/
create table zivotinja_velicina (
  velicina INTEGER PRIMARY KEY
)
/

create table zivotinja_tip (
  tipID INTEGER PRIMARY KEY,
  naziv VARCHAR(20) NOT NULL,
  velicina INTEGER NOT NULL,
  FOREIGN KEY(velicina) REFERENCES zivotinja_velicina(velicina)
)
/

create table zivotinja (
  zivotinjaID INTEGER PRIMARY KEY,
  tipID INTEGER NOT NULL,
  ime VARCHAR(20) NOT NULL,
  FOREIGN KEY(tipID) REFERENCES zivotinja_tip(tipID)
)
/

create table korisnik_zivotinja(
  kor_zivID CHAR NOT NULL,
  zivotinjaID INTEGER NOT NULL,
  korisnikID INTEGER NOT NULL,
  FOREIGN KEY(zivotinjaID) REFERENCES zivotinja(zivotinjaID),
  FOREIGN KEY(korisnikID) REFERENCES korisnik(korisnikID)
)
/
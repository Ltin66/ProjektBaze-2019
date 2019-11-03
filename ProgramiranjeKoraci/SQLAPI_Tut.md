# Kako radi SQLAPI

### Biblioteke
- #include \<SQLAPI\>

# Spajanje

## 1. Stvaranje objekta za povezivanje sa bazom

- Za spajanje sa db-om potreban nam je SAConnection objekt
- `SAConnection veterinar;` tu smo stvorili SAConnection objekt "veterinar" preko kojeg cemo pristupiti bazi podataka

## 2. Spajanje sa bazom

- SAConnection objekt spajamo sa bazom uz pomoć `Connect` funkcije
- `veterinar.Connect(sDBString, sUserID, sPassword, eSAClient)
  - sDBString - naziv baze  - `XE`
  - sUserID   - username    - `veterinar`
  - sPassword - password    - `1234`
  - eSAClient - sa kojom vrstom baze se spajamo otp. - `SA_Oracle_Client`

- `veterinar.Connect("XE", "veterinar", "1234", "SA_Oracle_Client")`

## Upiti

## 1. Stvaranje objekta za upite

- SACommand

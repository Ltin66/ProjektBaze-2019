

# 1. Komentari

- Bitno je komentirati kod jer radimo u timu
- Kad je neki dio koda gotov onda se komentira ako treba

## Komentar na vrhu dokumenta - Header Comment
- Na vrhu svakog dokumenta treba biti kratki opis što se nalazi i što radi

```
/*
  Autor:
  Datum:
  Opis : 
*/
```
### Npr.
```
/*
  Autor:  Mirko
  Datum:  1.1.2019
  Opis :  Ispisuje Hello World  
*/

#include \<iostream\>

int main {
  std::cout<<"Hello World";
}
```

## Komentar iznad funkcija
- Iznad svake funkcije treba staviti komentar koji opisuje sta radi, koje podatke prima i šta vraca

```
/*
Naziv   : [ime funkcije]
Opis    : [što radi]
Input   : [što prima]
Output  : [što vraca]
*/
```

### Npr.
```
/*
Naziv   : sum
Opis    : Zbraja dva broja
Input   : 
          - int x - prvi broj
          - int y - drugi broj
Output  : 
          - int sum  
*/
int sum(int x, int y) {return x+y;}
```
## Ostali komentari
- nije potrebno stavljati komentar na svaku liniju **ali** ako je neki dio koda kompleksan onda bi bilo dobro opisati ga tako da se nakon bitnih linija stavi komentar i opiše šta rade, **također** ako se neka varijabal vrlo često koristi ili je zbog nečega vrlo bitna, bilo bi dobro staviti komentar odmah gdje je deklarirana  

- npr. `int a; //spremanje broja od korisnika`

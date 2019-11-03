# Kako koristiti .h i .cpp fajlove
https://www.learncpp.com/cpp-tutorial/header-files/


- osim main.cpp imati cemo druge fajlove, .h i .cpp

- ako npr. želimo sve funkcije ili objekte ili strukture vezanu uz npr. zbrajanje 2 broja staviti u drugi fajl moramo napraviti .h i .cpp fajlove

- .h i .cpp moraju imati isto ime

- u .h stavljamo komentare iznad funckija, tamo deklariramo funkcije, objekte i strukture

## Primjer :

### main.cpp
```
#include <iostream>
#include "test.h" 

int main() {
  std::cout << double_(2);
}
```

### test.h
```
/*
  Opis funkcije
*/
int double_(int x);  // deklaracija funkcije
```

### test.cpp
```
#include "test.h"

int double_(int x){  // kod za funkciju koja je deklarirana u test.h
  return x+x;
}
```

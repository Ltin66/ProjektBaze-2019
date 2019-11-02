## Kako spojiti SQLAPI++ u Clion-u 
Ako je napravljeno sve šta piše u Setup.md mozemo krenuti na testiranje

# Stvaranje projekta

1. U Clion-u stvoriti novi projekt C++ Executable sa c++ 14 i nazovite ga "Testing"
  - Svaki Clion projekt sadrži CMakeLists.txt, text dokument za CMake

2.  CMakeLists.txt bi trebao izgledati ovako :

```
cmake_minimum_required(VERSION 3.15)
project(Testing)

set(CMAKE_CXX_STANDARD 14)

add_executable(Testing main.cpp)
```

# Spajanje SQLAPI++ biblioteke u CMakeLists.txt

**Sva dodavanja koda idu u CMakeLists.txt ispod `add_executable(Testing main.cpp)`**

  Dodavanje SQLAPI include dir u CMakeLists.txt
  
  - U SQLAPI direktoriju nalazi se folder **"include"** u kojem bi trebale biti .h datoteke i neki folderi, također u SQLAPI folderu bi trebao biti **"lib"** folder 
  
  **Unutar zagradi nalazi se put do vašeg "include" foldera**
  
  1. DODAJEMO `INCLUDE_DIRECTORIES(put/do/include/foldera)` 
  
     npr. `INCLUDE_DIRECTORIES(/home/tin/CppDbLibs/SQLAPI/include)`
      
  2. DODAJEMO `LINK_DIRECTORIES(put/do/lib/foldera)`
  
     npr. `LINK_DIRECTORIES(/home/tin/CppDbLibs/SQLAPI/lib)`
 
  
  
**Nakon svih koraka CMakeLists.txt bi trebao izgledati ovako :**

```
cmake_minimum_required(VERSION 3.15)
project(Testing)

set(CMAKE_CXX_STANDARD 14)

add_executable(Testing main.cpp)

INCLUDE_DIRECTORIES(/home/tin/CppDbLibs/SQLAPI/include)

LINK_DIRECTORIES(/home/tin/CppDbLibs/SQLAPI/lib)

TARGET_LINK_LIBRARIES(Testing /home/tin/CppDbLibs/SQLAPI/lib/libsqlapi.a)

target_link_libraries(Testing ${CMAKE_DL_LIBS})
```


# Moguci errori

## “ORA-12154: TNS: could not resolve the connect identifier specified” 
  - Razlog : Oracle Net Listener tj. Oracle XE nije upaljen ili nije stavljeno "XE" kao db name : `con.Connect ("XE",    // database name`
  - Rijesenje : Upalit Oracle i/ili promijeniti db name u "XE"
 
## "undefined reference to dlopen/dlerror/dlsym/dlclose
  - Rijesenje : na dno CMakeLists.txt treba dodati `target_link_libraries(Testing ${CMAKE_DL_LIBS})`






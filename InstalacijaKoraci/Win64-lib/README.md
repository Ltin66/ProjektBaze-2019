# Ako je instaliran oracle i CLion
- izgleda kao da basic client nije potreban

## 1. Mingw instalacija

  - CLion > File > Settings > Build, Execution, Deployment > Toolchains
  
  - trebalo bi biti selektiran "MinGW (default)"
  - na desnom kraju je "Download..." , kliknuti na to, pa na toj stranici > Sourceforge
  - Kad skine MinGW-w64 treba ga pokrenut i instalirat sa postavkama :
  
  ![slika](https://raw.githubusercontent.com/Ltin66/ProjektBaze-2019/master/InstalacijaKoraci/Win64-lib/MinGW_postavke.PNG)
  
  - Nakon instalacije u istom prozoru u Clionu treba promijeniti Environment na instalirani MinGW : 
  
  
  ![slika](https://raw.githubusercontent.com/Ltin66/ProjektBaze-2019/master/InstalacijaKoraci/Win64-lib/MinGW_clion.PNG)
  
  - ako ga nije našao ponovo pokrenite clion
  
## 2. SQLAPI++ instalacija

  - https://www.sqlapi.com/ skinut za win
  - kad se pokrene raspakirajte ga negdje, može i odmah pod C:\
  
  ### U projektu "Testing" kopirat u CMakeLists.txt :
  
  - Piše u LibLink.md šta je šta, samo treba zamijeniti put do foldera, i ime projekta ako je neko drugo
   
  - U TestiranjeCppLib piše kod za testiranje, najbolje probat prvo TestiranjeProjekta_login.md, jedino tako se može vidit dali je dobro napravljeno
  
```
  
cmake_minimum_required(VERSION 3.15)
project(Testing)

set(CMAKE_CXX_STANDARD 14)

add_executable(Testing main.cpp)

INCLUDE_DIRECTORIES(C:/Users/tin/Downloads/SQLAPI/include)

LINK_DIRECTORIES(C:/Users/tin/Downloads/SQLAPI/MinGW-5.1.0-tdm64/lib)

TARGET_LINK_LIBRARIES(Testing C:/Users/tin/Downloads/SQLAPI/MinGW-5.1.0-tdm64/lib/libsqlapi.a -lversion)
target_link_libraries(Testing ${CMAKE_DL_LIBS})

```

 


   

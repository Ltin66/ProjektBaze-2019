# Kako spojiti SQLAPI++ u Clion-u 
Ako je napravljeno sve šta piše u Setup.md mozemo krenuti na testiranje


1. U Clion-u stvoriti novi projekt C++ Executable sa c++ 14 i nazovite ga "Testing"
  - Svaki Clion projekt sadrži CMakeLists.txt, text dokument za CMake

2.  CMakeLists.txt bi trebao izgledati ovako :

```
cmake_minimum_required(VERSION 3.15)
project(Testing)

set(CMAKE_CXX_STANDARD 14)

add_executable(Testing main.cpp)
```



# Moguci errori

- “ORA-12154: TNS: could not resolve the connect identifier specified” 
  - Rijesenje : Oracle Net Listener tj. Oracle XE nije upaljen ili nije stavljeno "XE" kao db name : `con.Connect ("XE",    // database name`
  

cmake_minimum_required(VERSION 3.15)
project(VetApp_1_0)

set(CMAKE_CXX_STANDARD 14)

add_executable(VetApp_1_0 main.cpp dbConnection.cpp dbConnection.h dbTablice.h dbUpiti.h dbTablice.cpp dbUpiti.cpp ui_main.h ui_main.cpp ui_user.cpp ui_user.h User_Menu/ui_menu_Vet_Sys.cpp User_Menu/ui_menu_Vet_Sys.h User_Menu/ui_menu_Voditelj_Odjela.cpp User_Menu/ui_menu_Voditelj_Odjela.h User_Menu/ui_menu_Racunovoda.cpp User_Menu/ui_menu_Racunovoda.h User_Menu/ui_menu_Doktor.cpp User_Menu/ui_menu_Doktor.h)

#linux postavke, za win treba zamijenit lib path

INCLUDE_DIRECTORIES(/home/tin/CppDbLibs/SQLAPI/include)
LINK_DIRECTORIES(/home/tin/CppDbLibs/SQLAPI/lib)
TARGET_LINK_LIBRARIES(VetApp_1_0 /home/tin/CppDbLibs/SQLAPI/lib/libsqlapi.a)
target_link_libraries(VetApp_1_0 ${CMAKE_DL_LIBS})

#[[
cmake_minimum_required(VERSION 3.15)
project(Testing)

set(CMAKE_CXX_STANDARD 14)

add_executable(Testing main.cpp)

INCLUDE_DIRECTORIES(/home/tin/CppDbLibs/SQLAPI/include)
LINK_DIRECTORIES(/home/tin/CppDbLibs/SQLAPI/lib)
TARGET_LINK_LIBRARIES(Testing /home/tin/CppDbLibs/SQLAPI/lib/libsqlapi.a)
target_link_libraries(Testing ${CMAKE_DL_LIBS})
]]

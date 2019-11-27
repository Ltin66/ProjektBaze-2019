cmake_minimum_required(VERSION 3.15)
project(VetApp_1_0)

set(CMAKE_CXX_STANDARD 14)

add_executable(VetApp_1_0 main.cpp dbConnection.cpp)

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

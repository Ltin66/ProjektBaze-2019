cmake_minimum_required(VERSION 3.15)
project(Testing)

set(CMAKE_CXX_STANDARD 14)

add_executable(Testing main.cpp)

INCLUDE_DIRECTORIES(/home/tin/CppDbLibs/SQLAPI/include)
LINK_DIRECTORIES(/home/tin/CppDbLibs/SQLAPI/lib)
TARGET_LINK_LIBRARIES(Testing /home/tin/CppDbLibs/SQLAPI/lib/libsqlapi.a /home/tin/CppDbLibs/SQLAPI/lib/libsqlapiu.a)
target_link_libraries(Testing ${CMAKE_DL_LIBS})
#[[
cmake_minimum_required(VERSION 3.15)
project(Testing)

set(CMAKE_CXX_STANDARD 14)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
#set(CMAKE_PREFIX_PATH "PATH_TO_QT/QT_VERSION/QT_ARCH/lib/cmake")

find_package(Qt5Core REQUIRED)
find_package(Qt5Widgets REQUIRED)
find_package(Qt5Quick REQUIRED)

add_executable(Testing main.cpp )

target_link_libraries(Testing Qt5::Core)
target_link_libraries(Testing Qt5::Widgets)
target_link_libraries(Testing Qt5::Quick)
target_link_libraries(Testing /home/tin/CppDbLibs/SQLAPI/lib/libsqlapi.a)
]]
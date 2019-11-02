#[[cmake_minimum_required(VERSION 3.15)
project(Testing)

set(CMAKE_CXX_STANDARD 14)

add_executable(Testing main.cpp sqltst.cpp)
]]
cmake_minimum_required(VERSION 3.15)
project(books)

set(CMAKE_CXX_STANDARD 14)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
#set(CMAKE_PREFIX_PATH "PATH_TO_QT/QT_VERSION/QT_ARCH/lib/cmake")

find_package(Qt5Core REQUIRED)
find_package(Qt5Widgets REQUIRED)
find_package(Qt5Quick REQUIRED)

add_executable(books main.cpp )

target_link_libraries(books Qt5::Core)
target_link_libraries(books Qt5::Widgets)
target_link_libraries(books Qt5::Quick)
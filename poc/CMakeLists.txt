cmake_minimum_required(VERSION 3.16)

project(poc VERSION 0.0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_CXX_STANDARD 20)

find_package(PkgConfig)
pkg_check_modules(LIBMPV REQUIRED IMPORTED_TARGET GLOBAL mpv)

add_executable(poc poc.cpp)

target_include_directories(poc PRIVATE ${LIBMPV_INCLUDE_DIRS})
target_link_libraries(poc PUBLIC PkgConfig::LIBMPV)


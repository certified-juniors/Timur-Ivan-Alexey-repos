cmake_minimum_required(VERSION 3.0.0)
project(bit_inversion_lib)

file(GLOB SOURCES *.cpp)
file(GLOB INCLUDE_DIRS ${CMAKE_CURRENT_SOURCE_DIR})

set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} "-fprofile-arcs -ftest-coverage -fPIC -O0")

add_library(${PROJECT_NAME} STATIC ${SOURCES})

set(BIT_LIB_LIBRARIES ${PROJECT_NAME} PARENT_SCOPE)
set(BIT_LIB_INCLUDE_DIRS ${INCLUDE_DIRS} PARENT_SCOPE)


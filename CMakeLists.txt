cmake_minimum_required(VERSION 3.0.0)
project(bit)

add_subdirectory(BitCounter)

message("BIT_LIB_LIBRARIES = ${BIT_LIB_LIBRARIES}")
message("BIT_LIB_INCLUDE_DIRS = ${BIT_LIB_INCLUDE_DIRS}")

add_executable(${PROJECT_NAME} main.cpp)

target_include_directories(${PROJECT_NAME} PUBLIC ${BIT_LIB_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME} PRIVATE ${BIT_LIB_LIBRARIES})
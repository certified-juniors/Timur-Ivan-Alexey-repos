cmake_minimum_required(VERSION 3.0.0)
project(memory)

include(CTest)
enable_testing()

file(GLOB INCLUDE_DIRS memoryError)

add_subdirectory(${INCLUDE_DIRS})

message("MEMORYERROR_LIB_LIBRARIES = ${MEMORYERROR_LIB_LIBRARIES}")
message("MEMORYERROR_LIB_INCLUDE_DIRS = ${MEMORYERROR_LIB_INCLUDE_DIRS}")

file(GLOB SOURCES *.cpp)
add_executable(${PROJECT_NAME} ${SOURCES})

target_include_directories(${PROJECT_NAME} PUBLIC ${MEMORYERROR_LIB_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME} PRIVATE ${MEMORYERROR_LIB_LIBRARIES})

add_custom_command (TARGET ${PROJECT_NAME}
    POST_BUILD
    COMMAND bash -c "valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes $<TARGET_FILE:${PROJECT_NAME}>"
)



OPTION(WITH_MEMCHECK "Run with memcheck" OFF)

SET(CMAKE_CXX_STANDARD 17)
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror")

ENABLE_TESTING()
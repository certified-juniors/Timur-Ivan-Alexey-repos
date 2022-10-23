cmake_minimum_required(VERSION 3.0.0)
project(memory)

include(CTest)
enable_testing()

OPTION(WITH_MEMCHECK "Run with memcheck" OFF) #FFFFFFFFFFFFFFF
#SET(CMAKE_CXX_STANDARD 17) #CCCCCCCCCCCCCCCCCC
#SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -Werror") #CCCCCCCCC


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

SET(memcheck_command)

if (WITH_MEMCHECK)
        message("Memcheck enabled")
        SET(memcheck_command ${CMAKE_SOURCE_DIR}/memtest/memtest.sh)
        ADD_TEST(
        NAME BaseTest
        COMMAND ${memcheck_command})
else()
        message("Memcheck disabled")
endif() ######################





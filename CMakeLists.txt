cmake_minimum_required(VERSION 3.0.0)
project(memory)


file(GLOB INCLUDE_DIRS memoryError)

add_subdirectory(${INCLUDE_DIRS})

message("MEMORYERROR_LIB_LIBRARIES = ${MEMORYERROR_LIB_LIBRARIES}")
message("MEMORYERROR_LIB_INCLUDE_DIRS = ${MEMORYERROR_LIB_INCLUDE_DIRS}")

file(GLOB SOURCES *.cpp)
add_executable(${PROJECT_NAME} ${SOURCES})

target_include_directories(${PROJECT_NAME} PUBLIC ${MEMORYERROR_LIB_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME} PRIVATE ${MEMORYERROR_LIB_LIBRARIES})



#option(BUILD_FOR_TEST "build for test" OFF)
#if(BUILD_FOR_TEST)
#add_custom_target(COMMAND valgrind --tool=memcheck --leak-check=yes --show-reachable=yes --num-callers=20 --track-fds=yes $<TARGET_FILE:${PROJECT_NAME}>)
#endif()
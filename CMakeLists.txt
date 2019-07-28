cmake_minimum_required(VERSION 3.0)

set(GAME_NAME App)
#project name
project(${GAME_NAME})

#指定c++版本
add_definitions(-std=c++17)

#source directory
AUX_SOURCE_DIRECTORY(app DIR_SRCS)

#copy resource to ./
file(COPY assets DESTINATION .)

#head file path
INCLUDE_DIRECTORIES(
        app
        module/entt/src
        module/cute_headers
        module/gf/include
)

#add c/cc/cpp files
file(GLOB_RECURSE APP_SOURCES "*.cpp" "core/*.cpp" "helpers/*.cpp" "sys/*.cpp" "utils/*.cpp")
#add executable file
ADD_EXECUTABLE(${GAME_NAME} ${APP_SOURCES})

#find boost
find_package(Boost REQUIRED COMPONENTS
        filesystem
        )
if(NOT Boost_FOUND)
    message("Not found Boost")
endif()

include_directories(${Boost_INCLUDE_DIRS})
#message("${Boost_INCLUDE_DIRS}")
#message("${Boost_LIBRARIES}")

#find gf
include_directories(${GAME_NAME} ${PROJECT_SOURCE_DIR}/module/gf/include)
target_link_libraries(${GAME_NAME} ${PROJECT_SOURCE_DIR}/module/gf-lib/library/libgf0.dylib ${PROJECT_SOURCE_DIR}/module/gf-lib/library/libgfcore0.dylib)

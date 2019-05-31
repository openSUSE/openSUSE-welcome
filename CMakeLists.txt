cmake_minimum_required(VERSION 3.1)

project(opensuse-welcome LANGUAGES CXX)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt5 COMPONENTS Core Quick WebEngine WebChannel REQUIRED)

set(SOURCES main.cpp sysinfo.cpp sysinfo.h qml.qrc launcher.cpp launcher.h enabler.cpp enabler.h)
add_executable(${PROJECT_NAME} ${SOURCES})
target_compile_definitions(${PROJECT_NAME} PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(${PROJECT_NAME} PRIVATE Qt5::Core Qt5::Quick Qt5::WebEngine Qt5::WebChannel)
install(TARGETS opensuse-welcome DESTINATION bin)

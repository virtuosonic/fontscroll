cmake_minimum_required(VERSION 3.16)

project(fontscroll VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.4 REQUIRED COMPONENTS Quick)


qt_add_executable(fontscroll
    main.cpp
)

qt_add_qml_module(fontscroll
    URI fontscroll
    VERSION 1.0
	QML_FILES Main.qml
	RESOURCES Readme.md
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(fontscroll PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.fontscroll
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(fontscroll
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS fontscroll
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

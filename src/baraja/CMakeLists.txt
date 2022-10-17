cmake_minimum_required(VERSION 2.8.3)
project(baraja)

set(CMAKE_CXX_FLAGS "-std=c++11 -g -O3 ${CMAKE_CXX_FLAGS}")

## Find catkin macros and libraries
## if COMPONENTS list like find_package(cat[Ma>kin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS roscpp sensor_msgs message_generation)

## System dependencies are found with CMake's conventions
find_package(Boost REQUIRED COMPONENTS thread system)

find_library(cpprestsdk_LIBRARY cpprest)

if (NOT cpprestsdk_LIBRARY)
    message(WARNING "Library dependency libcpprest-dev was not found. Please install this package before building, otherwise engine services will not be available: sudo apt-get install libcpprest-dev")
    set(BARAJA_SERVICES_ENABLED 0)
else()
    set(BARAJA_SERVICES_ENABLED 1)
endif()

find_package(OpenSSL REQUIRED)

add_message_files(
    FILES
    RawUdp.msg
    RawUdpArray.msg
)

if (${BARAJA_SERVICES_ENABLED})
    ## Generate services in the 'srv' folder
    add_service_files(
      FILES
      SetPlaytable.srv
    )
endif()

## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs  # Or other packages containing msgs
)

###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if you package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
  INCLUDE_DIRS include
  LIBRARIES baraja_lidar baraja_listener
  CATKIN_DEPENDS message_runtime
#  DEPENDS system_lib
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(include ${BOOST_INCLUDE_DIRS} ${catkin_INCLUDE_DIRS})

## Declare a C++ library
# add_library(baraja
#   src/${PROJECT_NAME}/baraja.cpp
# )

 add_library(baraja_listener
  src/baraja_listener.cpp
 )

 add_library(baraja_lidar
  src/baraja_lidar.cpp
  src/bpc_packet.c
  src/baraja_sensorhead.cpp
  src/baraja_services.cpp
 )

## Add cmake target dependencies of the library
## as an example, code may need to be generated before libraries
## either from message generation or dynamic reconfigure
# add_dependencies(baraja ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
add_dependencies(baraja_listener baraja_generate_messages_cpp)
add_dependencies(baraja_lidar baraja_generate_messages_cpp)

## Add cmake target dependencies of the executable
## same as for the library above
# add_dependencies(baraja_node ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

## Specify libraries to link a library or executable target against
target_link_libraries(baraja_lidar
  ${catkin_LIBRARIES}
  ${cpprestsdk_LIBRARY}
  ${OPENSSL_LIBRARIES}
)

target_link_libraries(baraja_listener
  ${catkin_LIBRARIES}
)

target_compile_definitions(baraja_lidar PUBLIC BARAJA_SERVICES_ENABLED=1)

#############
## Install ##
#############

# all install targets should use catkin DESTINATION variables
# See http://ros.org/doc/api/catkin/html/adv_user_guide/variables.html

## Mark executable scripts (Python etc.) for installation
## in contrast to setup.py, you can choose the destination
# install(PROGRAMS
#   scripts/my_python_script
#   DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark executables and/or libraries for installation
# install(TARGETS baraja baraja_node
#   ARCHIVE DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   LIBRARY DESTINATION ${CATKIN_PACKAGE_LIB_DESTINATION}
#   RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
# )

## Mark cpp header files for installation
# install(DIRECTORY include/${PROJECT_NAME}/
#   DESTINATION ${CATKIN_PACKAGE_INCLUDE_DESTINATION}
#   FILES_MATCHING PATTERN "*.h"
#   PATTERN ".svn" EXCLUDE
# )

## Mark other files for installation (e.g. launch and bag files, etc.)
# install(FILES
#   # myfile1
#   # myfile2
#   DESTINATION ${CATKIN_PACKAGE_SHARE_DESTINATION}
# )

#############
## Testing ##
#############

## Add gtest based cpp test target and link libraries
# catkin_add_gtest(${PROJECT_NAME}-test test/test_baraja.cpp)
# if(TARGET ${PROJECT_NAME}-test)
#   target_link_libraries(${PROJECT_NAME}-test ${PROJECT_NAME})
# endif()

## Add folders to be run by python nosetests
# catkin_add_nosetests(test)

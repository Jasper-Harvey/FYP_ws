# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "baraja: 2 messages, 1 services")

set(MSG_I_FLAGS "-Ibaraja:/home/jasper/FYP_ws/src/baraja/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(baraja_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jasper/FYP_ws/src/baraja/msg/RawUdp.msg" NAME_WE)
add_custom_target(_baraja_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "baraja" "/home/jasper/FYP_ws/src/baraja/msg/RawUdp.msg" ""
)

get_filename_component(_filename "/home/jasper/FYP_ws/src/baraja/msg/RawUdpArray.msg" NAME_WE)
add_custom_target(_baraja_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "baraja" "/home/jasper/FYP_ws/src/baraja/msg/RawUdpArray.msg" "baraja/RawUdp"
)

get_filename_component(_filename "/home/jasper/FYP_ws/src/baraja/srv/SetPlaytable.srv" NAME_WE)
add_custom_target(_baraja_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "baraja" "/home/jasper/FYP_ws/src/baraja/srv/SetPlaytable.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(baraja
  "/home/jasper/FYP_ws/src/baraja/msg/RawUdpArray.msg"
  "${MSG_I_FLAGS}"
  "/home/jasper/FYP_ws/src/baraja/msg/RawUdp.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baraja
)
_generate_msg_cpp(baraja
  "/home/jasper/FYP_ws/src/baraja/msg/RawUdp.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baraja
)

### Generating Services
_generate_srv_cpp(baraja
  "/home/jasper/FYP_ws/src/baraja/srv/SetPlaytable.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baraja
)

### Generating Module File
_generate_module_cpp(baraja
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baraja
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(baraja_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(baraja_generate_messages baraja_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jasper/FYP_ws/src/baraja/msg/RawUdp.msg" NAME_WE)
add_dependencies(baraja_generate_messages_cpp _baraja_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jasper/FYP_ws/src/baraja/msg/RawUdpArray.msg" NAME_WE)
add_dependencies(baraja_generate_messages_cpp _baraja_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jasper/FYP_ws/src/baraja/srv/SetPlaytable.srv" NAME_WE)
add_dependencies(baraja_generate_messages_cpp _baraja_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(baraja_gencpp)
add_dependencies(baraja_gencpp baraja_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS baraja_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(baraja
  "/home/jasper/FYP_ws/src/baraja/msg/RawUdpArray.msg"
  "${MSG_I_FLAGS}"
  "/home/jasper/FYP_ws/src/baraja/msg/RawUdp.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/baraja
)
_generate_msg_eus(baraja
  "/home/jasper/FYP_ws/src/baraja/msg/RawUdp.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/baraja
)

### Generating Services
_generate_srv_eus(baraja
  "/home/jasper/FYP_ws/src/baraja/srv/SetPlaytable.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/baraja
)

### Generating Module File
_generate_module_eus(baraja
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/baraja
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(baraja_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(baraja_generate_messages baraja_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jasper/FYP_ws/src/baraja/msg/RawUdp.msg" NAME_WE)
add_dependencies(baraja_generate_messages_eus _baraja_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jasper/FYP_ws/src/baraja/msg/RawUdpArray.msg" NAME_WE)
add_dependencies(baraja_generate_messages_eus _baraja_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jasper/FYP_ws/src/baraja/srv/SetPlaytable.srv" NAME_WE)
add_dependencies(baraja_generate_messages_eus _baraja_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(baraja_geneus)
add_dependencies(baraja_geneus baraja_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS baraja_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(baraja
  "/home/jasper/FYP_ws/src/baraja/msg/RawUdpArray.msg"
  "${MSG_I_FLAGS}"
  "/home/jasper/FYP_ws/src/baraja/msg/RawUdp.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baraja
)
_generate_msg_lisp(baraja
  "/home/jasper/FYP_ws/src/baraja/msg/RawUdp.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baraja
)

### Generating Services
_generate_srv_lisp(baraja
  "/home/jasper/FYP_ws/src/baraja/srv/SetPlaytable.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baraja
)

### Generating Module File
_generate_module_lisp(baraja
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baraja
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(baraja_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(baraja_generate_messages baraja_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jasper/FYP_ws/src/baraja/msg/RawUdp.msg" NAME_WE)
add_dependencies(baraja_generate_messages_lisp _baraja_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jasper/FYP_ws/src/baraja/msg/RawUdpArray.msg" NAME_WE)
add_dependencies(baraja_generate_messages_lisp _baraja_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jasper/FYP_ws/src/baraja/srv/SetPlaytable.srv" NAME_WE)
add_dependencies(baraja_generate_messages_lisp _baraja_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(baraja_genlisp)
add_dependencies(baraja_genlisp baraja_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS baraja_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(baraja
  "/home/jasper/FYP_ws/src/baraja/msg/RawUdpArray.msg"
  "${MSG_I_FLAGS}"
  "/home/jasper/FYP_ws/src/baraja/msg/RawUdp.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/baraja
)
_generate_msg_nodejs(baraja
  "/home/jasper/FYP_ws/src/baraja/msg/RawUdp.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/baraja
)

### Generating Services
_generate_srv_nodejs(baraja
  "/home/jasper/FYP_ws/src/baraja/srv/SetPlaytable.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/baraja
)

### Generating Module File
_generate_module_nodejs(baraja
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/baraja
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(baraja_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(baraja_generate_messages baraja_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jasper/FYP_ws/src/baraja/msg/RawUdp.msg" NAME_WE)
add_dependencies(baraja_generate_messages_nodejs _baraja_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jasper/FYP_ws/src/baraja/msg/RawUdpArray.msg" NAME_WE)
add_dependencies(baraja_generate_messages_nodejs _baraja_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jasper/FYP_ws/src/baraja/srv/SetPlaytable.srv" NAME_WE)
add_dependencies(baraja_generate_messages_nodejs _baraja_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(baraja_gennodejs)
add_dependencies(baraja_gennodejs baraja_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS baraja_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(baraja
  "/home/jasper/FYP_ws/src/baraja/msg/RawUdpArray.msg"
  "${MSG_I_FLAGS}"
  "/home/jasper/FYP_ws/src/baraja/msg/RawUdp.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baraja
)
_generate_msg_py(baraja
  "/home/jasper/FYP_ws/src/baraja/msg/RawUdp.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baraja
)

### Generating Services
_generate_srv_py(baraja
  "/home/jasper/FYP_ws/src/baraja/srv/SetPlaytable.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baraja
)

### Generating Module File
_generate_module_py(baraja
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baraja
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(baraja_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(baraja_generate_messages baraja_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jasper/FYP_ws/src/baraja/msg/RawUdp.msg" NAME_WE)
add_dependencies(baraja_generate_messages_py _baraja_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jasper/FYP_ws/src/baraja/msg/RawUdpArray.msg" NAME_WE)
add_dependencies(baraja_generate_messages_py _baraja_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jasper/FYP_ws/src/baraja/srv/SetPlaytable.srv" NAME_WE)
add_dependencies(baraja_generate_messages_py _baraja_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(baraja_genpy)
add_dependencies(baraja_genpy baraja_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS baraja_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baraja)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baraja
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(baraja_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/baraja)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/baraja
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(baraja_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baraja)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baraja
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(baraja_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/baraja)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/baraja
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(baraja_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baraja)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baraja\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baraja
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(baraja_generate_messages_py std_msgs_generate_messages_py)
endif()

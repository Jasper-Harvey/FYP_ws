# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jasper/FYP_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jasper/FYP_ws/build

# Include any dependencies generated for this target.
include data_logger/CMakeFiles/data_logger.dir/depend.make

# Include the progress variables for this target.
include data_logger/CMakeFiles/data_logger.dir/progress.make

# Include the compile flags for this target's objects.
include data_logger/CMakeFiles/data_logger.dir/flags.make

data_logger/CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.o: data_logger/CMakeFiles/data_logger.dir/flags.make
data_logger/CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.o: /home/jasper/FYP_ws/src/data_logger/src/log_IMU_ICP.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jasper/FYP_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object data_logger/CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.o"
	cd /home/jasper/FYP_ws/build/data_logger && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.o -c /home/jasper/FYP_ws/src/data_logger/src/log_IMU_ICP.cpp

data_logger/CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.i"
	cd /home/jasper/FYP_ws/build/data_logger && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jasper/FYP_ws/src/data_logger/src/log_IMU_ICP.cpp > CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.i

data_logger/CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.s"
	cd /home/jasper/FYP_ws/build/data_logger && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jasper/FYP_ws/src/data_logger/src/log_IMU_ICP.cpp -o CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.s

data_logger/CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.o.requires:

.PHONY : data_logger/CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.o.requires

data_logger/CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.o.provides: data_logger/CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.o.requires
	$(MAKE) -f data_logger/CMakeFiles/data_logger.dir/build.make data_logger/CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.o.provides.build
.PHONY : data_logger/CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.o.provides

data_logger/CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.o.provides.build: data_logger/CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.o


data_logger/CMakeFiles/data_logger.dir/src/spatial_packets.c.o: data_logger/CMakeFiles/data_logger.dir/flags.make
data_logger/CMakeFiles/data_logger.dir/src/spatial_packets.c.o: /home/jasper/FYP_ws/src/data_logger/src/spatial_packets.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jasper/FYP_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object data_logger/CMakeFiles/data_logger.dir/src/spatial_packets.c.o"
	cd /home/jasper/FYP_ws/build/data_logger && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/data_logger.dir/src/spatial_packets.c.o   -c /home/jasper/FYP_ws/src/data_logger/src/spatial_packets.c

data_logger/CMakeFiles/data_logger.dir/src/spatial_packets.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/data_logger.dir/src/spatial_packets.c.i"
	cd /home/jasper/FYP_ws/build/data_logger && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jasper/FYP_ws/src/data_logger/src/spatial_packets.c > CMakeFiles/data_logger.dir/src/spatial_packets.c.i

data_logger/CMakeFiles/data_logger.dir/src/spatial_packets.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/data_logger.dir/src/spatial_packets.c.s"
	cd /home/jasper/FYP_ws/build/data_logger && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jasper/FYP_ws/src/data_logger/src/spatial_packets.c -o CMakeFiles/data_logger.dir/src/spatial_packets.c.s

data_logger/CMakeFiles/data_logger.dir/src/spatial_packets.c.o.requires:

.PHONY : data_logger/CMakeFiles/data_logger.dir/src/spatial_packets.c.o.requires

data_logger/CMakeFiles/data_logger.dir/src/spatial_packets.c.o.provides: data_logger/CMakeFiles/data_logger.dir/src/spatial_packets.c.o.requires
	$(MAKE) -f data_logger/CMakeFiles/data_logger.dir/build.make data_logger/CMakeFiles/data_logger.dir/src/spatial_packets.c.o.provides.build
.PHONY : data_logger/CMakeFiles/data_logger.dir/src/spatial_packets.c.o.provides

data_logger/CMakeFiles/data_logger.dir/src/spatial_packets.c.o.provides.build: data_logger/CMakeFiles/data_logger.dir/src/spatial_packets.c.o


data_logger/CMakeFiles/data_logger.dir/src/an_packet_protocol.c.o: data_logger/CMakeFiles/data_logger.dir/flags.make
data_logger/CMakeFiles/data_logger.dir/src/an_packet_protocol.c.o: /home/jasper/FYP_ws/src/data_logger/src/an_packet_protocol.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jasper/FYP_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object data_logger/CMakeFiles/data_logger.dir/src/an_packet_protocol.c.o"
	cd /home/jasper/FYP_ws/build/data_logger && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/data_logger.dir/src/an_packet_protocol.c.o   -c /home/jasper/FYP_ws/src/data_logger/src/an_packet_protocol.c

data_logger/CMakeFiles/data_logger.dir/src/an_packet_protocol.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/data_logger.dir/src/an_packet_protocol.c.i"
	cd /home/jasper/FYP_ws/build/data_logger && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jasper/FYP_ws/src/data_logger/src/an_packet_protocol.c > CMakeFiles/data_logger.dir/src/an_packet_protocol.c.i

data_logger/CMakeFiles/data_logger.dir/src/an_packet_protocol.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/data_logger.dir/src/an_packet_protocol.c.s"
	cd /home/jasper/FYP_ws/build/data_logger && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jasper/FYP_ws/src/data_logger/src/an_packet_protocol.c -o CMakeFiles/data_logger.dir/src/an_packet_protocol.c.s

data_logger/CMakeFiles/data_logger.dir/src/an_packet_protocol.c.o.requires:

.PHONY : data_logger/CMakeFiles/data_logger.dir/src/an_packet_protocol.c.o.requires

data_logger/CMakeFiles/data_logger.dir/src/an_packet_protocol.c.o.provides: data_logger/CMakeFiles/data_logger.dir/src/an_packet_protocol.c.o.requires
	$(MAKE) -f data_logger/CMakeFiles/data_logger.dir/build.make data_logger/CMakeFiles/data_logger.dir/src/an_packet_protocol.c.o.provides.build
.PHONY : data_logger/CMakeFiles/data_logger.dir/src/an_packet_protocol.c.o.provides

data_logger/CMakeFiles/data_logger.dir/src/an_packet_protocol.c.o.provides.build: data_logger/CMakeFiles/data_logger.dir/src/an_packet_protocol.c.o


data_logger/CMakeFiles/data_logger.dir/src/rs232/rs232.c.o: data_logger/CMakeFiles/data_logger.dir/flags.make
data_logger/CMakeFiles/data_logger.dir/src/rs232/rs232.c.o: /home/jasper/FYP_ws/src/data_logger/src/rs232/rs232.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jasper/FYP_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object data_logger/CMakeFiles/data_logger.dir/src/rs232/rs232.c.o"
	cd /home/jasper/FYP_ws/build/data_logger && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/data_logger.dir/src/rs232/rs232.c.o   -c /home/jasper/FYP_ws/src/data_logger/src/rs232/rs232.c

data_logger/CMakeFiles/data_logger.dir/src/rs232/rs232.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/data_logger.dir/src/rs232/rs232.c.i"
	cd /home/jasper/FYP_ws/build/data_logger && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/jasper/FYP_ws/src/data_logger/src/rs232/rs232.c > CMakeFiles/data_logger.dir/src/rs232/rs232.c.i

data_logger/CMakeFiles/data_logger.dir/src/rs232/rs232.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/data_logger.dir/src/rs232/rs232.c.s"
	cd /home/jasper/FYP_ws/build/data_logger && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/jasper/FYP_ws/src/data_logger/src/rs232/rs232.c -o CMakeFiles/data_logger.dir/src/rs232/rs232.c.s

data_logger/CMakeFiles/data_logger.dir/src/rs232/rs232.c.o.requires:

.PHONY : data_logger/CMakeFiles/data_logger.dir/src/rs232/rs232.c.o.requires

data_logger/CMakeFiles/data_logger.dir/src/rs232/rs232.c.o.provides: data_logger/CMakeFiles/data_logger.dir/src/rs232/rs232.c.o.requires
	$(MAKE) -f data_logger/CMakeFiles/data_logger.dir/build.make data_logger/CMakeFiles/data_logger.dir/src/rs232/rs232.c.o.provides.build
.PHONY : data_logger/CMakeFiles/data_logger.dir/src/rs232/rs232.c.o.provides

data_logger/CMakeFiles/data_logger.dir/src/rs232/rs232.c.o.provides.build: data_logger/CMakeFiles/data_logger.dir/src/rs232/rs232.c.o


# Object files for target data_logger
data_logger_OBJECTS = \
"CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.o" \
"CMakeFiles/data_logger.dir/src/spatial_packets.c.o" \
"CMakeFiles/data_logger.dir/src/an_packet_protocol.c.o" \
"CMakeFiles/data_logger.dir/src/rs232/rs232.c.o"

# External object files for target data_logger
data_logger_EXTERNAL_OBJECTS =

/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: data_logger/CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.o
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: data_logger/CMakeFiles/data_logger.dir/src/spatial_packets.c.o
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: data_logger/CMakeFiles/data_logger.dir/src/an_packet_protocol.c.o
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: data_logger/CMakeFiles/data_logger.dir/src/rs232/rs232.c.o
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: data_logger/CMakeFiles/data_logger.dir/build.make
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: /opt/ros/melodic/lib/libroscpp.so
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: /opt/ros/melodic/lib/librosconsole.so
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: /opt/ros/melodic/lib/librosconsole_log4cxx.so
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: /opt/ros/melodic/lib/librosconsole_backend_interface.so
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: /usr/lib/x86_64-linux-gnu/liblog4cxx.so
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: /opt/ros/melodic/lib/libxmlrpcpp.so
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: /opt/ros/melodic/lib/libroscpp_serialization.so
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: /opt/ros/melodic/lib/librostime.so
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: /opt/ros/melodic/lib/libcpp_common.so
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so.0.4
/home/jasper/FYP_ws/devel/lib/data_logger/data_logger: data_logger/CMakeFiles/data_logger.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jasper/FYP_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable /home/jasper/FYP_ws/devel/lib/data_logger/data_logger"
	cd /home/jasper/FYP_ws/build/data_logger && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/data_logger.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
data_logger/CMakeFiles/data_logger.dir/build: /home/jasper/FYP_ws/devel/lib/data_logger/data_logger

.PHONY : data_logger/CMakeFiles/data_logger.dir/build

data_logger/CMakeFiles/data_logger.dir/requires: data_logger/CMakeFiles/data_logger.dir/src/log_IMU_ICP.cpp.o.requires
data_logger/CMakeFiles/data_logger.dir/requires: data_logger/CMakeFiles/data_logger.dir/src/spatial_packets.c.o.requires
data_logger/CMakeFiles/data_logger.dir/requires: data_logger/CMakeFiles/data_logger.dir/src/an_packet_protocol.c.o.requires
data_logger/CMakeFiles/data_logger.dir/requires: data_logger/CMakeFiles/data_logger.dir/src/rs232/rs232.c.o.requires

.PHONY : data_logger/CMakeFiles/data_logger.dir/requires

data_logger/CMakeFiles/data_logger.dir/clean:
	cd /home/jasper/FYP_ws/build/data_logger && $(CMAKE_COMMAND) -P CMakeFiles/data_logger.dir/cmake_clean.cmake
.PHONY : data_logger/CMakeFiles/data_logger.dir/clean

data_logger/CMakeFiles/data_logger.dir/depend:
	cd /home/jasper/FYP_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jasper/FYP_ws/src /home/jasper/FYP_ws/src/data_logger /home/jasper/FYP_ws/build /home/jasper/FYP_ws/build/data_logger /home/jasper/FYP_ws/build/data_logger/CMakeFiles/data_logger.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : data_logger/CMakeFiles/data_logger.dir/depend


# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

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
CMAKE_SOURCE_DIR = "/home/qwop/Documents/GitHub/NTNU/2017H/TDAT3020(nettverk_sikkerhet)/Oving2"

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = "/home/qwop/Documents/GitHub/NTNU/2017H/TDAT3020(nettverk_sikkerhet)/Oving2/build/debug"

# Include any dependencies generated for this target.
include CMakeFiles/web_server.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/web_server.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/web_server.dir/flags.make

CMakeFiles/web_server.dir/main.cpp.o: CMakeFiles/web_server.dir/flags.make
CMakeFiles/web_server.dir/main.cpp.o: ../../main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir="/home/qwop/Documents/GitHub/NTNU/2017H/TDAT3020(nettverk_sikkerhet)/Oving2/build/debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/web_server.dir/main.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/web_server.dir/main.cpp.o -c "/home/qwop/Documents/GitHub/NTNU/2017H/TDAT3020(nettverk_sikkerhet)/Oving2/main.cpp"

CMakeFiles/web_server.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/web_server.dir/main.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E "/home/qwop/Documents/GitHub/NTNU/2017H/TDAT3020(nettverk_sikkerhet)/Oving2/main.cpp" > CMakeFiles/web_server.dir/main.cpp.i

CMakeFiles/web_server.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/web_server.dir/main.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S "/home/qwop/Documents/GitHub/NTNU/2017H/TDAT3020(nettverk_sikkerhet)/Oving2/main.cpp" -o CMakeFiles/web_server.dir/main.cpp.s

CMakeFiles/web_server.dir/main.cpp.o.requires:

.PHONY : CMakeFiles/web_server.dir/main.cpp.o.requires

CMakeFiles/web_server.dir/main.cpp.o.provides: CMakeFiles/web_server.dir/main.cpp.o.requires
	$(MAKE) -f CMakeFiles/web_server.dir/build.make CMakeFiles/web_server.dir/main.cpp.o.provides.build
.PHONY : CMakeFiles/web_server.dir/main.cpp.o.provides

CMakeFiles/web_server.dir/main.cpp.o.provides.build: CMakeFiles/web_server.dir/main.cpp.o


# Object files for target web_server
web_server_OBJECTS = \
"CMakeFiles/web_server.dir/main.cpp.o"

# External object files for target web_server
web_server_EXTERNAL_OBJECTS =

web_server: CMakeFiles/web_server.dir/main.cpp.o
web_server: CMakeFiles/web_server.dir/build.make
web_server: /usr/lib/x86_64-linux-gnu/libboost_regex.so
web_server: /usr/lib/x86_64-linux-gnu/libboost_system.so
web_server: /usr/lib/x86_64-linux-gnu/libboost_thread.so
web_server: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
web_server: /usr/lib/x86_64-linux-gnu/libboost_chrono.so
web_server: /usr/lib/x86_64-linux-gnu/libboost_atomic.so
web_server: /usr/lib/x86_64-linux-gnu/libpthread.so
web_server: CMakeFiles/web_server.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir="/home/qwop/Documents/GitHub/NTNU/2017H/TDAT3020(nettverk_sikkerhet)/Oving2/build/debug/CMakeFiles" --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable web_server"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/web_server.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/web_server.dir/build: web_server

.PHONY : CMakeFiles/web_server.dir/build

CMakeFiles/web_server.dir/requires: CMakeFiles/web_server.dir/main.cpp.o.requires

.PHONY : CMakeFiles/web_server.dir/requires

CMakeFiles/web_server.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/web_server.dir/cmake_clean.cmake
.PHONY : CMakeFiles/web_server.dir/clean

CMakeFiles/web_server.dir/depend:
	cd "/home/qwop/Documents/GitHub/NTNU/2017H/TDAT3020(nettverk_sikkerhet)/Oving2/build/debug" && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" "/home/qwop/Documents/GitHub/NTNU/2017H/TDAT3020(nettverk_sikkerhet)/Oving2" "/home/qwop/Documents/GitHub/NTNU/2017H/TDAT3020(nettverk_sikkerhet)/Oving2" "/home/qwop/Documents/GitHub/NTNU/2017H/TDAT3020(nettverk_sikkerhet)/Oving2/build/debug" "/home/qwop/Documents/GitHub/NTNU/2017H/TDAT3020(nettverk_sikkerhet)/Oving2/build/debug" "/home/qwop/Documents/GitHub/NTNU/2017H/TDAT3020(nettverk_sikkerhet)/Oving2/build/debug/CMakeFiles/web_server.dir/DependInfo.cmake" --color=$(COLOR)
.PHONY : CMakeFiles/web_server.dir/depend


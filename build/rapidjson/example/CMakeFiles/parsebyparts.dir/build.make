# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.31

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/cmake/bin/cmake

# The command to remove a file.
RM = /opt/cmake/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/u/vector_DB

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/u/vector_DB/build

# Include any dependencies generated for this target.
include rapidjson/example/CMakeFiles/parsebyparts.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include rapidjson/example/CMakeFiles/parsebyparts.dir/compiler_depend.make

# Include the progress variables for this target.
include rapidjson/example/CMakeFiles/parsebyparts.dir/progress.make

# Include the compile flags for this target's objects.
include rapidjson/example/CMakeFiles/parsebyparts.dir/flags.make

rapidjson/example/CMakeFiles/parsebyparts.dir/codegen:
.PHONY : rapidjson/example/CMakeFiles/parsebyparts.dir/codegen

rapidjson/example/CMakeFiles/parsebyparts.dir/parsebyparts/parsebyparts.cpp.o: rapidjson/example/CMakeFiles/parsebyparts.dir/flags.make
rapidjson/example/CMakeFiles/parsebyparts.dir/parsebyparts/parsebyparts.cpp.o: /home/u/vector_DB/rapidjson/example/parsebyparts/parsebyparts.cpp
rapidjson/example/CMakeFiles/parsebyparts.dir/parsebyparts/parsebyparts.cpp.o: rapidjson/example/CMakeFiles/parsebyparts.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/u/vector_DB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object rapidjson/example/CMakeFiles/parsebyparts.dir/parsebyparts/parsebyparts.cpp.o"
	cd /home/u/vector_DB/build/rapidjson/example && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT rapidjson/example/CMakeFiles/parsebyparts.dir/parsebyparts/parsebyparts.cpp.o -MF CMakeFiles/parsebyparts.dir/parsebyparts/parsebyparts.cpp.o.d -o CMakeFiles/parsebyparts.dir/parsebyparts/parsebyparts.cpp.o -c /home/u/vector_DB/rapidjson/example/parsebyparts/parsebyparts.cpp

rapidjson/example/CMakeFiles/parsebyparts.dir/parsebyparts/parsebyparts.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/parsebyparts.dir/parsebyparts/parsebyparts.cpp.i"
	cd /home/u/vector_DB/build/rapidjson/example && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/u/vector_DB/rapidjson/example/parsebyparts/parsebyparts.cpp > CMakeFiles/parsebyparts.dir/parsebyparts/parsebyparts.cpp.i

rapidjson/example/CMakeFiles/parsebyparts.dir/parsebyparts/parsebyparts.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/parsebyparts.dir/parsebyparts/parsebyparts.cpp.s"
	cd /home/u/vector_DB/build/rapidjson/example && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/u/vector_DB/rapidjson/example/parsebyparts/parsebyparts.cpp -o CMakeFiles/parsebyparts.dir/parsebyparts/parsebyparts.cpp.s

# Object files for target parsebyparts
parsebyparts_OBJECTS = \
"CMakeFiles/parsebyparts.dir/parsebyparts/parsebyparts.cpp.o"

# External object files for target parsebyparts
parsebyparts_EXTERNAL_OBJECTS =

bin/parsebyparts: rapidjson/example/CMakeFiles/parsebyparts.dir/parsebyparts/parsebyparts.cpp.o
bin/parsebyparts: rapidjson/example/CMakeFiles/parsebyparts.dir/build.make
bin/parsebyparts: rapidjson/example/CMakeFiles/parsebyparts.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/u/vector_DB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/parsebyparts"
	cd /home/u/vector_DB/build/rapidjson/example && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/parsebyparts.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
rapidjson/example/CMakeFiles/parsebyparts.dir/build: bin/parsebyparts
.PHONY : rapidjson/example/CMakeFiles/parsebyparts.dir/build

rapidjson/example/CMakeFiles/parsebyparts.dir/clean:
	cd /home/u/vector_DB/build/rapidjson/example && $(CMAKE_COMMAND) -P CMakeFiles/parsebyparts.dir/cmake_clean.cmake
.PHONY : rapidjson/example/CMakeFiles/parsebyparts.dir/clean

rapidjson/example/CMakeFiles/parsebyparts.dir/depend:
	cd /home/u/vector_DB/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/u/vector_DB /home/u/vector_DB/rapidjson/example /home/u/vector_DB/build /home/u/vector_DB/build/rapidjson/example /home/u/vector_DB/build/rapidjson/example/CMakeFiles/parsebyparts.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : rapidjson/example/CMakeFiles/parsebyparts.dir/depend


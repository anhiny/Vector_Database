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
include rapidjson/example/CMakeFiles/lookaheadparser.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include rapidjson/example/CMakeFiles/lookaheadparser.dir/compiler_depend.make

# Include the progress variables for this target.
include rapidjson/example/CMakeFiles/lookaheadparser.dir/progress.make

# Include the compile flags for this target's objects.
include rapidjson/example/CMakeFiles/lookaheadparser.dir/flags.make

rapidjson/example/CMakeFiles/lookaheadparser.dir/codegen:
.PHONY : rapidjson/example/CMakeFiles/lookaheadparser.dir/codegen

rapidjson/example/CMakeFiles/lookaheadparser.dir/lookaheadparser/lookaheadparser.cpp.o: rapidjson/example/CMakeFiles/lookaheadparser.dir/flags.make
rapidjson/example/CMakeFiles/lookaheadparser.dir/lookaheadparser/lookaheadparser.cpp.o: /home/u/vector_DB/rapidjson/example/lookaheadparser/lookaheadparser.cpp
rapidjson/example/CMakeFiles/lookaheadparser.dir/lookaheadparser/lookaheadparser.cpp.o: rapidjson/example/CMakeFiles/lookaheadparser.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/u/vector_DB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object rapidjson/example/CMakeFiles/lookaheadparser.dir/lookaheadparser/lookaheadparser.cpp.o"
	cd /home/u/vector_DB/build/rapidjson/example && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT rapidjson/example/CMakeFiles/lookaheadparser.dir/lookaheadparser/lookaheadparser.cpp.o -MF CMakeFiles/lookaheadparser.dir/lookaheadparser/lookaheadparser.cpp.o.d -o CMakeFiles/lookaheadparser.dir/lookaheadparser/lookaheadparser.cpp.o -c /home/u/vector_DB/rapidjson/example/lookaheadparser/lookaheadparser.cpp

rapidjson/example/CMakeFiles/lookaheadparser.dir/lookaheadparser/lookaheadparser.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/lookaheadparser.dir/lookaheadparser/lookaheadparser.cpp.i"
	cd /home/u/vector_DB/build/rapidjson/example && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/u/vector_DB/rapidjson/example/lookaheadparser/lookaheadparser.cpp > CMakeFiles/lookaheadparser.dir/lookaheadparser/lookaheadparser.cpp.i

rapidjson/example/CMakeFiles/lookaheadparser.dir/lookaheadparser/lookaheadparser.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/lookaheadparser.dir/lookaheadparser/lookaheadparser.cpp.s"
	cd /home/u/vector_DB/build/rapidjson/example && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/u/vector_DB/rapidjson/example/lookaheadparser/lookaheadparser.cpp -o CMakeFiles/lookaheadparser.dir/lookaheadparser/lookaheadparser.cpp.s

# Object files for target lookaheadparser
lookaheadparser_OBJECTS = \
"CMakeFiles/lookaheadparser.dir/lookaheadparser/lookaheadparser.cpp.o"

# External object files for target lookaheadparser
lookaheadparser_EXTERNAL_OBJECTS =

bin/lookaheadparser: rapidjson/example/CMakeFiles/lookaheadparser.dir/lookaheadparser/lookaheadparser.cpp.o
bin/lookaheadparser: rapidjson/example/CMakeFiles/lookaheadparser.dir/build.make
bin/lookaheadparser: rapidjson/example/CMakeFiles/lookaheadparser.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=/home/u/vector_DB/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable ../../bin/lookaheadparser"
	cd /home/u/vector_DB/build/rapidjson/example && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lookaheadparser.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
rapidjson/example/CMakeFiles/lookaheadparser.dir/build: bin/lookaheadparser
.PHONY : rapidjson/example/CMakeFiles/lookaheadparser.dir/build

rapidjson/example/CMakeFiles/lookaheadparser.dir/clean:
	cd /home/u/vector_DB/build/rapidjson/example && $(CMAKE_COMMAND) -P CMakeFiles/lookaheadparser.dir/cmake_clean.cmake
.PHONY : rapidjson/example/CMakeFiles/lookaheadparser.dir/clean

rapidjson/example/CMakeFiles/lookaheadparser.dir/depend:
	cd /home/u/vector_DB/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/u/vector_DB /home/u/vector_DB/rapidjson/example /home/u/vector_DB/build /home/u/vector_DB/build/rapidjson/example /home/u/vector_DB/build/rapidjson/example/CMakeFiles/lookaheadparser.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : rapidjson/example/CMakeFiles/lookaheadparser.dir/depend


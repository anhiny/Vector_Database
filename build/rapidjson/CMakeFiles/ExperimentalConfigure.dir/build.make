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

# Utility rule file for ExperimentalConfigure.

# Include any custom commands dependencies for this target.
include rapidjson/CMakeFiles/ExperimentalConfigure.dir/compiler_depend.make

# Include the progress variables for this target.
include rapidjson/CMakeFiles/ExperimentalConfigure.dir/progress.make

rapidjson/CMakeFiles/ExperimentalConfigure:
	cd /home/u/vector_DB/build/rapidjson && /opt/cmake/bin/ctest -D ExperimentalConfigure

rapidjson/CMakeFiles/ExperimentalConfigure.dir/codegen:
.PHONY : rapidjson/CMakeFiles/ExperimentalConfigure.dir/codegen

ExperimentalConfigure: rapidjson/CMakeFiles/ExperimentalConfigure
ExperimentalConfigure: rapidjson/CMakeFiles/ExperimentalConfigure.dir/build.make
.PHONY : ExperimentalConfigure

# Rule to build all files generated by this target.
rapidjson/CMakeFiles/ExperimentalConfigure.dir/build: ExperimentalConfigure
.PHONY : rapidjson/CMakeFiles/ExperimentalConfigure.dir/build

rapidjson/CMakeFiles/ExperimentalConfigure.dir/clean:
	cd /home/u/vector_DB/build/rapidjson && $(CMAKE_COMMAND) -P CMakeFiles/ExperimentalConfigure.dir/cmake_clean.cmake
.PHONY : rapidjson/CMakeFiles/ExperimentalConfigure.dir/clean

rapidjson/CMakeFiles/ExperimentalConfigure.dir/depend:
	cd /home/u/vector_DB/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/u/vector_DB /home/u/vector_DB/rapidjson /home/u/vector_DB/build /home/u/vector_DB/build/rapidjson /home/u/vector_DB/build/rapidjson/CMakeFiles/ExperimentalConfigure.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : rapidjson/CMakeFiles/ExperimentalConfigure.dir/depend


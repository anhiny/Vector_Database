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

# Utility rule file for ExperimentalMemCheck.

# Include any custom commands dependencies for this target.
include rapidjson/CMakeFiles/ExperimentalMemCheck.dir/compiler_depend.make

# Include the progress variables for this target.
include rapidjson/CMakeFiles/ExperimentalMemCheck.dir/progress.make

rapidjson/CMakeFiles/ExperimentalMemCheck:
	cd /home/u/vector_DB/build/rapidjson && /opt/cmake/bin/ctest -D ExperimentalMemCheck

rapidjson/CMakeFiles/ExperimentalMemCheck.dir/codegen:
.PHONY : rapidjson/CMakeFiles/ExperimentalMemCheck.dir/codegen

ExperimentalMemCheck: rapidjson/CMakeFiles/ExperimentalMemCheck
ExperimentalMemCheck: rapidjson/CMakeFiles/ExperimentalMemCheck.dir/build.make
.PHONY : ExperimentalMemCheck

# Rule to build all files generated by this target.
rapidjson/CMakeFiles/ExperimentalMemCheck.dir/build: ExperimentalMemCheck
.PHONY : rapidjson/CMakeFiles/ExperimentalMemCheck.dir/build

rapidjson/CMakeFiles/ExperimentalMemCheck.dir/clean:
	cd /home/u/vector_DB/build/rapidjson && $(CMAKE_COMMAND) -P CMakeFiles/ExperimentalMemCheck.dir/cmake_clean.cmake
.PHONY : rapidjson/CMakeFiles/ExperimentalMemCheck.dir/clean

rapidjson/CMakeFiles/ExperimentalMemCheck.dir/depend:
	cd /home/u/vector_DB/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/u/vector_DB /home/u/vector_DB/rapidjson /home/u/vector_DB/build /home/u/vector_DB/build/rapidjson /home/u/vector_DB/build/rapidjson/CMakeFiles/ExperimentalMemCheck.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : rapidjson/CMakeFiles/ExperimentalMemCheck.dir/depend


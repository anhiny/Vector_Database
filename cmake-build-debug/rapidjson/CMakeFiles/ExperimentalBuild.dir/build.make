# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

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
CMAKE_SOURCE_DIR = /home/u/vector_DB

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/u/vector_DB/cmake-build-debug

# Utility rule file for ExperimentalBuild.

# Include the progress variables for this target.
include rapidjson/CMakeFiles/ExperimentalBuild.dir/progress.make

rapidjson/CMakeFiles/ExperimentalBuild:
	cd /home/u/vector_DB/cmake-build-debug/rapidjson && /usr/bin/ctest -D ExperimentalBuild

ExperimentalBuild: rapidjson/CMakeFiles/ExperimentalBuild
ExperimentalBuild: rapidjson/CMakeFiles/ExperimentalBuild.dir/build.make

.PHONY : ExperimentalBuild

# Rule to build all files generated by this target.
rapidjson/CMakeFiles/ExperimentalBuild.dir/build: ExperimentalBuild

.PHONY : rapidjson/CMakeFiles/ExperimentalBuild.dir/build

rapidjson/CMakeFiles/ExperimentalBuild.dir/clean:
	cd /home/u/vector_DB/cmake-build-debug/rapidjson && $(CMAKE_COMMAND) -P CMakeFiles/ExperimentalBuild.dir/cmake_clean.cmake
.PHONY : rapidjson/CMakeFiles/ExperimentalBuild.dir/clean

rapidjson/CMakeFiles/ExperimentalBuild.dir/depend:
	cd /home/u/vector_DB/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/u/vector_DB /home/u/vector_DB/rapidjson /home/u/vector_DB/cmake-build-debug /home/u/vector_DB/cmake-build-debug/rapidjson /home/u/vector_DB/cmake-build-debug/rapidjson/CMakeFiles/ExperimentalBuild.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : rapidjson/CMakeFiles/ExperimentalBuild.dir/depend


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

# Utility rule file for ContinuousSubmit.

# Include the progress variables for this target.
include rapidjson/CMakeFiles/ContinuousSubmit.dir/progress.make

rapidjson/CMakeFiles/ContinuousSubmit:
	cd /home/u/vector_DB/cmake-build-debug/rapidjson && /usr/bin/ctest -D ContinuousSubmit

ContinuousSubmit: rapidjson/CMakeFiles/ContinuousSubmit
ContinuousSubmit: rapidjson/CMakeFiles/ContinuousSubmit.dir/build.make

.PHONY : ContinuousSubmit

# Rule to build all files generated by this target.
rapidjson/CMakeFiles/ContinuousSubmit.dir/build: ContinuousSubmit

.PHONY : rapidjson/CMakeFiles/ContinuousSubmit.dir/build

rapidjson/CMakeFiles/ContinuousSubmit.dir/clean:
	cd /home/u/vector_DB/cmake-build-debug/rapidjson && $(CMAKE_COMMAND) -P CMakeFiles/ContinuousSubmit.dir/cmake_clean.cmake
.PHONY : rapidjson/CMakeFiles/ContinuousSubmit.dir/clean

rapidjson/CMakeFiles/ContinuousSubmit.dir/depend:
	cd /home/u/vector_DB/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/u/vector_DB /home/u/vector_DB/rapidjson /home/u/vector_DB/cmake-build-debug /home/u/vector_DB/cmake-build-debug/rapidjson /home/u/vector_DB/cmake-build-debug/rapidjson/CMakeFiles/ContinuousSubmit.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : rapidjson/CMakeFiles/ContinuousSubmit.dir/depend


# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

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
CMAKE_COMMAND = /home/linuxbrew/.linuxbrew/Cellar/cmake/3.15.2/bin/cmake

# The command to remove a file.
RM = /home/linuxbrew/.linuxbrew/Cellar/cmake/3.15.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/hany/repos/Projects/JDE_Challenge-GSoC_2020/C++_Challenge

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hany/repos/Projects/JDE_Challenge-GSoC_2020/C++_Challenge/build

# Include any dependencies generated for this target.
include CMakeFiles/main.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/main.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/main.dir/flags.make

CMakeFiles/main.dir/src/main.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/src/main.cpp.o: ../src/main.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hany/repos/Projects/JDE_Challenge-GSoC_2020/C++_Challenge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/main.dir/src/main.cpp.o"
	/home/linuxbrew/.linuxbrew/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/src/main.cpp.o -c /home/hany/repos/Projects/JDE_Challenge-GSoC_2020/C++_Challenge/src/main.cpp

CMakeFiles/main.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/src/main.cpp.i"
	/home/linuxbrew/.linuxbrew/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hany/repos/Projects/JDE_Challenge-GSoC_2020/C++_Challenge/src/main.cpp > CMakeFiles/main.dir/src/main.cpp.i

CMakeFiles/main.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/src/main.cpp.s"
	/home/linuxbrew/.linuxbrew/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hany/repos/Projects/JDE_Challenge-GSoC_2020/C++_Challenge/src/main.cpp -o CMakeFiles/main.dir/src/main.cpp.s

CMakeFiles/main.dir/includes/Labyrinth.cpp.o: CMakeFiles/main.dir/flags.make
CMakeFiles/main.dir/includes/Labyrinth.cpp.o: ../includes/Labyrinth.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hany/repos/Projects/JDE_Challenge-GSoC_2020/C++_Challenge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/main.dir/includes/Labyrinth.cpp.o"
	/home/linuxbrew/.linuxbrew/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/main.dir/includes/Labyrinth.cpp.o -c /home/hany/repos/Projects/JDE_Challenge-GSoC_2020/C++_Challenge/includes/Labyrinth.cpp

CMakeFiles/main.dir/includes/Labyrinth.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/includes/Labyrinth.cpp.i"
	/home/linuxbrew/.linuxbrew/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hany/repos/Projects/JDE_Challenge-GSoC_2020/C++_Challenge/includes/Labyrinth.cpp > CMakeFiles/main.dir/includes/Labyrinth.cpp.i

CMakeFiles/main.dir/includes/Labyrinth.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/includes/Labyrinth.cpp.s"
	/home/linuxbrew/.linuxbrew/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hany/repos/Projects/JDE_Challenge-GSoC_2020/C++_Challenge/includes/Labyrinth.cpp -o CMakeFiles/main.dir/includes/Labyrinth.cpp.s

# Object files for target main
main_OBJECTS = \
"CMakeFiles/main.dir/src/main.cpp.o" \
"CMakeFiles/main.dir/includes/Labyrinth.cpp.o"

# External object files for target main
main_EXTERNAL_OBJECTS =

main: CMakeFiles/main.dir/src/main.cpp.o
main: CMakeFiles/main.dir/includes/Labyrinth.cpp.o
main: CMakeFiles/main.dir/build.make
main: CMakeFiles/main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hany/repos/Projects/JDE_Challenge-GSoC_2020/C++_Challenge/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable main"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/main.dir/build: main

.PHONY : CMakeFiles/main.dir/build

CMakeFiles/main.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/main.dir/cmake_clean.cmake
.PHONY : CMakeFiles/main.dir/clean

CMakeFiles/main.dir/depend:
	cd /home/hany/repos/Projects/JDE_Challenge-GSoC_2020/C++_Challenge/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hany/repos/Projects/JDE_Challenge-GSoC_2020/C++_Challenge /home/hany/repos/Projects/JDE_Challenge-GSoC_2020/C++_Challenge /home/hany/repos/Projects/JDE_Challenge-GSoC_2020/C++_Challenge/build /home/hany/repos/Projects/JDE_Challenge-GSoC_2020/C++_Challenge/build /home/hany/repos/Projects/JDE_Challenge-GSoC_2020/C++_Challenge/build/CMakeFiles/main.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/main.dir/depend


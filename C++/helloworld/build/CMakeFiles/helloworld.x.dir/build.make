# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.21

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

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = C:\Users\Robert\Documents\Programs-Martijn\Cmake\cmake-3.21.0-rc1-windows-x86_64\bin\cmake.exe

# The command to remove a file.
RM = C:\Users\Robert\Documents\Programs-Martijn\Cmake\cmake-3.21.0-rc1-windows-x86_64\bin\cmake.exe -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Users\Robert\Documents\Documents-Martijn\Technology\Programming\Programming\C++\helloworld

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Users\Robert\Documents\Documents-Martijn\Technology\Programming\Programming\C++\helloworld\build

# Include any dependencies generated for this target.
include CMakeFiles/helloworld.x.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/helloworld.x.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/helloworld.x.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/helloworld.x.dir/flags.make

CMakeFiles/helloworld.x.dir/helloworld.cpp.obj: CMakeFiles/helloworld.x.dir/flags.make
CMakeFiles/helloworld.x.dir/helloworld.cpp.obj: ../helloworld.cpp
CMakeFiles/helloworld.x.dir/helloworld.cpp.obj: CMakeFiles/helloworld.x.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Users\Robert\Documents\Documents-Martijn\Technology\Programming\Programming\C++\helloworld\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/helloworld.x.dir/helloworld.cpp.obj"
	C:\Users\Robert\Documents\Programs-Martijn\MiniGW\mingw64\bin\x86_64-w64-mingw32-g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/helloworld.x.dir/helloworld.cpp.obj -MF CMakeFiles\helloworld.x.dir\helloworld.cpp.obj.d -o CMakeFiles\helloworld.x.dir\helloworld.cpp.obj -c C:\Users\Robert\Documents\Documents-Martijn\Technology\Programming\Programming\C++\helloworld\helloworld.cpp

CMakeFiles/helloworld.x.dir/helloworld.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/helloworld.x.dir/helloworld.cpp.i"
	C:\Users\Robert\Documents\Programs-Martijn\MiniGW\mingw64\bin\x86_64-w64-mingw32-g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E C:\Users\Robert\Documents\Documents-Martijn\Technology\Programming\Programming\C++\helloworld\helloworld.cpp > CMakeFiles\helloworld.x.dir\helloworld.cpp.i

CMakeFiles/helloworld.x.dir/helloworld.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/helloworld.x.dir/helloworld.cpp.s"
	C:\Users\Robert\Documents\Programs-Martijn\MiniGW\mingw64\bin\x86_64-w64-mingw32-g++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S C:\Users\Robert\Documents\Documents-Martijn\Technology\Programming\Programming\C++\helloworld\helloworld.cpp -o CMakeFiles\helloworld.x.dir\helloworld.cpp.s

# Object files for target helloworld.x
helloworld_x_OBJECTS = \
"CMakeFiles/helloworld.x.dir/helloworld.cpp.obj"

# External object files for target helloworld.x
helloworld_x_EXTERNAL_OBJECTS =

helloworld.x.exe: CMakeFiles/helloworld.x.dir/helloworld.cpp.obj
helloworld.x.exe: CMakeFiles/helloworld.x.dir/build.make
helloworld.x.exe: CMakeFiles/helloworld.x.dir/linklibs.rsp
helloworld.x.exe: CMakeFiles/helloworld.x.dir/objects1.rsp
helloworld.x.exe: CMakeFiles/helloworld.x.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Users\Robert\Documents\Documents-Martijn\Technology\Programming\Programming\C++\helloworld\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable helloworld.x.exe"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\helloworld.x.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/helloworld.x.dir/build: helloworld.x.exe
.PHONY : CMakeFiles/helloworld.x.dir/build

CMakeFiles/helloworld.x.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles\helloworld.x.dir\cmake_clean.cmake
.PHONY : CMakeFiles/helloworld.x.dir/clean

CMakeFiles/helloworld.x.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" C:\Users\Robert\Documents\Documents-Martijn\Technology\Programming\Programming\C++\helloworld C:\Users\Robert\Documents\Documents-Martijn\Technology\Programming\Programming\C++\helloworld C:\Users\Robert\Documents\Documents-Martijn\Technology\Programming\Programming\C++\helloworld\build C:\Users\Robert\Documents\Documents-Martijn\Technology\Programming\Programming\C++\helloworld\build C:\Users\Robert\Documents\Documents-Martijn\Technology\Programming\Programming\C++\helloworld\build\CMakeFiles\helloworld.x.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/helloworld.x.dir/depend


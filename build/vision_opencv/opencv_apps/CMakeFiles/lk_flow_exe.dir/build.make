# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_SOURCE_DIR = /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/build

# Include any dependencies generated for this target.
include vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/depend.make

# Include the progress variables for this target.
include vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/progress.make

# Include the compile flags for this target's objects.
include vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/flags.make

vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.o: vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/flags.make
vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.o: /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/vision_opencv/opencv_apps/src/node/lk_flow.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.o"
	cd /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/build/vision_opencv/opencv_apps && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.o -c /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/vision_opencv/opencv_apps/src/node/lk_flow.cpp

vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.i"
	cd /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/build/vision_opencv/opencv_apps && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/vision_opencv/opencv_apps/src/node/lk_flow.cpp > CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.i

vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.s"
	cd /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/build/vision_opencv/opencv_apps && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/vision_opencv/opencv_apps/src/node/lk_flow.cpp -o CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.s

vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.o.requires:
.PHONY : vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.o.requires

vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.o.provides: vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.o.requires
	$(MAKE) -f vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/build.make vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.o.provides.build
.PHONY : vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.o.provides

vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.o.provides.build: vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.o

# Object files for target lk_flow_exe
lk_flow_exe_OBJECTS = \
"CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.o"

# External object files for target lk_flow_exe
lk_flow_exe_EXTERNAL_OBJECTS =

/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.o
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/build.make
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/libcv_bridge.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_ocl.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_gpu.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_contrib.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /opt/ros/indigo/lib/libdynamic_reconfigure_config_init_mutex.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /opt/ros/indigo/lib/libimage_transport.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /opt/ros/indigo/lib/libmessage_filters.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /opt/ros/indigo/lib/libnodeletlib.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /opt/ros/indigo/lib/libbondcpp.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libuuid.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libtinyxml.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /opt/ros/indigo/lib/libclass_loader.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/libPocoFoundation.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libdl.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /opt/ros/indigo/lib/libroslib.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /opt/ros/indigo/lib/libroscpp.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /opt/ros/indigo/lib/librosconsole.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /opt/ros/indigo/lib/librosconsole_log4cxx.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /opt/ros/indigo/lib/librosconsole_backend_interface.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/liblog4cxx.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /opt/ros/indigo/lib/libroscpp_serialization.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /opt/ros/indigo/lib/librostime.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /opt/ros/indigo/lib/libxmlrpcpp.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /opt/ros/indigo/lib/libcpp_common.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_videostab.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_superres.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_stitching.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_ocl.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_gpu.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_contrib.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_photo.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_legacy.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_video.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_objdetect.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_ml.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_calib3d.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_features2d.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_highgui.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_imgproc.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_flann.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: /usr/lib/x86_64-linux-gnu/libopencv_core.so.2.4.8
/home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow: vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow"
	cd /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/build/vision_opencv/opencv_apps && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lk_flow_exe.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/build: /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/devel/lib/opencv_apps/lk_flow
.PHONY : vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/build

vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/requires: vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/src/node/lk_flow.cpp.o.requires
.PHONY : vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/requires

vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/clean:
	cd /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/build/vision_opencv/opencv_apps && $(CMAKE_COMMAND) -P CMakeFiles/lk_flow_exe.dir/cmake_clean.cmake
.PHONY : vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/clean

vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/depend:
	cd /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/src/vision_opencv/opencv_apps /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/build /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/build/vision_opencv/opencv_apps /home/cc/ee106a/fa15/class/ee106a-as/ros_ws/final_proj/build/vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : vision_opencv/opencv_apps/CMakeFiles/lk_flow_exe.dir/depend

